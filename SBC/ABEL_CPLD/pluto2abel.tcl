
########## Tcl recorder starts at 08/25/18 12:10:35 ##########

set version "2.0"
set proj_dir "Z:/Pluto2/SBC/ABEL_CPLD"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -ojhd only -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 12:10:35 ###########


########## Tcl recorder starts at 08/25/18 12:11:27 ##########

# Commands to make the Process: 
# Constraint Editor
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" address_decoding.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto2abel.bl2\" -omod \"pluto2abel\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto2abel -lci pluto2abel.lct -log pluto2abel.imp -err automake.err -tti pluto2abel.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -blifopt  pluto2abel.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto2abel.bl2 -sweep -mergefb -err automake.err -o pluto2abel.bl3  @pluto2abel.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -dev mach4a -diofft  pluto2abel.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto2abel.bl3 -pla -family AMDMACH -idev van -o pluto2abel.tt2 -oxrf pluto2abel.xrf -err automake.err  @pluto2abel.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto2abel -dir $proj_dir -log pluto2abel.log -tti pluto2abel.tt2 -tto pluto2abel.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -dev mach4a -prefit  pluto2abel.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto2abel.tt3 -out pluto2abel.tt4 -err automake.err -log pluto2abel.log -percent pluto2abel.tte -mod address_decoding  @pluto2abel.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Constraint Editor
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto2abel.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"pluto2abel.lct\" -touch \"pluto2abel.tt4\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lciedit\" @lattice_cmd.rs2"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 12:11:27 ###########


########## Tcl recorder starts at 08/25/18 12:12:36 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv  -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto2abel.tte -o pluto2abel.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto2abel.lct -out pluto2abel.vct -log pluto2abel.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto2abel.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto2abel.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto2abel.tt4\" -vci \"pluto2abel.vct\" -log \"pluto2abel.log\" -eqn \"pluto2abel.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto2abel.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto2abel.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto2abel.vco -out pluto2abel.lco -log pluto2abel.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto2abel -if pluto2abel.jed -j2s -log pluto2abel.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 12:12:36 ###########


########## Tcl recorder starts at 08/25/18 12:14:34 ##########

# Commands to make the Process: 
# Post-Fit Pinouts
# - none -
# Application to view the Process: 
# Post-Fit Pinouts
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto2abel.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -postfit -lci pluto2abel.lco
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lciedit\" @lattice_cmd.rs2"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 12:14:34 ###########


########## Tcl recorder starts at 08/25/18 12:15:46 ##########

# Commands to make the Process: 
# Timing Analysis
# - none -
# Application to view the Process: 
# Timing Analysis
if [runCmd "\"$cpld_bin/timing\" -prj \"pluto2abel\" -tti \"pluto2abel.tt4\" -gui -dir \"$proj_dir\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 12:15:46 ###########


########## Tcl recorder starts at 08/25/18 15:18:05 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -ojhd only -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 15:18:05 ###########


########## Tcl recorder starts at 08/25/18 15:18:17 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv  -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" address_decoding.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto2abel.bl2\" -omod \"pluto2abel\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto2abel -lci pluto2abel.lct -log pluto2abel.imp -err automake.err -tti pluto2abel.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -blifopt  pluto2abel.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto2abel.bl2 -sweep -mergefb -err automake.err -o pluto2abel.bl3  @pluto2abel.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -dev mach4a -diofft  pluto2abel.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto2abel.bl3 -pla -family AMDMACH -idev van -o pluto2abel.tt2 -oxrf pluto2abel.xrf -err automake.err  @pluto2abel.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto2abel -dir $proj_dir -log pluto2abel.log -tti pluto2abel.tt2 -tto pluto2abel.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -dev mach4a -prefit  pluto2abel.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto2abel.tt3 -out pluto2abel.tt4 -err automake.err -log pluto2abel.log -percent pluto2abel.tte -mod address_decoding  @pluto2abel.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto2abel.tte -o pluto2abel.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto2abel.lct -out pluto2abel.vct -log pluto2abel.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto2abel.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto2abel.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto2abel.tt4\" -vci \"pluto2abel.vct\" -log \"pluto2abel.log\" -eqn \"pluto2abel.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto2abel.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto2abel.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto2abel.vco -out pluto2abel.lco -log pluto2abel.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto2abel -if pluto2abel.jed -j2s -log pluto2abel.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 15:18:17 ###########


########## Tcl recorder starts at 08/25/18 15:27:53 ##########

# Commands to make the Process: 
# Compile Test Vectors
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv -sim pluto2abel -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 15:27:53 ###########


########## Tcl recorder starts at 08/25/18 15:28:20 ##########

# Commands to make the Process: 
# Fit Design
if [catch {open pluto2abel.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto2abel.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto2abel.tt4\" -vci \"pluto2abel.vct\" -log \"pluto2abel.log\" -eqn \"pluto2abel.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto2abel.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto2abel.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto2abel.vco -out pluto2abel.lco -log pluto2abel.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto2abel -if pluto2abel.jed -j2s -log pluto2abel.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 15:28:20 ###########


########## Tcl recorder starts at 08/25/18 15:48:33 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -ojhd only -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 15:48:33 ###########


########## Tcl recorder starts at 08/25/18 15:48:42 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -ojhd only -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 15:48:42 ###########


########## Tcl recorder starts at 08/25/18 15:48:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -ojhd only -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 15:48:45 ###########


########## Tcl recorder starts at 08/25/18 15:49:03 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv  -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" address_decoding.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto2abel.bl2\" -omod \"pluto2abel\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto2abel -lci pluto2abel.lct -log pluto2abel.imp -err automake.err -tti pluto2abel.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -blifopt  pluto2abel.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto2abel.bl2 -sweep -mergefb -err automake.err -o pluto2abel.bl3  @pluto2abel.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -dev mach4a -diofft  pluto2abel.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto2abel.bl3 -pla -family AMDMACH -idev van -o pluto2abel.tt2 -oxrf pluto2abel.xrf -err automake.err  @pluto2abel.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto2abel -dir $proj_dir -log pluto2abel.log -tti pluto2abel.tt2 -tto pluto2abel.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -dev mach4a -prefit  pluto2abel.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto2abel.tt3 -out pluto2abel.tt4 -err automake.err -log pluto2abel.log -percent pluto2abel.tte -mod address_decoding  @pluto2abel.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto2abel.tte -o pluto2abel.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto2abel.lct -out pluto2abel.vct -log pluto2abel.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto2abel.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto2abel.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto2abel.tt4\" -vci \"pluto2abel.vct\" -log \"pluto2abel.log\" -eqn \"pluto2abel.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto2abel.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto2abel.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto2abel.vco -out pluto2abel.lco -log pluto2abel.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto2abel -if pluto2abel.jed -j2s -log pluto2abel.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 15:49:03 ###########


########## Tcl recorder starts at 08/25/18 15:49:11 ##########

# Commands to make the Process: 
# Post-Fit Pinouts
# - none -
# Application to view the Process: 
# Post-Fit Pinouts
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto2abel.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -postfit -lci pluto2abel.lco
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lciedit\" @lattice_cmd.rs2"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 08/25/18 15:49:11 ###########


########## Tcl recorder starts at 09/29/18 14:31:26 ##########

# Commands to make the Process: 
# Generate Timing Simulation Files
if [catch {open pluto2abel.rss w} rspFile] {
	puts stderr "Cannot create response file pluto2abel.rss: $rspFile"
} else {
	puts $rspFile "-i \"pluto2abel.tte\" -lib \"$install_dir/ispcpld/dat/mach4a\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"pluto2abel.tte\" -lci \"pluto2abel.lct\" -prj \"pluto2abel\" -dir \"$proj_dir\" -err automake.err -log \"pluto2abel.nrp\" -exf \"address_decoding.exf\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@pluto2abel.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto2abel.rss

########## Tcl recorder end at 09/29/18 14:31:26 ###########


########## Tcl recorder starts at 09/29/18 14:31:58 ##########

# Commands to make the Process: 
# Post-Fit Pinouts
# - none -
# Application to view the Process: 
# Post-Fit Pinouts
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto2abel.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -postfit -lci pluto2abel.lco
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lciedit\" @lattice_cmd.rs2"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/29/18 14:31:58 ###########


########## Tcl recorder starts at 09/29/18 14:49:57 ##########

# Commands to make the Process: 
# Fit Design
if [catch {open pluto2abel.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto2abel.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto2abel.tt4\" -vci \"pluto2abel.vct\" -log \"pluto2abel.log\" -eqn \"pluto2abel.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto2abel.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto2abel.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto2abel.vco -out pluto2abel.lco -log pluto2abel.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto2abel -if pluto2abel.jed -j2s -log pluto2abel.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/29/18 14:49:57 ###########


########## Tcl recorder starts at 09/29/18 14:50:31 ##########

# Commands to make the Process: 
# Generate Timing Simulation Files
if [catch {open pluto2abel.rss w} rspFile] {
	puts stderr "Cannot create response file pluto2abel.rss: $rspFile"
} else {
	puts $rspFile "-i \"pluto2abel.tte\" -lib \"$install_dir/ispcpld/dat/mach4a\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"pluto2abel.tte\" -lci \"pluto2abel.lct\" -prj \"pluto2abel\" -dir \"$proj_dir\" -err automake.err -log \"pluto2abel.nrp\" -exf \"address_decoding.exf\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@pluto2abel.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto2abel.rss

########## Tcl recorder end at 09/29/18 14:50:31 ###########


########## Tcl recorder starts at 09/29/18 14:50:43 ##########

# Commands to make the Process: 
# Timing Analysis
# - none -
# Application to view the Process: 
# Timing Analysis
if [runCmd "\"$cpld_bin/timing\" -prj \"pluto2abel\" -tti \"pluto2abel.tt4\" -gui -dir \"$proj_dir\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/29/18 14:50:43 ###########


########## Tcl recorder starts at 09/29/18 14:50:55 ##########

# Commands to make the Process: 
# Timing Report
if [runCmd "\"$cpld_bin/timer\" -inp \"pluto2abel.tte\" -lci \"pluto2abel.lct\" -stamp \"pluto2abel.trp\" -exf \"address_decoding.exf\" -lco \"pluto2abel.lco\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/29/18 14:50:55 ###########


########## Tcl recorder starts at 09/29/18 14:52:01 ##########

# Commands to make the Process: 
# Constraint Editor
# - none -
# Application to view the Process: 
# Constraint Editor
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto2abel.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"pluto2abel.lct\" -touch \"pluto2abel.tt4\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lciedit\" @lattice_cmd.rs2"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/29/18 14:52:02 ###########


########## Tcl recorder starts at 09/29/18 15:16:13 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv  -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" address_decoding.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto2abel.bl2\" -omod \"pluto2abel\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto2abel -lci pluto2abel.lct -log pluto2abel.imp -err automake.err -tti pluto2abel.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -blifopt  pluto2abel.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto2abel.bl2 -sweep -mergefb -err automake.err -o pluto2abel.bl3  @pluto2abel.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -dev mach4a -diofft  pluto2abel.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto2abel.bl3 -pla -family AMDMACH -idev van -o pluto2abel.tt2 -oxrf pluto2abel.xrf -err automake.err  @pluto2abel.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto2abel -dir $proj_dir -log pluto2abel.log -tti pluto2abel.tt2 -tto pluto2abel.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto2abel.lct -dev mach4a -prefit  pluto2abel.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto2abel.tt3 -out pluto2abel.tt4 -err automake.err -log pluto2abel.log -percent pluto2abel.tte -mod address_decoding  @pluto2abel.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto2abel.tte -o pluto2abel.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto2abel.lct -out pluto2abel.vct -log pluto2abel.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto2abel.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto2abel.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto2abel.tt4\" -vci \"pluto2abel.vct\" -log \"pluto2abel.log\" -eqn \"pluto2abel.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto2abel.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto2abel.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto2abel.vco -out pluto2abel.lco -log pluto2abel.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto2abel -if pluto2abel.jed -j2s -log pluto2abel.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/29/18 15:16:13 ###########


########## Tcl recorder starts at 09/30/18 08:47:04 ##########

# Commands to make the Process: 
# Timing Analysis
# - none -
# Application to view the Process: 
# Timing Analysis
if [runCmd "\"$cpld_bin/timing\" -prj \"pluto2abel\" -tti \"pluto2abel.tt4\" -gui -dir \"$proj_dir\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/30/18 08:47:04 ###########


########## Tcl recorder starts at 09/30/18 08:47:21 ##########

# Commands to make the Process: 
# Post-Fit Pinouts
# - none -
# Application to view the Process: 
# Post-Fit Pinouts
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto2abel.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -postfit -lci pluto2abel.lco
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lciedit\" @lattice_cmd.rs2"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/30/18 08:47:21 ###########


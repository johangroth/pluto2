
########## Tcl recorder starts at 12/24/17 12:33:36 ##########

set version "2.0"
set proj_dir "Z:/Pluto2/SBC/CPLD"
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

########## Tcl recorder end at 12/24/17 12:33:36 ###########


########## Tcl recorder starts at 12/24/17 12:49:53 ##########

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

########## Tcl recorder end at 12/24/17 12:49:53 ###########


########## Tcl recorder starts at 12/24/17 12:50:05 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 12:50:05 ###########


########## Tcl recorder starts at 12/24/17 12:57:01 ##########

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

########## Tcl recorder end at 12/24/17 12:57:01 ###########


########## Tcl recorder starts at 12/24/17 13:15:57 ##########

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

########## Tcl recorder end at 12/24/17 13:15:57 ###########


########## Tcl recorder starts at 12/24/17 13:16:02 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 13:16:02 ###########


########## Tcl recorder starts at 12/24/17 13:16:13 ##########

# Commands to make the Process: 
# Compiled Equations
if [runCmd "\"$cpld_bin/blif2eqn\" address_decoding.bl0 -o address_decoding.eq0  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 13:16:13 ###########


########## Tcl recorder starts at 12/24/17 13:17:42 ##########

# Commands to make the Process: 
# Compile Test Vectors
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv -sim Pluto -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 13:17:42 ###########


########## Tcl recorder starts at 12/24/17 13:18:29 ##########

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

########## Tcl recorder end at 12/24/17 13:18:29 ###########


########## Tcl recorder starts at 12/24/17 13:19:02 ##########

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

########## Tcl recorder end at 12/24/17 13:19:02 ###########


########## Tcl recorder starts at 12/24/17 13:21:29 ##########

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

########## Tcl recorder end at 12/24/17 13:21:29 ###########


########## Tcl recorder starts at 12/24/17 13:29:11 ##########

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

########## Tcl recorder end at 12/24/17 13:29:11 ###########


########## Tcl recorder starts at 12/24/17 13:29:20 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 13:29:20 ###########


########## Tcl recorder starts at 12/24/17 13:29:28 ##########

# Commands to make the Process: 
# Compiled Equations
if [runCmd "\"$cpld_bin/blif2eqn\" address_decoding.bl0 -o address_decoding.eq0  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 13:29:28 ###########


########## Tcl recorder starts at 12/24/17 13:38:04 ##########

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

########## Tcl recorder end at 12/24/17 13:38:04 ###########


########## Tcl recorder starts at 12/24/17 13:38:28 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 13:38:28 ###########


########## Tcl recorder starts at 12/24/17 13:38:35 ##########

# Commands to make the Process: 
# Compiled Equations
if [runCmd "\"$cpld_bin/blif2eqn\" address_decoding.bl0 -o address_decoding.eq0  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 13:38:35 ###########


########## Tcl recorder starts at 12/24/17 13:39:10 ##########

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
if [runCmd "\"$cpld_bin/mblifopt\" address_decoding.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 13:39:10 ###########


########## Tcl recorder starts at 12/24/17 13:39:57 ##########

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

########## Tcl recorder end at 12/24/17 13:39:57 ###########


########## Tcl recorder starts at 12/24/17 13:40:04 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 13:40:04 ###########


########## Tcl recorder starts at 12/24/17 16:35:21 ##########

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

########## Tcl recorder end at 12/24/17 16:35:21 ###########


########## Tcl recorder starts at 12/24/17 16:35:31 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 16:35:31 ###########


########## Tcl recorder starts at 12/24/17 16:35:37 ##########

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
if [runCmd "\"$cpld_bin/mblifopt\" address_decoding.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 16:35:37 ###########


########## Tcl recorder starts at 12/24/17 16:36:13 ##########

# Commands to make the Process: 
# Fitter Report
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 16:36:13 ###########


########## Tcl recorder starts at 12/24/17 16:43:10 ##########

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

########## Tcl recorder end at 12/24/17 16:43:10 ###########


########## Tcl recorder starts at 12/24/17 16:43:17 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 16:43:17 ###########


########## Tcl recorder starts at 12/24/17 16:44:22 ##########

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

########## Tcl recorder end at 12/24/17 16:44:22 ###########


########## Tcl recorder starts at 12/24/17 16:44:31 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 16:44:31 ###########


########## Tcl recorder starts at 12/24/17 16:44:55 ##########

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

########## Tcl recorder end at 12/24/17 16:44:56 ###########


########## Tcl recorder starts at 12/24/17 16:45:00 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 16:45:00 ###########


########## Tcl recorder starts at 12/24/17 16:45:11 ##########

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
if [runCmd "\"$cpld_bin/mblifopt\" address_decoding.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 16:45:11 ###########


########## Tcl recorder starts at 12/24/17 17:09:13 ##########

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

########## Tcl recorder end at 12/24/17 17:09:13 ###########


########## Tcl recorder starts at 12/24/17 17:11:51 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:11:51 ###########


########## Tcl recorder starts at 12/24/17 17:17:37 ##########

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

########## Tcl recorder end at 12/24/17 17:17:37 ###########


########## Tcl recorder starts at 12/24/17 17:17:44 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:17:44 ###########


########## Tcl recorder starts at 12/24/17 17:18:21 ##########

# Commands to make the Process: 
# Hierarchy Browser
# - none -
# Application to view the Process: 
# Hierarchy Browser
if [runCmd "\"$cpld_bin/hierbro\" pluto.jid  address_decoding"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:18:21 ###########


########## Tcl recorder starts at 12/24/17 17:18:49 ##########

# Commands to make the Process: 
# Check Syntax
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -syn  -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:18:49 ###########


########## Tcl recorder starts at 12/24/17 17:18:56 ##########

# Commands to make the Process: 
# Compiled Equations
if [runCmd "\"$cpld_bin/blif2eqn\" address_decoding.bl0 -o address_decoding.eq0  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:18:56 ###########


########## Tcl recorder starts at 12/24/17 17:19:22 ##########

# Commands to make the Process: 
# Fit Design
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:19:22 ###########


########## Tcl recorder starts at 12/24/17 17:20:07 ##########

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

########## Tcl recorder end at 12/24/17 17:20:07 ###########


########## Tcl recorder starts at 12/24/17 17:20:22 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:20:22 ###########


########## Tcl recorder starts at 12/24/17 17:20:43 ##########

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

########## Tcl recorder end at 12/24/17 17:20:43 ###########


########## Tcl recorder starts at 12/24/17 17:20:47 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:20:47 ###########


########## Tcl recorder starts at 12/24/17 17:23:01 ##########

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

########## Tcl recorder end at 12/24/17 17:23:01 ###########


########## Tcl recorder starts at 12/24/17 17:23:21 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:23:21 ###########


########## Tcl recorder starts at 12/24/17 17:23:26 ##########

# Commands to make the Process: 
# Compile Test Vectors
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv -sim Pluto -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:23:26 ###########


########## Tcl recorder starts at 12/24/17 17:23:30 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/mblifopt\" address_decoding.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:23:30 ###########


########## Tcl recorder starts at 12/24/17 17:47:25 ##########

# Commands to make the Process: 
# Timing Analysis
# - none -
# Application to view the Process: 
# Timing Analysis
if [runCmd "\"$cpld_bin/timing\" -prj \"pluto\" -tti \"pluto.tt4\" -gui -dir \"$proj_dir\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:47:25 ###########


########## Tcl recorder starts at 12/24/17 17:47:37 ##########

# Commands to make the Process: 
# Generate Timing Simulation Files
if [catch {open pluto.rss w} rspFile] {
	puts stderr "Cannot create response file pluto.rss: $rspFile"
} else {
	puts $rspFile "-i \"pluto.tte\" -lib \"$install_dir/ispcpld/dat/mach4a\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"pluto.tte\" -lci \"pluto.lct\" -prj \"pluto\" -dir \"$proj_dir\" -err automake.err -log \"pluto.nrp\" -exf \"address_decoding.exf\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@pluto.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rss

########## Tcl recorder end at 12/24/17 17:47:37 ###########


########## Tcl recorder starts at 12/24/17 17:47:53 ##########

# Commands to make the Process: 
# Generate Board-level Stamp Model
if [runCmd "\"$cpld_bin/timer\" -inp \"pluto.tte\" -lci \"pluto.lct\" -stamp \"pluto.trp\" -exf \"address_decoding.exf\" -lco \"pluto.lco\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/stamppar\" -i pluto.trp "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 17:47:53 ###########


########## Tcl recorder starts at 12/24/17 17:55:18 ##########

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

########## Tcl recorder end at 12/24/17 17:55:18 ###########


########## Tcl recorder starts at 12/24/17 18:04:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" ide_interface.abl -ojhd only -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 18:04:25 ###########


########## Tcl recorder starts at 12/24/17 23:05:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" ide_interface.abl -ojhd only -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:05:40 ###########


########## Tcl recorder starts at 12/24/17 23:09:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" ide_interface.abl -ojhd only -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:09:25 ###########


########## Tcl recorder starts at 12/24/17 23:09:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" ide_interface.abl -ojhd only -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:09:35 ###########


########## Tcl recorder starts at 12/24/17 23:23:37 ##########

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

########## Tcl recorder end at 12/24/17 23:23:37 ###########


########## Tcl recorder starts at 12/24/17 23:23:57 ##########

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

########## Tcl recorder end at 12/24/17 23:23:57 ###########


########## Tcl recorder starts at 12/24/17 23:23:58 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:23:58 ###########


########## Tcl recorder starts at 12/24/17 23:24:48 ##########

# Commands to make the Process: 
# Compile Test Vectors
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv -sim Pluto -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:24:48 ###########


########## Tcl recorder starts at 12/24/17 23:33:39 ##########

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

########## Tcl recorder end at 12/24/17 23:33:40 ###########


########## Tcl recorder starts at 12/24/17 23:33:44 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:33:44 ###########


########## Tcl recorder starts at 12/24/17 23:35:18 ##########

# Commands to make the Process: 
# Post-Fit Pinouts
# - none -
# Application to view the Process: 
# Post-Fit Pinouts
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -postfit -lci pluto.lco
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

########## Tcl recorder end at 12/24/17 23:35:18 ###########


########## Tcl recorder starts at 12/24/17 23:38:59 ##########

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

########## Tcl recorder end at 12/24/17 23:38:59 ###########


########## Tcl recorder starts at 12/24/17 23:40:36 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:40:36 ###########


########## Tcl recorder starts at 12/24/17 23:42:07 ##########

# Commands to make the Process: 
# Check Syntax
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -syn  -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:42:07 ###########


########## Tcl recorder starts at 12/24/17 23:42:10 ##########

# Commands to make the Process: 
# Compiler Listing
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -syn -list  -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:42:10 ###########


########## Tcl recorder starts at 12/24/17 23:42:26 ##########

# Commands to make the Process: 
# Compiled Equations
if [runCmd "\"$cpld_bin/blif2eqn\" address_decoding.bl0 -o address_decoding.eq0  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:42:26 ###########


########## Tcl recorder starts at 12/24/17 23:44:42 ##########

# Commands to make the Process: 
# Post-Fit Pinouts
# - none -
# Application to view the Process: 
# Post-Fit Pinouts
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -postfit -lci pluto.lco
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

########## Tcl recorder end at 12/24/17 23:44:42 ###########


########## Tcl recorder starts at 12/24/17 23:51:04 ##########

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

########## Tcl recorder end at 12/24/17 23:51:04 ###########


########## Tcl recorder starts at 12/24/17 23:51:15 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:51:15 ###########


########## Tcl recorder starts at 12/24/17 23:51:27 ##########

# Commands to make the Process: 
# Post-Fit Pinouts
# - none -
# Application to view the Process: 
# Post-Fit Pinouts
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -postfit -lci pluto.lco
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

########## Tcl recorder end at 12/24/17 23:51:27 ###########


########## Tcl recorder starts at 12/24/17 23:52:01 ##########

# Commands to make the Process: 
# Timing Report
if [runCmd "\"$cpld_bin/timer\" -inp \"pluto.tte\" -lci \"pluto.lct\" -stamp \"pluto.trp\" -exf \"address_decoding.exf\" -lco \"pluto.lco\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/24/17 23:52:01 ###########


########## Tcl recorder starts at 12/25/17 10:28:59 ##########

# Commands to make the Process: 
# ABEL Test Vector Template
if [runCmd "\"$cpld_bin/blif2eqn\" address_decoding.bl0 -o address_decoding.abt -testfix -template \"$install_dir/ispcpld/plsi/abel/plsiabt.tft\" -prj pluto -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 10:28:59 ###########


########## Tcl recorder starts at 12/25/17 10:36:30 ##########

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

########## Tcl recorder end at 12/25/17 10:36:30 ###########


########## Tcl recorder starts at 12/25/17 10:36:35 ##########

# Commands to make the Process: 
# Compile Test Vectors
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv -sim Pluto -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 10:36:35 ###########


########## Tcl recorder starts at 12/25/17 10:37:40 ##########

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

########## Tcl recorder end at 12/25/17 10:37:40 ###########


########## Tcl recorder starts at 12/25/17 10:37:43 ##########

# Commands to make the Process: 
# Compile Test Vectors
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv -sim Pluto -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 10:37:43 ###########


########## Tcl recorder starts at 12/25/17 10:47:02 ##########

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

########## Tcl recorder end at 12/25/17 10:47:02 ###########


########## Tcl recorder starts at 12/25/17 10:47:08 ##########

# Commands to make the Process: 
# Compile Test Vectors
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv -sim Pluto -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 10:47:08 ###########


########## Tcl recorder starts at 12/25/17 10:48:04 ##########

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

########## Tcl recorder end at 12/25/17 10:48:04 ###########


########## Tcl recorder starts at 12/25/17 10:48:08 ##########

# Commands to make the Process: 
# Compile Test Vectors
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv -sim Pluto -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 10:48:08 ###########


########## Tcl recorder starts at 12/25/17 10:59:04 ##########

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

########## Tcl recorder end at 12/25/17 10:59:04 ###########


########## Tcl recorder starts at 12/25/17 11:34:12 ##########

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

########## Tcl recorder end at 12/25/17 11:34:12 ###########


########## Tcl recorder starts at 12/25/17 11:34:14 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 11:34:14 ###########


########## Tcl recorder starts at 12/25/17 11:34:33 ##########

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

########## Tcl recorder end at 12/25/17 11:34:33 ###########


########## Tcl recorder starts at 12/25/17 11:34:35 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -mod address_decoding -ojhd compile -ret -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 11:34:35 ###########


########## Tcl recorder starts at 12/25/17 11:34:39 ##########

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
if [runCmd "\"$cpld_bin/mblifopt\" address_decoding.bl0 -collapse none -reduce none -keepwires  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 11:34:39 ###########


########## Tcl recorder starts at 12/25/17 19:56:43 ##########

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

########## Tcl recorder end at 12/25/17 19:56:43 ###########


########## Tcl recorder starts at 12/25/17 20:02:32 ##########

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

########## Tcl recorder end at 12/25/17 20:02:32 ###########


########## Tcl recorder starts at 12/25/17 20:02:37 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 20:02:37 ###########


########## Tcl recorder starts at 12/25/17 20:23:23 ##########

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

########## Tcl recorder end at 12/25/17 20:23:23 ###########


########## Tcl recorder starts at 12/25/17 20:23:25 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
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
	puts $rspFile "-src pluto.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"pluto.lct\" -touch \"pluto.tt4\"
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

########## Tcl recorder end at 12/25/17 20:23:25 ###########


########## Tcl recorder starts at 12/25/17 20:25:40 ##########

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

########## Tcl recorder end at 12/25/17 20:25:40 ###########


########## Tcl recorder starts at 12/25/17 20:25:45 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 20:25:45 ###########


########## Tcl recorder starts at 12/25/17 20:26:05 ##########

# Commands to make the Process: 
# Timing Analysis
# - none -
# Application to view the Process: 
# Timing Analysis
if [runCmd "\"$cpld_bin/timing\" -prj \"pluto\" -tti \"pluto.tt4\" -gui -dir \"$proj_dir\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 20:26:05 ###########


########## Tcl recorder starts at 12/25/17 20:26:19 ##########

# Commands to make the Process: 
# Generate Timing Simulation Files
if [catch {open pluto.rss w} rspFile] {
	puts stderr "Cannot create response file pluto.rss: $rspFile"
} else {
	puts $rspFile "-i \"pluto.tte\" -lib \"$install_dir/ispcpld/dat/mach4a\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"pluto.tte\" -lci \"pluto.lct\" -prj \"pluto\" -dir \"$proj_dir\" -err automake.err -log \"pluto.nrp\" -exf \"address_decoding.exf\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@pluto.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rss

########## Tcl recorder end at 12/25/17 20:26:19 ###########


########## Tcl recorder starts at 12/25/17 20:26:24 ##########

# Commands to make the Process: 
# Generate Board-level Stamp Model
if [runCmd "\"$cpld_bin/timer\" -inp \"pluto.tte\" -lci \"pluto.lct\" -stamp \"pluto.trp\" -exf \"address_decoding.exf\" -lco \"pluto.lco\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/stamppar\" -i pluto.trp "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 20:26:24 ###########


########## Tcl recorder starts at 12/25/17 21:00:03 ##########

# Commands to make the Process: 
# Post-Fit Pinouts
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Post-Fit Pinouts
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -postfit -lci pluto.lco
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

########## Tcl recorder end at 12/25/17 21:00:03 ###########


########## Tcl recorder starts at 12/25/17 21:17:49 ##########

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

########## Tcl recorder end at 12/25/17 21:17:49 ###########


########## Tcl recorder starts at 12/25/17 21:18:48 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 21:18:49 ###########


########## Tcl recorder starts at 12/25/17 21:18:57 ##########

# Commands to make the Process: 
# Timing Analysis
# - none -
# Application to view the Process: 
# Timing Analysis
if [runCmd "\"$cpld_bin/timing\" -prj \"pluto\" -tti \"pluto.tt4\" -gui -dir \"$proj_dir\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 21:18:57 ###########


########## Tcl recorder starts at 12/25/17 21:19:07 ##########

# Commands to make the Process: 
# Generate Timing Simulation Files
if [catch {open pluto.rss w} rspFile] {
	puts stderr "Cannot create response file pluto.rss: $rspFile"
} else {
	puts $rspFile "-i \"pluto.tte\" -lib \"$install_dir/ispcpld/dat/mach4a\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"pluto.tte\" -lci \"pluto.lct\" -prj \"pluto\" -dir \"$proj_dir\" -err automake.err -log \"pluto.nrp\" -exf \"address_decoding.exf\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@pluto.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rss

########## Tcl recorder end at 12/25/17 21:19:07 ###########


########## Tcl recorder starts at 12/25/17 21:19:10 ##########

# Commands to make the Process: 
# Generate Board-level Stamp Model
if [runCmd "\"$cpld_bin/timer\" -inp \"pluto.tte\" -lci \"pluto.lct\" -stamp \"pluto.trp\" -exf \"address_decoding.exf\" -lco \"pluto.lco\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/stamppar\" -i pluto.trp "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 21:19:10 ###########


########## Tcl recorder starts at 12/25/17 21:21:46 ##########

# Commands to make the Process: 
# Timing Report
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/timer\" -inp \"pluto.tte\" -lci \"pluto.lct\" -stamp \"pluto.trp\" -exf \"address_decoding.exf\" -lco \"pluto.lco\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 12/25/17 21:21:46 ###########


########## Tcl recorder starts at 12/25/17 21:22:28 ##########

# Commands to make the Process: 
# Generate Timing Simulation Files
if [catch {open pluto.rss w} rspFile] {
	puts stderr "Cannot create response file pluto.rss: $rspFile"
} else {
	puts $rspFile "-i \"pluto.tte\" -lib \"$install_dir/ispcpld/dat/mach4a\" -strategy top -sdfmdl \"$install_dir/ispcpld/dat/sdf.mdl\" -simmdl \"$install_dir/ispcpld/dat/sim.mdl\" -pla \"pluto.tte\" -lci \"pluto.lct\" -prj \"pluto\" -dir \"$proj_dir\" -err automake.err -log \"pluto.nrp\" -exf \"address_decoding.exf\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/sdf\" \"@pluto.rss\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rss

########## Tcl recorder end at 12/25/17 21:22:28 ###########


########## Tcl recorder starts at 01/23/18 19:12:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/23/18 19:12:52 ###########


########## Tcl recorder starts at 01/23/18 19:36:13 ##########

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

########## Tcl recorder end at 01/23/18 19:36:13 ###########


########## Tcl recorder starts at 01/31/18 00:15:29 ##########

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
if [runCmd "\"$cpld_bin/sch2jhd\" address_decoding.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 00:15:29 ###########


########## Tcl recorder starts at 01/31/18 00:26:18 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 00:26:18 ###########


########## Tcl recorder starts at 01/31/18 00:38:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 00:38:11 ###########


########## Tcl recorder starts at 01/31/18 00:42:38 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 00:42:38 ###########


########## Tcl recorder starts at 01/31/18 00:44:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 00:44:46 ###########


########## Tcl recorder starts at 01/31/18 00:47:07 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 00:47:07 ###########


########## Tcl recorder starts at 01/31/18 19:07:42 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 19:07:42 ###########


########## Tcl recorder starts at 01/31/18 19:14:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 19:14:25 ###########


########## Tcl recorder starts at 01/31/18 19:54:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 19:54:16 ###########


########## Tcl recorder starts at 01/31/18 20:20:38 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 20:20:38 ###########


########## Tcl recorder starts at 01/31/18 20:37:14 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 20:37:14 ###########


########## Tcl recorder starts at 01/31/18 20:43:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 20:43:03 ###########


########## Tcl recorder starts at 01/31/18 20:44:49 ##########

# Commands to make the Process: 
# Fit Design
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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 20:44:50 ###########


########## Tcl recorder starts at 01/31/18 20:45:32 ##########

# Commands to make the Process: 
# Post-Fit Pinouts
if [runCmd "\"$cpld_bin/ahdl2blf\" address_decoding.abl -vec -ovec address_decoding.tmv  -def _AMDMACH_ _MACH_ _MACH2_ _MACH4_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Post-Fit Pinouts
if [catch {open lattice_cmd.rs2 w} rspFile] {
	puts stderr "Cannot create response file lattice_cmd.rs2: $rspFile"
} else {
	puts $rspFile "-src pluto.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -postfit -lci pluto.lco
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

########## Tcl recorder end at 01/31/18 20:45:32 ###########


########## Tcl recorder starts at 01/31/18 20:46:41 ##########

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

########## Tcl recorder end at 01/31/18 20:46:41 ###########


########## Tcl recorder starts at 01/31/18 20:46:57 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
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
	puts $rspFile "-src pluto.tt4 -type PLA -devfile \"$install_dir/ispcpld/dat/mach4a/mach463ace.dev\" -lci \"pluto.lct\" -touch \"pluto.tt4\"
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

########## Tcl recorder end at 01/31/18 20:46:57 ###########


########## Tcl recorder starts at 01/31/18 20:47:18 ##########

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
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 20:47:18 ###########


########## Tcl recorder starts at 01/31/18 22:55:35 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup ide.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"ide.bls\" -o \"ide.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i ide.bl0 -o ide.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"ide.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod ide  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 22:55:35 ###########


########## Tcl recorder starts at 01/31/18 23:02:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 23:02:55 ###########


########## Tcl recorder starts at 01/31/18 23:03:24 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/sch2blf\" -dev Lattice -sup ide.sch  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"ide.bls\" -o \"ide.bl0\" -ipo  -family -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" -i ide.bl0 -o ide.bl1 -collapse none -reduce none  -err automake.err -keepwires -family"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblflink\" \"ide.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod ide  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"NoInput.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 23:03:24 ###########


########## Tcl recorder starts at 01/31/18 23:05:07 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 01/31/18 23:05:07 ###########


########## Tcl recorder starts at 02/01/18 00:42:25 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/01/18 00:42:25 ###########


########## Tcl recorder starts at 02/01/18 00:49:08 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/01/18 00:49:08 ###########


########## Tcl recorder starts at 02/01/18 00:49:44 ##########

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

########## Tcl recorder end at 02/01/18 00:49:44 ###########


########## Tcl recorder starts at 02/01/18 00:49:50 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/01/18 00:49:50 ###########


########## Tcl recorder starts at 02/01/18 00:50:26 ##########

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

########## Tcl recorder end at 02/01/18 00:50:26 ###########


########## Tcl recorder starts at 02/01/18 00:51:17 ##########

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

########## Tcl recorder end at 02/01/18 00:51:17 ###########


########## Tcl recorder starts at 02/01/18 00:57:43 ##########

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

########## Tcl recorder end at 02/01/18 00:57:43 ###########


########## Tcl recorder starts at 02/01/18 01:00:23 ##########

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

########## Tcl recorder end at 02/01/18 01:00:23 ###########


########## Tcl recorder starts at 02/01/18 01:02:17 ##########

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
if [runCmd "\"$cpld_bin/mblflink\" \"address_decoding.bl1\" -o \"pluto.bl2\" -omod \"pluto\"  -err \"automake.err\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/impsrc\"  -prj pluto -lci pluto.lct -log pluto.imp -err automake.err -tti pluto.bl2 -dir $proj_dir"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -blifopt  pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mblifopt\" pluto.bl2 -sweep -mergefb -err automake.err -o pluto.bl3  @pluto.b2_"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -diofft  pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/mdiofft\" pluto.bl3 -pla -family AMDMACH -idev van -o pluto.tt2 -oxrf pluto.xrf -err automake.err  @pluto.d0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/tt2tott3\" -prj pluto -dir $proj_dir -log pluto.log -tti pluto.tt2 -tto pluto.tt3"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/abelvci\" -vci pluto.lct -dev mach4a -prefit  pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/prefit\" -inp pluto.tt3 -out pluto.tt4 -err automake.err -log pluto.log -percent pluto.tte -mod address_decoding  @pluto.l0"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" pluto.tte -o pluto.eq3 -use_short -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/lci2vci\" -lci pluto.lct -out pluto.vct -log pluto.l2v"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pluto.rsp w} rspFile] {
	puts stderr "Cannot create response file pluto.rsp: $rspFile"
} else {
	puts $rspFile "-inp \"pluto.tt4\" -vci \"pluto.vct\" -log \"pluto.log\" -eqn \"pluto.eq3\" -dev mach463a -dat \"$install_dir/ispcpld/dat/mach4a/\" -msg \"$install_dir/ispcpld/dat/\" -err automake.err -tmv \"address_decoding.tmv\" 
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/machfitr\" \"@pluto.rsp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pluto.rsp
if [runCmd "\"$cpld_bin/lci2vci\" -vci pluto.vco -out pluto.lco -log pluto.v2l"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj pluto -if pluto.jed -j2s -log pluto.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/01/18 01:02:17 ###########


########## Tcl recorder starts at 02/11/18 18:51:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/11/18 18:51:03 ###########


########## Tcl recorder starts at 02/13/18 20:06:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/18 20:06:19 ###########


########## Tcl recorder starts at 02/13/18 20:19:46 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/18 20:19:46 ###########


########## Tcl recorder starts at 02/13/18 20:35:07 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/18 20:35:07 ###########


########## Tcl recorder starts at 02/13/18 20:36:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/18 20:36:16 ###########


########## Tcl recorder starts at 02/13/18 21:24:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/18 21:24:59 ###########


########## Tcl recorder starts at 02/13/18 21:36:51 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/sch2jhd\" ide.sch "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/18 21:36:51 ###########


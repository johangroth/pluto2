
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


INCLUDE_SRCS = include/*.inc
ASM_SRCS = *.asm

pluto.bin: ${ASM_SRCS} ${INCLUDE_SRCS}
	64tass -Demulator=false -o pluto.bin --nostart --no-monitor --line-numbers --tab-size=1 --list=pluto.lst main.asm

emu.bin: ${ASM_SRCS} ${INCLUDE_SRCS}
	64tass -Demulator=true -o emu.bin --nostart --no-monitor --line-numbers --tab-size=1 --list=emu.lst main.asm

test_prg.bin: test_prg.asm via.asm
	64tass -Demulator=false -o test_prg.bin --nostart --no-monitor --line-numbers --tab-size=1 --list=test_prg.lst test_prg.asm


clean:
	rm  -f *.bin *.hex *.lst *~

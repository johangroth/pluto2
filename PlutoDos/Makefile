INCLUDE_SRCS = include/*.inc
ASM_SRCS = *.asm
OBJS = *.o

pluto: ${OBJS}
	ld65 -C plutomon.config -vm -m pluto.map -o pluto.bin ${OBJS}

${OBJS}: ${ASM_SRCS} ${INCLUDE_SRCS}
	ca65 -Demulator=0 --cpu 65C02 --listing pluto.lst -o pluto.o main.asm

emu.bin: ${ASM_SRCS} ${INCLUDE_SRCS}
	ca65 -Demulator=true -o emu.bin --nostart --no-monitor --line-numbers --tab-size=1 --list=emu.lst main.asm

test_prg.bin: test_prg.asm via.asm
	ca65 -Demulator=false -o test_prg.bin --nostart --no-monitor --line-numbers --tab-size=1 --list=test_prg.lst test_prg.asm


clean:
	rm  -f *.bin *.hex *.lst *~

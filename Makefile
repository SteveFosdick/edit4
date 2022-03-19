all: edit-nmos.rom edit-high.rom

edit-nmos.rom edit-nmos.lst: nmos-defaults.asm bbcapi.asm edit-nmos.asm
	laxasm -o edit-nmos.rom -l edit-nmos.lst nmos-defaults.asm bbcapi.asm edit-nmos.asm
	cmp edit-nmos.rom edit-nmos.cmp

edit-high.rom edit-high.lst: high-defaults.asm bbcapi.asm edit-nmos.asm
	laxasm -o edit-high.rom -l edit-high.lst high-defaults.asm bbcapi.asm edit-nmos.asm
	cmp edit-high.rom edit-high.cmp

edit110.diff: rom.hex bin.hex
	diff -u rom.hex bin.hex > edit110.diff

rom.hex: edit110.rom
	xdump edit110.rom > rom.hex

bin.hex: edit110.bin
	xdump edit110.bin > bin.hex

edit110.bin: edit110.asm
	beebasm -v -i edit110.asm > edit110.log

#edit110.asm: edit110.ctl edit110.sym bbc.sym
#	beebdis edit110.ctl

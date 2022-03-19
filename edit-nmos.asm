	TTL     EDIT Text Editor

; This is a BBC Micro version of the Acorn EDIT text editor which
; appeared in various versions as the editor for the the ISO Pascal
; system, as part of Acorn's 6502 development system and on the Master
; as the built-in editor.
;
; The source code in this file comes from a disassembly done at
; SJ Research research with names and comments copied from original
; Acorn source for a later, CMOS 6502 version intended for the
; 2nd processor/Master.
;
; The assembler syntax is ADE/ADE+/Lancaster.

; Declarations, mostly characters.

nop	EQU     &EA
lf	EQU	&0A
cr	EQU	&0D
tab	EQU	&09
down	EQU	lf
up	EQU	&0B
home	EQU	&1E
space	EQU	' '
delete	EQU	&7F

	IF	lfver
termin	EQU	lf
	ELSE
termin	EQU	cr
	FI

; Symbolic names for the bits of a byte.

bit7    EQU     &80
bit6    EQU     &40
bit5    EQU     &20
bit4    EQU     &10
bit3    EQU     &08
bit2    EQU     &04
bit1    EQU     &02
bit0    EQU     &01

blink   EQU     bit6
fblink  EQU     bit5

; Different styles of cursor.

fcstrt  EQU     &00             ; Full cursor start line
ncstrt  EQU     &07             ; Normal start line

; Constants controlling the refresh of the screen.  Though this uses
; DSECT and the DS directive, this is actually an enumeration.

	DSECT
	ORG	&01
csrtoc	DS	1
csronw	DS	1
hardup	DS	1
harddo	DS	1
fullsc	DS	1
thelot	DS	1
	DEND

; Zero page workspace.  Some locations are used for more than one
; thing by different parts of the editor.

	DSECT
	ORG	&80
multsy	DS	1
notsym	DS	1
wildsy	DS	1
alphas	DS	1
digsym	DS	1
subsy	DS	1
setsym	DS	1
field	DS	1
founds	DS	1
escsym	DS	1
nsensy	DS	1
buttsy	DS	1
termsy	DS	1
	DEND

	DSECT
	ORG	&00
string	DS	2
paje	DS	2
tmax	DS	2
temp	DS	2
addr	DS	2
argp	DS	2
varp	DS	2
TP	DS	2
GS	DS	2
GE	DS	2
MS	DS	2
xeff	EQU	MS
lastsp	EQU	MS+1
me	DS	2
diff	EQU	me
centre	EQU	me+1
smatlo	DS	2
rflush	EQU	smatlo
linfed	EQU	smatlo+1
smathi	DS	2
len	EQU	smathi
indent	EQU	smathi+1
umatlo	DS	2
underl	EQU	umatlo
pundrl	EQU	umatlo+1
umathi	DS	2
bold	EQU	umathi
vspace	EQU	umathi+1

        IF	cf8key
clterm  DS      1  		; current line terminator
        FI
        IF      extgf		; Extended search/replace characters
ctptr   DS	2		; current text pointer
        FI

hymem	DS	2
tstart	DS	2
brkact	DS	1
size	DS	2
maxsiz	DS	2
pwtflg	DS	1
prtflg	DS	1
tutmod	DS	1
atemp	DS	1
count	DS	1
index	DS	1
pagewi	DS	1
pagele	DS	1
realPA	DS	1
scrupY	DS	1
maxscr	DS	1
update	DS	1
scrnPY	DS	1
scrnX	DS	1
scrnY	DS	1
lnbufx	DS	1
cursed	DS	1
sstckx	DS	1
fill	EQU	sstckx
replin	DS	1
tinden	EQU	replin
chunks	DS	2
juslen	EQU	chunks
spaces	EQU	chunks+1
nummar	DS	1
L	EQU	nummar
marksb	DS	1
Q	EQU	marksb
currle	DS	1
nextre	DS	1
nxtchr	DS	1
lineDW	DS	1
fieldI	DS	1
lineot	EQU	fieldI
inpind	DS	1
ctlcha	EQU	inpind
outind	DS	1
boldrq	EQU	outind
MMX	DS	1
undrrq	EQU	mmx
offset	DS	1		; page offset.
simpch	DS	1
pbold	EQU	simpch
nextX	DS	1
lastta	EQU	nextx
line	DS	2
doindX	EQU	line
indexH	DS	1
mulffl	DS	1
tabcha	EQU	mulffl
markX	DS	1
TSM	DS	1
BSM	DS	1
scratc	DS	&12
buff	EQU	scratc+10	; (no.bffr len 15 {MMMDCCCLXXXVIII})
texpfl	EQU	buff
sensfl	EQU	buff+1
buttfl	EQU	buff+2
metafl	EQU	buff+3
replfl	EQU	buff+4
endp	EQU	buff+8
scp	EQU	buff+10
texp	EQU	buff+12
mousel	EQU	buff+15

	IF	stamp
flexec	DS	4
flload	DS	4
	FI
	DEND

	DSECT
	ORG	&0400
frbuff  DS      &64
grbuff  DS      &64
nambuf  DS      &34
oldsta  DS      &04             ; start and end of incore text
linbuf  DS      &0100
comman  EQU     linbuf
noregs  EQU     comman          ; 10 number registers
page    EQU     noregs          ; the page number is in 0
lineno  EQU     page + 2        ; the line number is in 1
pageeh  EQU     noregs + 10 * 2
pageoh  EQU     pageeh + 2
pageef  EQU     pageoh + 2
pageof  EQU     pageef + 2      ; the header and footer pointers
tablst  EQU     pageof + 2      ; list of tab positions, length 20
maclst  EQU     tablst + 20     ; list of posible macro positions
stracc  DS      &0100
maxmac  EQU     stracc - maclst ; Number of macro posns *2

trnlst  EQU     stracc          ; table of translateable characters

	IF	cf8key
dhsize	EQU	6		; Default header text size.
	DS	dhsize
dfsize	EQU	20		; Default footer text size.
	DS	dfsize
	FI

sindex  DS      &06
ssttlo  DS      &06
sstthi  DS      &06
scntlo  DS      &06
scnthi  DS      &06
fieldm  DS      &0A
fieldo  DS      &0A
scrim   DS      &20
	DEND

crFlag  EQU     %00100000
insOver EQU     %00010000
tabMode EQU     %00001000

markCnt EQU     &004F

brkZP   EQU     &00FD

j14     EQU     &0014
j15     EQU     &0015
j16     EQU     &0016
j17     EQU     &0017
j18     EQU     &0018
j19     EQU     &0019
j1A     EQU     &001A
j1B     EQU     &001B
j1C     EQU     &001C
j1D     EQU     &001D
j1E     EQU     &001E
j1F     EQU     &001F
j3A     EQU     &003A
j3B     EQU     &003B
j3C     EQU     &003C
j3D     EQU     &003D
j3E     EQU     &003E
j3F     EQU     &003F
j44     EQU     &0044
j45     EQU     &0045
j46     EQU     &0046
j47     EQU     &0047
j49     EQU     &0049
j4A     EQU     &004A
j4B     EQU     &004B
j4C     EQU     &004C
j4E     EQU     &004E

j52     EQU     &0052
j53     EQU     &0053
j54     EQU     &0054
j55     EQU     &0055
j56     EQU     &0056
j57     EQU     &0057
j58     EQU     &0058
j59     EQU     &0059
j5A     EQU     &005A
j5B     EQU     &005B
j5C     EQU     &005C
j5D     EQU     &005D
j5E     EQU     &005E
j5F     EQU     &005F
j60     EQU     &0060
j61     EQU     &0061
j62     EQU     &0062
j63     EQU     &0063
j64     EQU     &0064
j65     EQU     &0065
j66     EQU     &0066
j67     EQU     &0067
j68     EQU     &0068
j69     EQU     &0069
j6C     EQU     &006C
j6D     EQU     &006D
j6E     EQU     &006E
j6F     EQU     &006F
j70     EQU     &0070
j72     EQU     &0072
j73     EQU     &0073
j74     EQU     &0074
j75     EQU     &0075
j76     EQU     &0076
j78     EQU     &0078
j79     EQU     &0079
j7C     EQU     &007C
j7D     EQU     &007D
j7E     EQU     &007E
j7F     EQU     &007F
j85     EQU     &0085
j86     EQU     &0086
j87     EQU     &0087
j89     EQU     &0089
j8B     EQU     &008B
j8D     EQU     &008D
j97     EQU     &0097
j98     EQU     &0098
j9B     EQU     &009B
j9D     EQU     &009D
jA0     EQU     &00A0
jA2     EQU     &00A2
jA6     EQU     &00A6
jA7     EQU     &00A7
jA8     EQU     &00A8
jA9     EQU     &00A9
jAC     EQU     &00AC
jAE     EQU     &00AE
jAF     EQU     &00AF
jB0     EQU     &00B0
jB1     EQU     &00B1
jB3     EQU     &00B3
jB4     EQU     &00B4
jBC     EQU     &00BC
jBD     EQU     &00BD
jC5     EQU     &00C5
jC9     EQU     &00C9
jCE     EQU     &00CE
jD8     EQU     &00D8
jE8     EQU     &00E8
jEA     EQU     &00EA
jEB     EQU     &00EB
jEE     EQU     &00EE
jEF     EQU     &00EF
jF0     EQU     &00F0
jF2     EQU     &00F2
jFE     EQU     &00FE
jFF     EQU     &00FF

j020E   EQU     &020E
j0400   EQU     &0400
j0463   EQU     &0463
j0464   EQU     &0464
j04C7   EQU     &04C7
j04C8   EQU     &04C8
j04FB   EQU     &04FB
j04FC   EQU     &04FC
j04FD   EQU     &04FD
j04FE   EQU     &04FE
j04FF   EQU     &04FF
j0500   EQU     &0500
j0501   EQU     &0501
j0502   EQU     &0502
j0503   EQU     &0503
j0514   EQU     &0514
j0515   EQU     &0515
j0516   EQU     &0516
j0517   EQU     &0517
j0518   EQU     &0518
j0519   EQU     &0519
j051A   EQU     &051A
j051B   EQU     &051B
j052F   EQU     &052F
j0530   EQU     &0530
j0531   EQU     &0531
j05FE   EQU     &05FE
j05FF   EQU     &05FF
j0600   EQU     &0600
j0601   EQU     &0601
j060A   EQU     &060A
j0700   EQU     &0700
j0706   EQU     &0706
j070C   EQU     &070C
j0712   EQU     &0712
j0718   EQU     &0718
j071E   EQU     &071E
j0728   EQU     &0728
j0732   EQU     &0732
j0733   EQU     &0733
jEA0B   EQU     &EA0B

        ORG     &8000

; ==============================================================================
; = Start of Edit! (Rom header)
; ==============================================================================

        JMP     langua
	IF	reladd
	JMP     ((servic - origin) + &8000)
        DFB     %11100010	; Language, Service, Relocation address.
	ELSE
	JMP	servic
	DFB	%11000010	; Language, Service.
	FI
        DFB     >copyri
        DFB     &01
        ASC     "Edit"
        BRK
        ASC     "1.00"
copyri  BRK
        ASC     "(C)1984 Acorn"
        BRK
        IF	reladd
        DW	reladd
        DW	0
        FI

; ==============================================================================
; = Now the BRK handler
; ==============================================================================

        ; Outputs 'brk' error message, & jumps to relevant re-entry
        ; point. Detailed action depends on value of 'brkaction' on entry -
        ; brkaction = 0 Moves cursor to editor status position,
        ; outputs error message, then prompts for space
        ; before jumping to editcont.
        ; 1    Outputs error message, and jumps to starloop.
        ; 2    resets to start of file and closes indexfile, then as 0

brk     LDX     #&FF
        TXS                     ;  reset the stack pointer
        LDY     #&00
        STY     cursed
        LDA     #&7E
        JSR     OSBYTE          ;  Acknowledge the ESCAPE condition
        LDA     BRKact
        CMP     #&FF
        BNE     simBRK

unret   LDA     addr
        BNE     unretA
        DEC     addr+1

unretA  DEC     addr
        LDA     argP
        BNE     unretB
        DEC     argP + 1

unretB  DEC     argP
        LDA     (argP),Y
        STA     (addr),Y
        LDA     addr
        BNE     unret
        LDA     addr+1
        CMP     string+1
        BNE     unret
        LDA     #cr
        STA     (tmax),Y
        LDA     #&00

simBRK  CMP     #&01
        BEQ     simBK1
        BCC     norBRK
        JSR     closeX
        JSR     key_ctrl_up

norBRK  JSR     vstrng
        DATA    3,15
        NOP
        JSR     csr0ST
        JSR     supvbr
        JSR     cursorOff
        LDA     tutmod
        AND     #&07
        CMP     #&05
        BEQ     nomess
        LDY     #&00
        LDA     (brkZP),Y
        CMP     #&01
        BNE     nomess
        JSR     vstrng
        DATA    "For help type: shf-f5 D RETURN",10,13
        NOP

nomess  JSR     strimo
        ASC     "Press ESCAPE to continue"
        NOP

esclop  JSR     OSRDCH
        CMP     #&1B
        BNE     esclop

esccon  LDA     #&7E
        JSR     OSBYTE
        JSR     normal
        JMP     editco

simBK1  JSR     supvbr
        JMP     starlo

supvbr  JSR     OSNEWL
brkoy   LDY     #&01
brkolp  LDA     (brkZP),Y
        BEQ     brkox
        JSR     OSASCI
        INY
        BNE     brkolp
brkox   JMP     OSNEWL

; ==============================================================================
; = ROM Service Entry
; ==============================================================================

servic  CMP     #&04
        BEQ     unknow		; Unrecognised command.
        CMP     #&09
        BNE     servex		; Not *HELP.
        TYA
        PHA
        LDY     #&08
helpLO  IF	reladd
	LDA     helpin-reladr)+&8000,Y
	ELSE
	LDA	helpin,Y
	FI
        JSR     OSASCI
        DEY
        BPL     helpLO
        PLA
        TAY
        LDA     #&09
servex  RTS

helpin  DATA    13,"4v "
cmd     DATA    "TIDE",13

unknow  TYA
        PHA
        TXA
        PHA
        LDX     #&03
ucomLO  LDA     (&F2),Y
        CMP     #"."
        BEQ     ucommi
        AND     #&DF
        IF	reladd
        CMP	(cmd-reladd)+&8000,X
        ELSE
        CMP     cmd,X
        FI
        BNE     ucomEX
        INY
        DEX
        BPL     ucomLO
        LDA     (&F2),Y
        CMP     #" "+1
        BCC     ucommi
ucomEX  PLA
        TAX
        PLA
        TAY
        LDA     #&04
        RTS

ucommi  PLA
        TAX
        LDA     #&8E		; Start this ROM as a language.
        JMP     OSBYTE

; ==============================================================================
; = ROM Language Entry
; ==============================================================================

langua  CLI
        CLD
        LDX     #&FF
        TXS
        LDA     #&03		; Turn off the printer (if ON)
        JSR     OSWRCH
        LDA     #>brk		; Install our BRK handler.
        STA     brkv
        LDA     #<brk
        STA     brkv+1
        LDX     #&FF
        STX     cursed
        LDY     #&00
        STY     indexH
        LDA     #&0D
        STA     nambuf
        IF	cf8key
        LDA	clterm
        FI
        CMP     (paje),Y	; Check for existing text.
        BNE     EDIToy
        CMP     (tmax),Y
        BNE     EDIToy
        JSR     memsta
EDIToy  LDY     #&10		; Default mode and flags.
        STY     tutmod
        LDA     #cr
        STA     frbuff
        STA     grbuff
        IF	cf8key
        STA	clterm		; Line terminator initially CR.
        FI
        STA     j0463
        STA     j04C7
        STA     j04FB

        ; Define characters.

        JSR     vstrng
        DATA    &17,&87,&7E,&C3,&9D,&B1,&9D,&C3,&7E,&00,&00
        DATA    &17,&88,&00,&18,&38,&7F,&38,&18,&00,&00,&00
        DATA    &17,&89,&00,&18,&1C,&FE,&1C,&18,&00,&00,&00
        DATA    &17,&8A,&18,&18,&18,&18,&7E,&3C,&18,&00,&00
        DATA    &17,&8B,&00,&18,&3C,&7E,&18,&18,&18,&18,&00
        DATA    &17,&A2,&00,&00,&00,&1F,&00,&00,&00,&00,&00
        DATA    &17,&A4,&00,&00,&00,&F8,&00,&00,&00,&00,&00
        DATA    &17,&A6,&00,&00,&00,&FF,&00,&00,&00,&00,&00
        DATA    &17,&A7,&00,&00,&00,&FF,&18,&18,&18,&18,&00
        DATA    &17,&A9,&18,&18,&18,&18,&18,&18,&18,&18,&00
        DATA    &17,&AB,&18,&18,&18,&1F,&18,&18,&18,&18,&00
        DATA    &17,&AD,&18,&18,&18,&F8,&18,&18,&18,&18,&00
        DATA    &17,&AE,&18,&18,&18,&FF,&00,&00,&00,&00,&00
        DATA    &17,&AF,&18,&18,&18,&FF,&18,&18,&18,&18,&00
        DATA    &17,&B0,&00,&00,&00,&07,&0C,&18,&18,&18,&00
        DATA    &17,&B1,&00,&00,&00,&E0,&30,&18,&18,&18,&00
        DATA    &17,&B2,&18,&18,&0C,&07,&00,&00,&00,&00,&00
        DATA    &17,&B3,&18,&18,&30,&E0,&00,&00,&00,&00,&00
        NOP
        JMP     EDIT

XYscra  LDX     #>scratc
        LDY     #<scratc
        RTS

j824D   SEC
        SBC     addr
        STA     maxsiz
        TXA
        SBC     addr+1
        STA     maxsiz+1

j8257   LDA     (temp),Y
        CMP     #&0D
        BEQ     j827E
        CMP     #&8B
        BEQ     j826E
        LDX     #&00

j8263   LDA     (temp),Y
        STA     j04C8,X
        INY
        INX
        CPX     #&34
        BNE     j8263

j826E   LDA     j04C8
        CMP     #&0D
        BEQ     j82BB
        LDA     #&C8
        STA     j52
        LDA     #&04
        STA     j53
        RTS

j827E   LDX     GE
        LDY     GE+1
        TXA
        PHA
        TYA
        PHA
        LDX     tstart
        LDY     tstart+1
        JSR     j99F9
        LDY     #&00

j828F   LDA     (GE),Y
        STA     j0600,Y
        INY
        BNE     j828F
        PLA
        TAY
        PLA
        TAX
        JSR     j9A55
        LDY     #&FF

j82A0   INY
        BMI     j82BB
        LDA     j0600,Y
        CMP     #&0D
        BEQ     j82BB
        CMP     #&3E
        BNE     j82A0
        INY
        STY     j52
j82B1   LDA     j0600,Y
        CMP     #&0D
        BEQ     j82CF
        INY
        BPL     j82B1
j82BB   TYA
        BEQ     j82A0
        BRK
        DATA    1,"No name found"
        BRK
        BRK
j82CF   LDA     #&06
        STA     j53
        RTS
j82D4   JSR     starti
        LDY     #&FF
j82D9   INY
        LDA     (j52),Y
        CMP     #&20
        BEQ     j82D9
j82E0   LDA     (j52),Y
        CMP     #&21
        BCC     j82ED
        JSR     OSWRCH
        INY
        JMP     j82E0
j82ED   JMP     jB0D7
j82F0   LDA     tstart
        STA     addr
        LDA     tstart+1
        STA     addr+1
        LDA     tmax
        LDX     tmax+1
j82FC   JSR     j824D
        JSR     j98E7
        DATA    "Loading "
        NOP
        JSR     j82D4
j830E   JSR     isItDFS
        BCC     j832F
        LDA     #&05
        JSR     XYscra
        JSR     OSFILE
        CMP     #&01
        BNE     j832F
        LDA     j5E
        ORA     j5F
        BNE     j8358
        LDA     maxsiz
        CMP     j5C
        LDA     maxsiz+1
        SBC     j5D
        BCC     j8358
j832F   LDA     addr
        STA     j54
        LDA     addr+1
        STA     j55
        LDA     #&00
        STA     j56
        STA     j57
        STA     j58
        LDA     #&FF
        JSR     XYscra
        JSR     OSFILE
        LDA     #&00
        STA     j04FF
        CLC
        LDA     addr
        ADC     j5C
        TAX
        LDA     addr+1
        ADC     j5D
        TAY
        RTS

j8358   BRK
        DATA    2,"File too big"
        BRK

j8367   JSR     j8257

j836A   JSR     j98E7
        DATA    "Saving to "
        NOP

        JSR     j82D4
        LDX     #&0F
        LDA     #&00
j837F   STA     j54,X
        DEX
        BPL     j837F
        DEC     j58
        DEC     j59
        DEC     j5A
        DEC     j5B
        LDA     GE
        STA     j5C
        LDA     GE+1
        STA     j5D
        LDA     j64
        STA     j60
        LDA     j65
        STA     j61
        LDA     #&00
        JSR     XYscra
        JMP     OSFILE
j83A4   JSR     j83DB
        TYA
        BEQ     j83B4
j83AA   LDA     j04FF,Y
        CMP     #&20
        BNE     j83B4
        DEY
        BNE     j83AA
j83B4   LDA     #&0D
        STA     j0500,Y
        LDY     #&FF
j83BB   INY
        LDA     j0500,Y
        CMP     #&20
        BEQ     j83BB
        CLC
j83C4   TYA
        ADC     #&00
        STA     temp
        LDA     #&00
        ADC     #&05
        STA     temp+1
        LDA     j0500,Y
        LDY     #&00
        CMP     #&0D
j83D6   RTS
j83D7   LDY     #&00
        BEQ     j83C4
j83DB   LDA     #&20
        JSR     OSWRCH
        LDA     #fullsc
        STA     update
        JSR     inputLine
        BCC     j83D6

j83E9   JSR     vstrng
        DATA    3,15,13
        NOP

j83F0   LDA     brkact
        CMP     #&02
        BNE     j83FC
        JSR     closeX
        JSR     key_ctrl_up
j83FC   LDA     #&00
        STA     cursed
j8400   JMP     esccon

j8403   BIT     jFF
        BMI     j83E9
        RTS

inputLine                       ; j8408
        LDY     #&00
inputLineLoop
        JSR     OSRDCH
        BCS     inputLineEscape
        STA     j0500,Y
        CMP     #&7F
        BNE     inputLineDelete
        CPY     #&00
        BEQ     inputLineLoop
        DEY
        JSR     OSWRCH
        JMP     inputLineLoop

inputLineDelete
        CMP     #&15
        BNE     inputLineOkChar
        LDA     #&7F
inputLineDeleteLoop
        CPY     #&00
        BEQ     inputLineLoop
        JSR     OSWRCH
        DEY
        JMP     inputLineDeleteLoop

inputLineOkChar
        INY
        CMP     #&0D
        BEQ     inputLineExit
        JSR     jB0A5
        JMP     inputLineLoop

inputLineExit
        TYA
        PHA
        JSR     cursorOff
        PLA
        TAY
        DEY
        CLC
inputLineEscape
        RTS

isItDFS LDY     #&00
        TYA
        JSR     OSARGS
        CMP     #&04
        RTS

j8450   STX     size
        STY     size+1
        LDA     size
        ORA     size+1
        BEQ     j848B
        LDX     size+1
        SEC
        LDA     #&00
        SBC     size
        TAY
        BEQ     j847D
        STA     temp
        SEC
        LDA     argp
        SBC     temp
        STA     argp
        BCS     j8472
        DEC     argp+1
        SEC
j8472   LDA     varp
        SBC     temp
        STA     varp
        BCS     j847C
        DEC     varp+1
j847C   INX
j847D   LDA     (argp),Y
        STA     (varp),Y
        INY
        BNE     j847D
        INC     argp+1
        INC     varp+1
        DEX
        BNE     j847D
j848B   RTS

memsta  LDA     tstart+1
        JSR     j84C4
        BCC     j84C3
        LDA     GS+1
        JSR     j84C4
        BCC     j84C3
        LDA     GE+1
        JSR     j84C4
        BCC     j84C3
        LDA     tmax+1
        JSR     j84C4
        BCC     j84C3
        LDX     tmax
        LDY     tmax+1
        JSR     j9A55
        LDA     tstart
        STA     j04FC
        LDA     tstart+1
        STA     j04FD
        LDA     GS
        STA     j04FE
        LDA     GS+1
        STA     j04FF
j84C3   RTS

j84C4   CMP     hymem+1
        BCS     j84CB
        CMP     paje+1
        RTS
j84CB   CLC
        RTS

vstrng  PLA
        STA     string
        PLA
        STA     string+1
        TYA
        PHA
        LDY     #&00
        JSR     vstrngMain
        PLA
        TAY
        JMP     (string)
vstrngLoop                      ; j84DF
        JSR     OSWRCH
vstrngMain                      ; j84E2
        INC     string
        BNE     vstrngNC
        INC     string+1
vstrngNC
        LDA     (string),Y
        CMP     #nop
        BNE     vstrngLoop
        RTS

toggleCRs
        LDA     #crFlag         ;  A=cr flag bit
        EOR     tutmod          ;  toggle the setting
storeFlags                      ; j84F3
        STA     tutmod          ;  write the new value back
        RTS                     ;  and exit

getInsOverMode                  ; j84F6
        LDA     #insOver        ;  mask for insert/over flag
        BIT     tutmod          ;  test current setting
        RTS                     ;  and exit

j84FB   LDX     tstart
        LDY     tstart+1
j84FF   STX     GS
        STY     GS+1
        LDA     tmax
        STA     GE
        LDA     tmax+1
        STA     GE+1
        LDY     #&00
        STY     cursed
        STY     nextre
        STY     markCnt
        LDA     #&0D
        STA     (paje),Y
        STA     (tmax),Y
        JMP     key_ctrl_up

EDIT    JSR     jB24B
j851F   LDX     tstart
        LDY     tstart+1
j8523   JSR     j84FF
EDITco  LDX     #&FF
        TXS
        INX
        STX     brkact
        JSR     j9714
        LDA     #fullsc
        STA     update

main_loop
        JSR     jAEC2
        JSR     j991B
        JSR     cursorOn
        LDA     #harddo
        STA     update
        JSR     j9863
        TAX
        BPL     j85C1
        LDX     cursed
        BNE     j85C1
        CMP     #&B0
        BCS     j85C1
        TAX
        LDA     tutmod
        AND     #&07
        CMP     #&05
        BNE     notDescriptiveMode

        CPX     #&9C
        BCS     notDescriptiveMode
        CPX     #&90
        BCS     descriptiveMode
        CPX     #&8A
        BCS     notDescriptiveMode
descriptiveMode
        TXA
        PHA
        ASL     A
        TAY

        JSR     vstrng
        DATA    &1A,&1E,&1F,0,8
        NOP

        LDA     extHelpTable,Y
        STA     string
        LDA     extHelpTable+1,Y
        STA     string+1
j857A   LDY     #&00
        JSR     OSNEWL
        LDX     #&00
j8581   LDA     (string,X)
        INC     string
        BNE     j8589
        INC     string+1
j8589   CMP     #&0D
        BEQ     j8597
        CMP     #&EA
        BEQ     j85A3
        JSR     OSWRCH
        INY
        BNE     j8581
j8597   LDA     #&20
j8599   CPY     #&36
        BCS     j857A
        JSR     OSWRCH
        INY
        BNE     j8599
j85A3   JSR     j9833
        JSR     j991B
        PLA
        TAX
notDescriptiveMode
        TXA
        ASL     A
        TAX
        JSR     j85B4
        JMP     main_loop

j85B4   LDA     keyTable,X
        STA     string
        LDA     keyTable+1,X
        STA     string+1
        JMP     (string)

j85C1   JSR     j85C7
        JMP     main_loop
j85C7   CMP     #&7F
        BEQ     j8632
        LDY     #&00
        STY     j04FF
        CMP     #&0D
        BNE     j85E7
        JSR     getInsOverMode
        BNE     j85E5
        JSR     j975C
        BCS     j85E5
        LDY     #&00
        STY     scrnX
        JMP     key_down
j85E5   LDA     #&0D
j85E7   PHA
        JSR     j9A97
        JSR     getInsOverMode
        BNE     j85F8
        LDY     scrnX
        LDA     (GE),Y
        CMP     #&0D
        BNE     j85FF
j85F8   LDX     #&01
        LDA     scrnX
        JSR     j9AC6
j85FF   PLA
        LDY     scrnX
        STA     (GE),Y
        PHA
        JSR     jB0A5
        PLA
        CMP     #&0D
        BNE     j8616
        PHA
        LDA     scrnX
        LDY     scrnY
        JSR     jB05F
        PLA
j8616   CMP     #&0D
        BEQ     j8620
        JSR     key_right
        JMP     j8626
j8620   JSR     key_ctrl_left
        JSR     key_down
j8626   LDA     update
        BEQ     j862D
        JSR     jAEC2
j862D   LDA     #csrtoc
        STA     update
j8631   RTS
j8632   JSR     j9ABC
        BEQ     j863A
        JMP     key_left
j863A   LDA     scrnX
        BNE     j8643
        JSR     j9753
        BCS     j8631
j8643   JSR     key_left
        JSR     j976B
        CMP     scrnX
        BCS     j864F
        STA     scrnX
j864F   JSR     getInsOverMode
        BNE     j867B
        LDY     scrnX
        LDA     (GE),Y
        CMP     #&0D
        BEQ     j8631
        LDA     #&20
        STA     (GE),Y
        LDA     #csrtoc
        STA     update
        RTS
key_copy
        JSR     j975C
        BCC     j8670
        LDA     scrnX
        CMP     currle
        BCS     j8631
j8670   LDA     #csrtoc
        STA     update
        JSR     j976B
        CMP     scrnX
        BCC     j8631
j867B   CLC
        LDA     GE
        STA     temp
        ADC     scrnX
        STA     addr
        LDA     GE+1
        STA     temp+1
        ADC     #&00
        STA     addr+1
        INC     GE
        BNE     j8692
        INC     GE+1
j8692   LDY     scrnX
        BPL     j869A
j8696   LDA     (temp),Y
        STA     (GE),Y
j869A   DEY
        BPL     j8696
j869D   LDX     markCnt
j869F   DEX
        BMI     j86B4
j86A2   LDY     j18,X
        CPY     addr
        LDA     j1A,X
        SBC     addr+1
        BCS     j869F
        INC     j18,X
        BNE     j869F
        INC     j1A,X
        BNE     j869F
j86B4   JMP     j8626

keyTable                        ; &86B7
        DW      key_f0          ;  f0
        DW      key_f1          ;  f1
        DW      key_f2          ;  f2
        DW      key_f3          ;  f3
        DW      key_f4          ;  f4
        DW      key_f5          ;  f5
        DW      key_f6          ;  f6
        DW      key_f7          ;  f7
        DW      key_f8          ;  f8
        DW      key_f9          ;  f9
        DW      key_tab         ;  tab
        DW      key_copy        ;  copy
        DW      key_left        ;  left
        DW      key_right       ;  right
        DW      key_down        ;  down
        DW      key_up          ;  up
        DW      toggleCRs       ;  shift-f0
        DW      key_shift_f1    ;  shift-f1
        DW      key_shift_f2    ;  shift-f2
        DW      key_shift_f3    ;  shift-f3
        DW      main_loop       ;  shift-f4
        DW      key_shift_f5    ;  shift-f5
        DW      key_shift_f6    ;  shift-f6
        DW      key_shift_f7    ;  shift-f7
        DW      key_shift_f8    ;  shift-f8
        DW      key_shift_f9    ;  shift-f9
        DW      key_shift_tab   ;  shift-tab
        DW      key_shift_copy  ;  shift-copy
        DW      key_shift_left  ;  shift-left
        DW      key_shift_right ;  shift-right
        DW      key_shift_down  ;  shift-down
        DW      key_sup         ;  shift-up
        DW      main_loop       ;  ctrl-f0
        DW      main_loop       ;  ctrl-f1
        DW      main_loop       ;  ctrl-f2
        DW      main_loop       ;  ctrl-f3
        DW      main_loop       ;  ctrl-f4
        DW      main_loop       ;  ctrl-f5
        DW      key_ctrl_f6     ;  ctrl-f6
        DW      key_ctrl_f7     ;  ctrl-f7
        DW      main_loop       ;  ctrl-f8
        DW      main_loop       ;  ctrl-f9
        DW      main_loop       ;  ctrl-tab
        DW      main_loop       ;  ctrl-copy
        DW      key_ctrl_left   ;  ctrl-left
        DW      key_ctrl_right  ;  ctrl-right
        DW      key_ctrl_down   ;  ctrl-down
        DW      key_ctrl_up     ;  ctrl-up

extHelpTable
        DW      helpF0
        DW      helpF1
        DW      helpF2
        DW      helpF3
        DW      helpF4
        DW      helpF5
        DW      helpF6
        DW      helpF7
        DW      helpF8
        DW      helpF9

        DW      helpF9
        DW      helpF9
        DW      helpF9
        DW      helpF9
        DW      helpF9
        DW      helpF9

        DW      helpSF0
        DW      helpSF1
        DW      helpSF2
        DW      helpSF3
        DW      helpSF4
        DW      helpSF5
        DW      helpSF6
        DW      helpSF7
        DW      helpSF8
        DW      helpSF9
        DW      helpSTAB
        DW      helpSCOPY

j874F   DATA    &B0,"shf-f0",&A6,&A7,"shf-f1",&A6,&A7,"shf-f2",&A6
        DATA    &A7,"shf-f3",&A6,&A7,"shf-f4",&A6,&A7,"shf-f5",&A6
        DATA    &A7,"shf-f6",&A6,&A7,"shf-f7",&A6,&A7,"shf-f8",&A6
        DATA    &A7,"shf-f9",&B1

        DATA    &A9,"Display",&A9,"Insert/",&A9,"Insert ",&A9,"Remove "
        DATA    &A9,"Return ",&A9," Set   ",&A9," Clear ",&A9,"Marked "
        DATA    &A9,"Marked ",&A9,"Clear ",&A9

        DATA    &A9,"Returns",&A9,"Over   ",&A9," file  ",&A9,"Margins"
        DATA    &A9,"Languag",&A9," Mode  ",&A9," Marks ",&A9,"Move   "
        DATA    &A9,"Delete ",&A9,"text  ",&A9

        DATA    &AB,&A6,&A6,"f0",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f1",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f2",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f3",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f4",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f5",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f6",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f7",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f8",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f9",&A6,&A6,&AD

        DATA    &A9," Goto  ",&A9,"Command",&A9," Load  ",&A9," Save  "
        DATA    &A9,"Find   ",&A9,"Global ",&A9," Mark  ",&A9,"Marked "
        DATA    &A9," Print ",&A9," Old  ",&A9

        DATA    &A9," line  ",&A9,"line   ",&A9," file  ",&A9," file  "
        DATA    &A9,"String ",&A9,"Replace",&A9," Place ",&A9,"Copy   "
        DATA    &A9," text  ",&A9," text ",&A9

        DATA    &B2,&A6,&A6,&A6,&A6,&A6,&A6,&A6,&AE,&A6,&A6,&A6,&A6,&A6
        DATA    &A6,&A6,&AE,&A6,&A6,&A6,&A6,&A6,&A6,&A6,&AE,&A6,&A6,&A6
        DATA    &A6,&A6,&A6,&A6,&AE,&A6,&A6,&A6,&A6,&A6,&A6,&A6

        DATA    &AE,&A6,&A6,&A6,&A6,&A6,&A6,&A6,&AE,&A6,&A6,&A6,&A6,&A6
        DATA    &A6,&A6,&AE,&A6,&A6,&A6,&A6,&A6,&A6,&A6,&AE,&A6,&A6,&A6
        DATA    &A6,&A6,&A6,&A6,&AE,&A6,&A6,&A6,&A6,&A6,&A6,&B3
        NOP

        DATA    "The Acorn Screen Editor ",&87
        DATA    " 1984 Acorn Computers Ver N.XX ",&B0,&A6,&A6,&A6,&B1
        DATA    "Shift: screen up   "
        DATA    "               Descriptive Mode                         "
        DATA    &A9,32,&8B,32,&A9,"Control: text start"
        DATA    "TAB performs tabulation controlled by shift TAB.      "
        DATA    &B0,&A6,&AE,&A6,&A7,&A6,&AE,&A6,&B1,"Shift: word l/r  "
        DATA    "COPY deletes the character above the cursor.          "
        DATA    &A9,32,&88,&A4,&A9,&A2,&89,32,&A9,"Control:         "
        DATA    "shift COPY provides normal soft keys and cursor       "
        DATA    &B2,&A6,&A7,&A6,&AE,&A6,&A7,&A6,&B3,"    l/r of line  "
        DATA    "       copying (ESCAPE to leave this mode).             "
        DATA    &A9,32,&8A,32,&A9,"Shift: screen down"
        DS      57,32
        DATA    &B2,&A6,&A6,&A6,&B3,"Control: text end  "
        NOP

helpF0  DATA    "f0",13
        DATA    "The cursor can be moved to a new line.",13
        DATA    "For this operation lines are character sequences",13
        DATA    "ended by RETURN (||M).",13
        NOP
helpSF0 DATA    "shf-f0",13
        DATA    "The ends of lines can be shown as a special",13
        DATA    "character so that they can be seen clearly.",13
        DATA    "This alters with each press of shf-f0.",13
        NOP
helpF1  DATA    "f1",13,"Commands to the computer's operating system can be",13
        DATA    "given. The result is seen at once. Extra commands",13
        DATA    "can be entered until RETURN by itself is typed.",13
        NOP
helpSF1 DATA    "shf-f1",13
        DATA    "Changes between Insert and Over. In Insert mode the",13
        DATA    "text typed is inserted causing the existing text to",13
        DATA    "move. In Over mode the text is typed over old text.",13
        NOP
helpF2  DATA    "f2",13
        DATA    "A text file will be loaded, erasing the current text.",13
        DATA    "RETURN uses the name at the start of text after a '>'",13
        DATA    "COPY, RETURN to use the current file name.",13
        NOP
helpSF2 DATA    "shf-f2",13
        DATA    "A text file will be loaded at the current cursor.",13
        DATA    "RETURN uses the name at the start of text after a '>'",13
        DATA    "COPY, RETURN to use the current file name.",13
        NOP
helpF3  DATA    "f3",13
        DATA    "All or 'mark to cursor' text will be saved to a file.",13
        DATA    "RETURN uses the name at the start of text after a '>'",13
        DATA    "COPY, RETURN to use the current file name.",13
        NOP
helpSF3 DATA    "shf-f3",13
        DATA    "The top and bottom scroll margins have been removed.",13
        DATA    "Set Top scro",0,0,&80,2,13
        DATA    &B0,8,&82,"n to cursor line with ctrl-f6",13
        DATA    "Set Bottom scroll margin to cursor line with ctrl-f7",13
        NOP
helpF4  DATA    "f4:- Interactive Find and Replace Function.",13
        DATA    "RETURN to use last f4. Special search characters are:",13
        DATA    "# digit, $ RETURN, . any, [ ] set of char, a-z a to z",13
        DATA    "~ not, * many, ^^ many, || control, @ alpha, \ literal.",13
        NOP
helpSF4 DATA    "shf-f4",13,"One of Roger Wilson's efforts",13
        NOP
helpF5  DATA    "f5:- Global replace.              All, or marked text.",13
        DATA    "RETURN to use last f5. Special replace characters are:",13
        DATA    "/ to begin the replace section; & is the found string",13
        DATA    "%n found wild section n. See f4 for find characters.",13
        NOP
helpSF5 DATA    "shf-f5",13
        DATA    "The screen mode may be set to a specific mode. Also",13
        DATA    "Descriptive (D), or Key legend (K) modes may be set.",13
        DATA    "D and K use mode 0.",13
        NOP
helpF6  DATA    "f6",13
        DATA    "The current position of the cursor (_) is remembered.",13
        DATA    "The number at the bottom indicates how many (0,1,2)",13
        DATA    "marks (",&FF,") are being used.",13
        NOP
helpSF6 DATA    "shf-f6",13,"All place marks are cleared.",13,13,13
        NOP
helpF7  DATA    "f7",13
        DATA    "The text between two marked places is copied to",13
        DATA    "the current cursor position.",13
        DATA    "The marks are NOT cleared.",13
        NOP
helpSF7 DATA    "shf-f7",13
        DATA    "The text between two marked places is moved to",13
        DATA    "the current cursor position.",13
        DATA    "The marks are then cleared.",13
        NOP
helpF8  DATA    "f8",13
        DATA    "The whole text is printed out to the screen or printer",13
        DATA    "using the built-in formatter/paginator.",13,13
        NOP
helpSF8 DATA    "shf-f8",13
        DATA    "The text between the cursor and the marked place",13
        DATA    "is deleted.",13,"The mark is then cleared.",13
        NOP
helpF9  DATA    "f9",13
        DATA    "The old text in the buffer is recovered after a BREAK",13
        DATA    "or immediately after a Clear Text (by shf-f9).",13,13
        NOP
helpSF9 DATA    "shf-f9",13
        DATA    "All text in the buffer is deleted.",13
        DATA    "Use shf-f9 twice to remove the text beyond hope of a",13
        DATA    "recovery by f9.",13
        NOP
helpSTAB
        DATA    "shf-TAB",13
        DATA    "The TAB key may be used to move to zones of eight",13
        DATA    "characters across the screen, or to position under",13
        DATA    "the first character of the line immediately above.",13
        NOP
helpSCOPY
        DATA    "shf-COPY",13
        DATA    "Cursor editing can be used with ",&8B,&88,&A4,&A2,&89
        DATA    &8A," and COPY.",13
        DATA    "User defined soft keys are available as normal.",13
        DATA    "All characters except ESCAPE are put into text.",13
        NOP

j9714   LDA     #&04
        LDX     #&02
        JSR     OSBYTE
        LDA     #&DB
        LDX     #&8A
        LDY     #&00
        JSR     OSBYTE
        LDA     #&E3
        LDX     #&A0
        LDY     #&00
        JSR     OSBYTE
        LDA     #&E2
        LDX     #&90
        LDY     #&00
        JSR     OSBYTE
        LDX     #&80
j9738   LDA     #&E1
        LDY     #&00
        JMP     OSBYTE
j973F   LDA     #&DB
        LDX     #&09
        LDY     #&00
        JSR     OSBYTE
        LDA     #&04
        LDX     #&00
        JSR     OSBYTE
        LDX     #&01
        BNE     j9738
j9753   LDA     tstart
        CMP     GS
        LDA     tstart+1
        SBC     GS+1
        RTS
j975C   CLC
        LDA     currle
        ADC     GE
        TAX
        LDA     #&00
        ADC     GE+1
        CPX     tmax
        SBC     tmax+1
        RTS
j976B   LDX     pagewi
        LDY     #&00
j976F   LDA     (GE),Y
        CMP     #&0D
        BEQ     j9779
        INY
        DEX
        BNE     j976F
j9779   TYA
        RTS
j977B   STX     size
        STY     size+1
        SEC
        LDA     GE
        SBC     size
        TAX
        LDA     GE+1
        SBC     size+1
j9789   TAY
        STX     temp
        STY     temp+1
        CPX     GS
        SBC     GS+1
        BCC     j9795
        RTS
j9795   JMP     jBABF

cursorOn
        LDX     #&01
        LDY     #&01
        BNE     vdu23
cursorOff
        LDX     #&01
        LDY     #&00
vdu23   LDA     #&17
        JSR     OSWRCH
        TXA
        JSR     OSWRCH
        TYA
        JSR     OSWRCH
        JSR     vstrng
        DATA    0,0,0,0,0,0,0
        NOP
        RTS

j97BB   LDA     tutmod
        AND     #&07
        CMP     #&02
        BEQ     j97FC
        CMP     #&05
        BEQ     j97FC
        BNE     j9807
j97C9   LDA     tutmod
        AND     #&07
        CMP     #&02
        BEQ     j97D5
        CMP     #&05
        BNE     j9807

j97D5   PHA

        JSR     vstrng
        DATA    &1A,&1E
        NOP

        JSR     starti
        LDA     #&87
        STA     string+1
        LDA     #&4F
        STA     string
        LDY     #&00
        JSR     vstrngNC
        PLA
        CMP     #&02
        BEQ     j97FC
        LDA     #&89
        STA     string+1
        LDA     #&80
        STA     string
        JSR     vstrngNC

j97FC   JSR     jB0D7
        JSR     j981C
        STA     realPA
        JSR     j9833

j9807   JSR     j981C
        TAX
        INX
        LDA     pagewi

j980E   STA     j0732,X
        DEX
        BPL     j980E
        JSR     j9878
        LDA     #&00
        STA     scrnPY
        RTS

j981C   LDA     #&A0
        LDX     #&0A
        JSR     OSBYTE
        STX     pagewi
        STY     pagele
        LDX     #&08
        JSR     OSBYTE
        TYA
        CLC
        SBC     pagele
        STA     pagele
        RTS

j9833   LDA     tutmod
        AND     #&07
        LDY     #&0E
        CMP     #&05
        BEQ     j9843
        LDY     #&07
        CMP     #&02
        BNE     j985E
j9843   LDA     #&1C
        JSR     OSWRCH
        LDA     #&00
        JSR     OSWRCH
        LDA     realPA
        CLC
        ADC     #&01
        JSR     OSWRCH
        LDA     pagewi
        JSR     OSWRCH
        TYA
        JMP     OSWRCH
j985E   LDA     #&1A
        JMP     OSWRCH
j9863   LDA     nextre
        BEQ     j986E
        LDA     #&00
        STA     nextre
        LDA     nxtchr
        RTS

j986E   JSR     OSRDCH
        JMP     j8403

j9874   LDA     #&00
        STA     update
j9878   JSR     csr0ST
        JSR     starti
        LDX     cursed
        BEQ     j9897
        JSR     vstrng
        DATA    "Cursor Editing"
        NOP
        JMP     j98C6
j9897   JSR     getInsOverMode
        BEQ     j98AA

        JSR     vstrng
        DATA    "Insert "
        NOP
        JMP     j98B5

j98AA   JSR     vstrng
        DATA    "Over   "
        NOP
j98B5   LDA     markCnt
        ORA     #"0"
        JSR     OSWRCH
        JSR     vstrng
        DATA    " marks"
        NOP

j98C6   JSR     jB0D7
        LDY     pagele
        INY
        LDA     #&0D
        JMP     jB05F
j98D1   JSR     j98E7
        DATA    "Type filename "
        NOP
        LDX     #&01
        BNE     strmfl

j98E7   LDY     pagele
        INY
        JSR     jB051
        LDX     #&00
j98EF   LDY     pagele
        INY
        JSR     j9926
        LDX     #&01
        BNE     strmfl

strimo  LDX     #&00

strmfl  JSR     starti
        PLA
        STA     string
        PLA
        STA     string+1
        LDY     #&00
        JSR     vstrngMain

        JSR     jB0D7
        TXA
        BEQ     j9918
        LDY     pagewi
        DEY
        TYA
        LDY     pagele
        STA     j0733,Y

j9918   JMP     (string)

j991B   LDX     scrnX
        LDY     scrnY
        BPL     j9926
csr0ST  LDY     pagele
        INY
j9924   LDX     #&00
j9926   LDA     #&1F
        JSR     OSWRCH
        TXA
        JSR     OSWRCH
        TYA
        JMP     OSWRCH
normal  LDA     GS
        STA     temp
        LDA     GS+1
        STA     temp+1
        JSR     j994E
        STA     string
        SEC
        LDA     GS
        SBC     string
        TAX
        LDA     GS+1
        SBC     #&00
        TAY
        JMP     j99F9
j994E   CLC
        LDA     temp
        SBC     pagewi
        STA     temp
        BCS     j9959
        DEC     temp+1
j9959   LDY     pagewi
j995B   LDA     (temp),Y
        CMP     #&0D
        BEQ     j9966
j9961   DEY
        BPL     j995B
        BMI     j994E
j9966   STY     atemp
        SEC
        LDA     pagewi
        SBC     atemp
        RTS
j996E   LDX     GE
        LDY     GE+1
        STX     TP
        STY     TP+1
j9976   TAX
        STX     count
        BEQ     j9994
j997B   LDY     #&FF
j997D   INY
        LDA     (TP),Y
        CMP     #&0D
        BEQ     j9988
        CPY     pagewi
        BNE     j997D
j9988   STA     atemp
        TYA
        JSR     j9995
        BCS     j9994
        DEC     count
        BNE     j997B
j9994   RTS
j9995   SEC
        ADC     TP
        TAX
        LDA     #&00
        ADC     TP+1
        TAY
        CPX     hymem
        SBC     hymem+1
        BCS     j99A8
        STX     TP
        STY     TP+1
j99A8   RTS
j99A9   LDX     GS
        LDY     GS+1
        STX     TP
        STY     TP+1
        TAX
        STX     count
        BEQ     j99F1
        LDX     #&00
j99B8   LDA     tstart
        CMP     TP
        LDA     tstart+1
        SBC     TP+1
        BCS     j99F0
        CLC
        LDA     TP
        SBC     pagewi
        STA     TP
        BCS     j99CD
        DEC     TP+1
j99CD   LDY     pagewi
        LDA     (TP),Y
        CMP     #&0D
        BNE     j99EB
        LDA     TP
        STA     temp
        LDA     TP+1
        STA     temp+1
        JSR     j9961
        BEQ     j99EB
        TYA
        ADC     TP
        STA     TP
        BCC     j99EB
        INC     TP+1
j99EB   INX
        CPX     count
        BCC     j99B8
j99F0   TXA
j99F1   RTS
j99F2   JSR     j99A9
        LDX     TP
        LDY     TP+1
j99F9   STX     argp
        STY     argp+1
        SEC
        LDA     GS
        SBC     argp
        STX     GS
        TAX
        LDA     GS+1
        SBC     argp+1
        STY     GS+1
        TAY
        STX     size
        STY     size+1
        LDA     GE
        SBC     size
        STA     varp
        STA     GE
        LDA     GE+1
        SBC     size+1
        STA     varp+1
        STA     GE+1
        STX     size
        STY     size+1
j9A24   LDA     size
        TAY
        ORA     size+1
        BEQ     j9A4D
        LDX     size+1
        CLC
        TXA
        ADC     argp+1
        STA     argp+1
        TXA
        ADC     varp+1
        STA     varp+1
        INX
        BCC     j9A3F
j9A3B   LDA     (argp),Y
        STA     (varp),Y
j9A3F   DEY
        CPY     #&FF
        BNE     j9A3B
        DEX
        BEQ     j9A4D
        DEC     argp+1
        DEC     varp+1
        BNE     j9A3B
j9A4D   RTS
j9A4E   JSR     j996E
j9A51   LDX     TP
        LDY     TP+1
j9A55   LDA     GE
        STA     argp
        LDA     GE+1
        STA     argp+1
        LDA     GS
        STA     varp
        LDA     GS+1
        STA     varp+1
        SEC
        TXA
        SBC     GE
        TAX
        TYA
        SBC     GE+1
        TAY
        CLC
        TXA
        ADC     GS
        STA     GS
        TYA
        ADC     GS+1
        STA     GS+1
        TXA
        ADC     GE
        STA     GE
        TYA
        ADC     GE+1
        STA     GE+1
        JMP     j8450
j9A86   JSR     j9A97
        CLC
        LDA     GE
        ADC     scrnX
        TAX
        LDA     GE+1
        ADC     #&00
        TAY
        JMP     j9A55
j9A97   JSR     j9ABC
        BEQ     j9AB9
        PHA
        TAX
        LDA     currle
        JSR     j9AC6
        LDX     currle
        LDY     scrnY
        JSR     j9926
        PLA
        TAX
        LDA     #&20
        JSR     OSWRCH
        LDY     scrnX
j9AB3   DEY
        STA     (GE),Y
        DEX
        BNE     j9AB3
j9AB9   JMP     j991B
j9ABC   SEC
        LDA     scrnX
        SBC     currle
        BCS     j9AC5
        LDA     #&00
j9AC5   RTS
j9AC6   STA     atemp
        CLC
        ADC     GE
        PHA
        LDA     GE+1
        ADC     #&00
        PHA
        TXA
        PHA
        LDY     #&00
        JSR     j977B
        LDY     #&00
j9ADA   LDA     (GE),Y
        STA     (temp),Y
        INY
        CPY     atemp
        BCC     j9ADA
        STX     GE
        LDA     temp+1
        STA     GE+1
        PLA
        STA     count
        PLA
        STA     temp+1
        PLA
        STA     temp
        LDY     markCnt
j9AF4   DEY
        BMI     j9B14
        LDX     j18,Y
        CPX     temp
        LDA     j1A,Y
        SBC     temp+1
        BCS     j9AF4
        SEC
        TXA
        SBC     count
        STA     j18,Y
        LDA     j1A,Y
        SBC     #&00
        STA     j1A,Y
        JMP     j9AF4
j9B14   RTS
key_shift_tab
        LDA     #&00
        STA     update
        LDA     #tabMode
        EOR     tutmod
        JSR     storeFlags

        LDA     #tabMode
        AND     tutmod
        BNE     j9B3E

        LDX     #&0E
        JSR     j98EF
        DATA    " TAB columns of 8"
        NOP
        RTS

j9B3E   LDX     #&0E
        JSR     j98EF
        DATA    " TAB below words."
        NOP
        RTS
key_tab LDA     #tabMode
        BIT     tutmod
        BNE     j9B70
j9B5C   INC     scrnX
        LDA     scrnX
        AND     #&07
        BNE     j9B5C
        LDA     scrnX
        CMP     pagewi
        BCC     j9B85
        LDA     #&00
        STA     scrnX
        BCS     j9B85
j9B70   LDA     #&01
        JSR     j99A9
        LDX     pagewi
        LDY     #&00
        LDA     #&20
j9B7B   CMP     (TP),Y
        BNE     j9B83
        INY
        DEX
        BNE     j9B7B
j9B83   STY     scrnX
j9B85   LDA     #&00
        STA     update
        RTS

j9B8A   DATA    14,13,13
        DATA    "Format commands:- {initial values}",13,13
        DATA    ".afrn assign format n to register r {0}",13
        DATA    ".anrn assign number to register r {0}",13
        DATA    ".bl   bold line",13
        DATA    ".bp   begin page",13
        DATA    ".cc c control character is c {.}",13
        DATA    ".ce   centre line",13
        DATA    ".ch*c chain in next file",13
        DATA    ".co   comment line",13
        DATA    ".dmcc define macro to .en",13
        DATA    ".ds   double space lines",13
        DATA    ".ef   even page foot title to .en",13
        DATA    ".eh   even page head title to .en",13
        DATA    ".en   end of .at, .ix or .ef etc",13
        DATA    ".ep   begin even page",13
        DATA    ".ff   form feed the printer, wait if paged mode",13
        DATA    ".fo   even and odd foot title to .en",13
        DATA    ".he   even and odd head title to .en",13
        DATA    ".ic   close indexfile",13
        DATA    ".ig   ignore input until .en",13
        DATA    ".in+- indent left margin n places {0}",13
        DATA    ".io*c open indexfile for output",13
        DATA    ".ix   send text to indexfile until .en",13
        DATA    ".ju   justify right margin of lines {on}",13
        DATA    ".ll+- line length including indent {76}",13
        DATA    ".ls+- line spacing is n {1}",13
        DATA    ".lv n leave n blank lines (by .ne n and .sp n)",13
        DATA    ".ne n needs n output lines, .bp if necessary",13
        DATA    ".nj   no justification of lines",13
        DATA    ".nn   no new line after this line",13
        DATA    ".of   odd page foot title to .en",13
        DATA    ".oh   odd page head title to .en",13
        DATA    ".op   begin odd page",13
        DATA    ".os*c call operating system with this string",13
        DATA    ".pl+- text area length is n lines {58}",13
        DATA    ".po+- page offset is n {0}",13
        DATA    ".rf   right flush this line",13
        DATA    ".sp n insert n blank lines",13
        DATA    ".ss   single space lines",13
        DATA    ".ta   define tabs {8,16,24,...,96}",13
        DATA    ".tcc  define tab character as c {ctrl I}",13
        DATA    ".ti+- temporary indent n",13
        DATA    ".trcc translate {ctrl J is space}",13
        DATA    ".ul   underline line",13
        DATA    13,"n represents a decimal number, 0 is used if not present",13
        DATA    "Spaces are allowed before n. c represents any character",13
        DATA    "+- allows n, +n or -n: .in+2 sets an indent 2 more than current",13
        DATA    ".ti+2 is a temporary indent of 2 more than the current indent",13
        DATA    13,"Formatting commands which can appear anywhere",13
        DATA    13,".bb   begin bold",13
        DATA    ".bu   begin underline",13
        DATA    ".eb   end bold",13
        DATA    ".eu   end underline",13
        DATA    ".oc n output CHR$(n) to printer counted as 1 char",13
        DATA    ".on n output CHR$(n) to printer without being counted",13
        DATA    ".r0-9 contents of register e.g. .r0",15,13
        DATA    13
        NOP

jA2FC   LDA     #>j9B8A
        STA     string
        LDA     #<j9B8A
        STA     string+1
        LDY     #&00
jA306   LDA     (string),Y
jA308   JSR     OSASCI
        INC     string
        BNE     jA311
        INC     string+1
jA311   LDA     (string),Y
        BPL     jA308

        JSR     strimo
        DATA    "Press SHIFT to continue"
        NOP
        JSR     jACB4
        JMP     editco
jA336   JMP     jA2FC
key_f8  JSR     jBD51
        LDX     #&FF
        STX     pwtflg
        STX     prtflg
        TXS

        JSR     j98E7
        DATA    "S(creen), P(rinter) or H(elp) ?"
        NOP

jA366   JSR     jBAF6
        CMP     #&68
        BEQ     jA336
        CMP     #&73
        BEQ     jA377
        EOR     #&70
        BNE     jA366
        STA     prtflg
jA377   JSR     j98E7
        DATA    "C(ontinuous) or P(aged) ?"
        NOP

jA394   JSR     jBAF6
        CMP     #&63
        BEQ     jA3A1
        EOR     #&70
        BNE     jA394
        STA     pwtflg
jA3A1   JSR     memsta
        LDA     tstart
        STA     addr
        LDA     tstart+1
        STA     addr+1
        LDA     #&2E
        STA     j45
        LDX     #&00
jA3B2   LDA     #&00
        STA     j0500,X
        INX
        TXA
        STA     j0600,X
        BNE     jA3B2
        LDA     #&20
        STA     j060A
        LDA     #&01
        STA     j0500
        STA     j1F
        STA     j0502
        LDA     #&00
        STA     j4B
        STA     indexH
        STA     j1D
        STA     j49
        STA     j1B
        STA     j3A
        STA     offset
        STA     j19
        LDA     #&3A
        STA     lineDW
        LDA     #&02
        STA     brkact
        JSR     vstrng
        DATA    &1A,12
        NOP
        BIT     prtflg
        BMI     jA400
        LDX     #&00
        LDA     #&05
        JSR     OSBYTE
        JSR     OSBYTE
        LDA     #&02
        JSR     OSWRCH
jA400   BIT     pwtflg
        BMI     jA40D
        BIT     prtflg
        BPL     jA40D
        LDA     #&0E
        JSR     OSWRCH
jA40D   LDA     #&4C
        STA     j1A
        LDA     #&FF
        STA     j44
jA415   LDY     #&00
        LDA     #&0D
        STA     (GS),Y
        LDA     #&A2
        STA     j0514
        STA     j0516
        LDA     #&AE
        STA     j0515
        STA     j0517
        LDA     #&AA
        STA     j0518
        STA     j051A
        LDA     #&AE
        STA     j0519
        STA     j051B
        LDX     #&D0
jA43D   LDA     #&00
        STA     j052F,X
        DEX
        BNE     jA43D
jA445   LDA     #&00
        STA     j17
        STA     j18
        LDA     #&FF
        STA     j3B
        LDA     j1D
        STA     j1C
        STA     j47
        LDA     j49
        STA     j1E
        STA     j46
jA45B   LDX     #&80
        STX     j14
        LDA     addr+1
        CMP     #&A4
        BCS     jA46F
        LDA     addr
        CMP     GS
        LDA     addr+1
        SBC     GS+1
        BCS     jA4ED
jA46F   LDX     #&00
        LDA     (addr,X)
        CMP     j45
        BNE     jA4BF
        LDY     #&02
        LDA     (addr),Y
        STA     temp+1
        DEY
        LDA     (addr),Y
        STA     temp
jA482   CMP     printCommandTable,X
        BEQ     jA4C2
jA487   INX
jA488   INX
        INX
        INX
        CPX     #&AC
        BNE     jA482
        LDX     temp+1
        JSR     jA7A5
        BCC     jA4BF
        LDA     addr
        PHA
        LDA     addr+1
        PHA
        LDA     j45
        PHA
        LDY     #&00
        LDA     (j5C),Y
        STA     j45
        LDA     j5C
        STA     addr
        LDA     j5D
        STA     addr+1
        LDY     #&02
        JSR     jA4E3
        PLA
        STA     j45
        PLA
        STA     addr+1
        PLA
        STA     addr
        LDY     #&03
        BNE     jA4D3
jA4BF   JMP     jA535
jA4C2   LDA     temp+1
        CMP     printCommandTable+1,X
        BEQ     jA4CE
        LDA     temp
        JMP     jA487
jA4CE   LDY     #&03
        JSR     jA526
jA4D3   JSR     jA5D9
        PHA
        DEY
        CLC
        JSR     jA9B7
        PLA
        CMP     j45
        BEQ     jA46F
        LDY     #&00
jA4E3   JSR     jA797
        SEC
        JSR     jA9B7
        JMP     jA45B
jA4ED   JSR     jA761
        BIT     prtflg
        BPL     jA516
        JSR     strimo
        DATA    "Print done, press shift key"
        NOP
        JSR     jACB4
jA516   JSR     vstrng
        DATA    3,15
        NOP
        JSR     closeX
        LDX     GS
        LDY     GS+1
        JMP     j8523

jA526   LDA     printCommandTable+2,X
        STA     string
        LDA     printCommandTable+3,X
        STA     string+1
        LDA     #&FF
        JMP     (string)

jA535   LDA     #&FF
        CMP     j44
        BNE     jA53E
        JSR     jAA18
jA53E   LDA     j1A
        LDY     j3B
        INY
        BEQ     jA54B
        SEC
        SBC     j3B
        JMP     jA54E
jA54B   SEC
        SBC     j1B
jA54E   STA     j3C
        LDY     #&00
        LDX     #&00
        STX     j3D
jA556   CPY     #&FA
        BCS     jA587
        JSR     jA5E3
        CMP     #&0D
        BEQ     jA587
        CMP     #&20
        BNE     jA569
        STX     j15
        INC     j3D
jA569   INX
        INY
jA56B   CPX     j3C
        BCC     jA556
        JSR     jA5E3
        CMP     #&20
        BEQ     jA582
        CMP     #&0D
        BEQ     jA582
        LDA     j3D
        BEQ     jA582
        LDX     j15
        DEC     j3D
jA582   DEX
        LDA     #&00
        STA     j14
jA587   INX
        STX     count
        BIT     prtflg
        BPL     jA594
        JSR     jABEA
        JMP     jA5B4
jA594   LDA     #&40
        ORA     prtflg
        STA     prtflg
        LDA     j1C
        PHA
        JSR     jABC7
        PLA
        STA     j1C
        BIT     j47
        BPL     jA5B4
        LDA     #&BF
        AND     prtflg
        STA     prtflg
        JSR     jABEA
        LDA     #&00
        STA     j1C
jA5B4   BIT     j19
        BMI     jA5C6
        LDX     j1F
jA5BA   JSR     jAB84
        LDA     j44
        CMP     #&FF
        BEQ     jA5C6
        DEX
        BNE     jA5BA
jA5C6   LDA     #&00
        STA     j19
        JSR     jA5D9
        CMP     #&0D
        BEQ     jA5D2
        DEY
jA5D2   CLC
        JSR     jA9B7
        JMP     jA445
jA5D9   LDA     (addr),Y
        INY
        BEQ     jA5E2
        CMP     #&20
        BEQ     jA5D9
jA5E2   RTS
jA5E3   LDA     (addr),Y
        CMP     j45
        BNE     jA636
        INY
jA5EA   LDA     (addr),Y
        CMP     #&62
        BEQ     jA5FC
        CMP     #&6F
        BEQ     jA60A
        CMP     #&72
        BEQ     jA621
        CMP     #&65
        BNE     jA633
jA5FC   INY
        LDA     (addr),Y
        CMP     #&62
        BEQ     jA607
        CMP     #&75
        BNE     jA632
jA607   INY
        BNE     jA5E3
jA60A   INY
        LDA     (addr),Y
        CMP     #&6E
        BEQ     jA616
        CMP     #&63
        BNE     jA632
        INX
jA616   TXA
        PHA
        INY
        JSR     jA9EE
        PLA
        TAX
        JMP     jA5E3
jA621   INY
        LDA     (addr),Y
        CMP     #&30
        BCC     jA632
        CMP     #&3A
        BCS     jA632
        JSR     jACD4
        JMP     jA607
jA632   DEY
jA633   DEY
        LDA     (addr),Y
jA636   RTS
jA637   INY
jA638   LDA     (addr),Y
        CMP     j45
        BNE     jA636
        INY
        LDA     (addr),Y
        CMP     #&62
        BEQ     jA66B
        CMP     #&6F
        BEQ     jA686
        CMP     #&72
        BEQ     jA6A6
        CMP     #&65
        BNE     jA633
        INY
        LDA     (addr),Y
        CMP     #&62
        BEQ     jA662
        EOR     #&75
        BNE     jA632
        STA     j1D
        STA     j1C
        BEQ     jA637
jA662   LDA     #&00
jA664   STA     j49
        STA     j1E
        JMP     jA637
jA66B   INY
        LDA     (addr),Y
        CMP     #&62
        BEQ     jA680
        CMP     #&75
        BNE     jA632
        LDA     #&FF
        STA     j1C
        STA     j1D
        STA     j47
        BNE     jA637
jA680   LDA     #&FF
        STA     j46
        BNE     jA664
jA686   INY
        LDA     (addr),Y
        CMP     #&6E
        BEQ     jA692
        CMP     #&63
        BNE     jA632
        INX
jA692   TXA
        PHA
        INY
        JSR     jA9EE
        LDA     #&01
        JSR     OSWRCH
        TXA
        JSR     OSWRCH
        PLA
        TAX
        JMP     jA638
jA6A6   INY
        LDA     (addr),Y
        CMP     #&30
        BCC     jA632
        CMP     #&3A
        BCS     jA632
        JSR     jACD4
        TXA
        PHA
        LDX     temp
jA6B8   LDA     j5C,X
        JSR     jAB3C
        DEX
        BPL     jA6B8
        PLA
        TAX
        JMP     jA637
jA6C5   JSR     jA9EE
        AND     #&0F
        ASL     A
        TAX
        LDA     j0501,X
        AND     #&0F
        STA     j0501,X
        INY
        STA     j4E
        JSR     jA9EE
        LDX     j4E
        ASL     A
        ASL     A
        ASL     A
        ASL     A
        ORA     j0501,X
        STA     j0501,X
        RTS
jA6E7   JSR     jA9EE
        AND     #&0F
        ASL     A
        STA     j4E
        LDA     (addr),Y
        INY
        PHA
        JSR     jA9EE
        PLA
        CMP     #&2B
        BEQ     jA712
        CMP     #&2D
        BEQ     jA728
        CMP     #&3D
        BEQ     jA73D
        TXA
        LDX     j4E
        STA     j0500,X
        LDA     j0501,X
        AND     #&F0
        STA     j0501,X
        RTS
jA712   CLC
        STX     j5C
        LDX     j4E
        LDA     j0500,X
        ADC     j5C
        STA     j0500,X
        LDA     j0501,X
        ADC     #&00
        STA     j0501,X
        RTS
jA728   STX     j5C
        LDX     j4E
        LDA     j0500,X
        SBC     j5C
        STA     j0500,X
        LDA     j0501,X
        SBC     #&00
        STA     j0501,X
        RTS
jA73D   TXA
        AND     #&0F
        ASL     A
        TAX
        LDA     j0501,X
        AND     #&0F
        STA     j5C
        LDA     j0500,X
        LDX     j4E
        STA     j0500,X
        LDA     j0501,X
        AND     #&F0
        ORA     j5C
        STA     j0501,X
        RTS
jA75C   STA     j1E
        STA     j46
        RTS
jA761   LDA     j44
        JMP     jA95F

jA766   LDA     (addr),Y
        STA     j45
        INY
        RTS

jA76C   STA     j17
        LDA     #&00
        STA     j18
        RTS

jA773   LDA     addr
        STA     temp
        LDA     addr+1
        STA     temp+1
        LDA     tstart
        STA     addr
        LDA     tstart+1
        STA     addr+1
        LDA     tmax
        LDX     tmax+1
        JSR     j824D
        JSR     j830E
        STX     GS
        STY     GS+1
        LDX     #&FF
        TXS
        JMP     jA415

jA797   LDA     #&0D
        BNE     jA7A0
jA79B   INY
        BNE     jA7A0
        INC     addr+1
jA7A0   CMP     (addr),Y
        BNE     jA79B
        RTS

jA7A5   STA     temp
        STX     temp+1
        LDX     #&FE
jA7AB   INX
        INX
        CPX     #&D0
        BCS     jA7D9
        LDA     j0530,X
        STA     j5C
        LDA     j0531,X
        STA     j5D
        BEQ     jA7DB
        STY     j4E
        LDY     #&03
jA7C1   LDA     (j5C),Y
        INY
        CMP     #&20
        BEQ     jA7C1
        STA     j5E
        LDA     (j5C),Y
        LDY     j4E
        CMP     temp+1
        BNE     jA7AB
        LDA     j5E
        CMP     temp
        BNE     jA7AB
        RTS
jA7D9   CLC
        TXA
jA7DB   RTS

jA7DC   DEY
        RTS

jA7DE   JSR     jA5D9
        CMP     #&0D
        BEQ     jA7DC
        CMP     #&45
        BEQ     jA7DC
        TAX
        LDA     (addr),Y
        CMP     #&0D
        BEQ     jA7DC
        JSR     jA7A5
        BNE     jA7DC
        LDA     addr
        STA     j0530,X
        LDA     addr+1
        STA     j0531,X
        BNE     jA81C
jA801   LDA     #&02
        STA     j1F
        RTS

jA806   LDA     addr
        STA     j0518
        LDA     addr+1
        STA     j0519
        BNE     jA81C
jA812   LDA     addr
        STA     j0514
        LDA     addr+1
        STA     j0515
jA81C   CLC
        JSR     jA9B7
jA820   LDY     #&00
        LDA     (addr),Y
        INC     addr
        BNE     jA836
        PHA
        INC     addr+1
        LDA     addr
        CMP     GS
        LDA     addr+1
        SBC     GS+1
        BCS     jA849
        PLA
jA836   CMP     j45
        BNE     jA820
        LDA     (addr),Y
        CMP     #&65
        BNE     jA820
        LDY     #&01
        LDA     (addr),Y
        CMP     #&6E
        BNE     jA820
        INY
jA849   RTS

jA84A   TSX
        CPX     #&FD
        BCS     jA849
        PLA
        PLA
        RTS

jA852   JSR     jA761
        LDA     j0500
        LSR     A
        BCS     jA852
        RTS

jA85C   LDA     pwtflg
        BMI     jA867
        LDA     prtflg
        BPL     jA86C
        JSR     jACB4
jA867   LDA     #&0C
        JMP     OSWRCH

jA86C   JSR     jA867
        JMP     jACB4

jA872   LDA     addr
        STA     j051A
        LDA     addr+1
        STA     j051B
        JMP     jA806

jA87F   LDA     addr
        STA     j0516
        LDA     addr+1
        STA     j0517
        JMP     jA812

jA88C   STY     j4E
        JSR     closeX
        LDY     j4E
        RTS

jA894   JMP     jA81C

jA897   LDX     j1B
        JSR     jA9C1
        STX     j1B
        RTS

jA89F   CLC
        JSR     jA9B7
        JSR     closeX
        LDX     addr
        LDY     addr+1
        LDA     #&80
        JSR     OSFIND
        STA     indexH
        LDY     #&00
        JMP     jA797

jA8B6   STA     j4B
        CLC
        JSR     jA9B7
        LDA     j44
        PHA
        LDA     #&FD
        STA     j44
        JSR     jA45B
        PLA
        STA     j44
        LDA     #&00
        STA     j4B
        RTS

jA8CE   LDA     #&00
        STA     j3A
        RTS

jA8D3   LDX     j1A
        JSR     jA9C1
        STA     j1A
        RTS

jA8DB   LDX     j1F
        JSR     jA9C1
        STX     j1F
        RTS

jA8E3   JSR     jA9EE
        CMP     j44
        BEQ     jA8F1
        BCC     jA8F1
        PHA
        JSR     jA761
        PLA
jA8F1   JMP     jA95F
jA8F4   JSR     jA9EE
        CMP     j44
        BEQ     jA900
        BCC     jA900
        JMP     jA761
jA900   RTS

jA901   STA     j3A
        RTS

jA904   STA     j19
        RTS

jA907   LDA     addr
        STA     j051A
        LDA     addr+1
        STA     j051B
        JMP     jA81C

jA914   LDA     addr
        STA     j0516
        LDA     addr+1
        STA     j0517
        JMP     jA81C

jA921   JSR     jA761
        LDA     j0500
        LSR     A
        BCC     jA921
        RTS

jA92B   CLC
        JSR     jA9B7
        LDX     addr
        LDY     addr+1
        JSR     OSCLI
        LDY     #&00
        JMP     jA797

jA93B   LDX     lineDW
        JSR     jA9C1
        TXA
        BEQ     jA94C
        STA     lineDW
        LDX     j44
        INX
        BEQ     jA94C
        STA     j44
jA94C   RTS

jA94D   LDX     offset
        JSR     jA9C1
        STA     offset
        RTS

jA955   STA     j18
        LDA     #&00
        STA     j17
        RTS

jA95C   JSR     jA9EE
jA95F   TAX
        BEQ     jA987
        TYA
        PHA
jA964   CMP     #&FF
        BNE     jA96D
        JSR     jAA18
        LDX     j44
jA96D   LDA     j44
        CMP     #&FF
        BNE     jA97A
jA973   TXA
        PHA
        JSR     jAA18
        PLA
        TAX
jA97A   LDA     #&0D
        JSR     OSWRCH
        JSR     jAB84
        DEX
        BNE     jA96D
        PLA
        TAY
jA987   RTS

jA988   LDA     #&01
        STA     j1F
        RTS

jA98D   RTS

jA98E   RTS

jA98F   LDX     j3B
        CPX     #&FF
        BNE     jA997
        LDX     j1B
jA997   JSR     jA9C1
        STX     j3B
        RTS

jA99D   LDA     (addr),Y
        CMP     #&0D
        BEQ     jA9B1
        TAX
        INY
        LDA     (addr),Y
        DEY
        CMP     #&0D
        BEQ     jA9B1
        INY
        INY
        STA     j0600,X
jA9B1   RTS
jA9B2   STA     j1C
        STA     j47
        RTS
jA9B7   TYA
        ADC     addr
        STA     addr
        BCC     jA9C0
        INC     addr+1
jA9C0   RTS
jA9C1   JSR     jA5D9
        CMP     #&2D
        BEQ     jA9DD
        CMP     #&2B
        BEQ     jA9CF
        DEY
        LDX     #&00
jA9CF   STX     j4E
        JSR     jA9EE
        CLC
        ADC     j4E
        BCC     jA9DB
        LDA     #&00
jA9DB   TAX
        RTS
jA9DD   TXA
        PHA
        JSR     jA9EE
        STA     temp
        PLA
        SEC
        SBC     temp
        BCS     jA9DB
        LDA     #&00
        TAX
        RTS
jA9EE   LDX     #&00
        JSR     jA5D9
        DEY
jA9F4   LDA     (addr),Y
        CMP     #&30
        BCC     jAA16
        CMP     #&3A
        BCS     jAA15
        AND     #&0F
        PHA
        TXA
        ASL     A
        ASL     A
        STA     temp
        TXA
        CLC
        ADC     temp
        ASL     A
        STA     temp
        PLA
        CLC
        ADC     temp
        TAX
        INY
        BNE     jA9F4
jAA15   CLC
jAA16   TXA
        RTS
jAA18   LDX     j0514
        LDY     j0515
        LDA     j0500
        LSR     A
        BCC     jAA2A
        LDX     j0516
        LDY     j0517
jAA2A   DEC     j44
        JSR     jAA41
        LDA     lineDW
        STA     j44
        LDA     #&01
        STA     j0502
        LDA     #&F0
        AND     j0503
        STA     j0503
        RTS

jAA41   LDA     addr
        PHA
        LDA     addr+1
        PHA
        LDA     j45
        PHA
        LDA     j1A
        PHA
        LDA     j1B
        PHA
        LDA     j3B
        PHA
        LDA     j1E
        PHA
        LDA     j49
        PHA
        LDA     j46
        PHA
        LDA     j1C
        PHA
        LDA     j1D
        PHA
        LDA     j47
        PHA
        LDA     j3A
        PHA
        LDA     j1F
        PHA
        LDA     j17
        PHA
        LDA     j18
        PHA
        LDA     j19
        PHA
        LDA     #&00
        STA     j19
        STA     j3A
        STA     j49
        STA     j1D
        STA     j1B
        LDA     #&01
        STA     j1F
        STX     addr
        STY     addr+1
        LDY     #&00
        LDA     (addr),Y
        STA     j45
        LDY     #&03
        CLC
        JSR     jA9B7
        JSR     jA445
        PLA
        STA     j19
        PLA
        STA     j18
        PLA
        STA     j17
        PLA
        STA     j1F
        PLA
        STA     j3A
        PLA
        STA     j47
        PLA
        STA     j1D
        PLA
        STA     j1C
        PLA
        STA     j46
        PLA
        STA     j49
        PLA
        STA     j1E
        PLA
        STA     j3B
        PLA
        STA     j1B
        PLA
        STA     j1A
        PLA
        STA     j45
        PLA
        STA     addr+1
        PLA
        STA     addr
        RTS

jAACB   TAY
        LDA     j0600,Y
        STA     j52
        JSR     XYscra
        LDA     #&0A
        JMP     OSWORD
jAAD9   STY     j4E
        STX     markCnt
        BIT     j1E
        BPL     jAAF6
        JSR     jAACB
        LDX     #&07
jAAE6   LDA     j53,X
        LSR     A
        ORA     j53,X
        STA     j53,X
        DEX
        BPL     jAAE6
        BIT     j1C
        BPL     jAB0A
        BMI     jAAFD
jAAF6   BIT     j1C
        BPL     jAB69
        JSR     jAACB
jAAFD   LDA     j5A
        LSR     A
        ROR     A
        ORA     j5A
        ROL     A
        EOR     #&FF
        ORA     j5A
        STA     j5A
jAB0A   LDA     #&17
        JSR     OSWRCH
        LDA     #&20
        JSR     OSWRCH
        LDX     #&01
jAB16   LDA     j52,X
        JSR     OSWRCH
        INX
        CPX     #&09
        BNE     jAB16
        JSR     vstrng
        DFB     &20,&17,&20,&00,&00,&00,&00,&00,&00,&00,&00
        NOP
        LDX     markCnt
        LDY     j4E
        RTS
jAB34   LDA     #&7E
        JSR     OSBYTE
        JMP     jA516
jAB3C   BIT     jFF
        BMI     jAB34
        BIT     j4B
        BMI     jAB74
        CMP     #&20
        BCC     jAB69
        BIT     prtflg
        BMI     jAAD9
        BVS     jAB56
        LDA     #&20
        BIT     j1C
        BPL     jAB56
        LDA     #&5F
jAB56   PHA
        LDA     #&20
        BIT     prtflg
        BNE     jAB68
        BIT     j1E
        BMI     jAB68
        LDA     #&20
        JSR     OSWRCH
        PLA
        RTS
jAB68   PLA
jAB69   STY     j4E
        TAY
        LDA     j0600,Y
        LDY     j4E
jAB71   JMP     (j020E)
jAB74   STY     j4E
        TAY
        LDA     j0600,Y
        LDY     indexH
        BEQ     jAB81
        JSR     OSBPUT
jAB81   LDY     j4E
        RTS
jAB84   BIT     j4B
        BMI     jABC6
        LDA     #&0A
        INC     j0502
        BNE     jAB92
        INC     j0503
jAB92   DEC     j44
        BNE     jAB71
        JSR     OSWRCH
        TXA
        PHA
        TYA
        PHA
        LDX     j0518
        LDY     j0519
        LDA     j0500
        LSR     A
        BCC     jABAF
        LDX     j051A
        LDY     j051B
jABAF   DEC     j44
        DEC     j44
        JSR     jAA41
        LDA     #&FF
        STA     j44
        INC     j0500
        BNE     jABC2
        INC     j0501
jABC2   PLA
        TAY
        PLA
        TAX
jABC6   RTS
jABC7   LDA     #&20
        ORA     prtflg
        STA     prtflg
        LDA     j1E
        PHA
        JSR     jABEA
        PLA
        STA     j1E
        BIT     j46
        BPL     jABC6
        LDA     #&DF
        AND     prtflg
        STA     prtflg
        JSR     jABEA
        LDA     #&20
        ORA     prtflg
        STA     prtflg
        RTS
jABEA   LDA     offset
        JSR     jAC94
        LDA     #&00
        STA     j16
        LDA     j14
        BNE     jABFE
        SEC
        LDA     j3C
        SBC     count
        STA     j16
jABFE   LDA     j3B
        CMP     #&FF
        BNE     jAC06
        LDA     j1B
jAC06   JSR     jAC94
        LDA     j17
        BPL     jAC18
        SEC
        LDA     j3C
        ADC     #&00
        SEC
        SBC     count
        JSR     jAC95
jAC18   BIT     j18
        BPL     jAC26
        SEC
        LDA     j3C
        ADC     #&01
        SBC     count
        JSR     jAC94
jAC26   LDY     #&00
        LDX     #&00
        LDA     j3D
        BEQ     jAC4A
        LSR     A
        STA     j3E
        LDA     #&00
        BIT     j3A
        BMI     jAC39
        LDA     j16
jAC39   LDX     #&01
jAC3B   CMP     j3D
        BCC     jAC44
        INX
        SBC     j3D
        BCS     jAC3B
jAC44   STX     j3F
        STA     j16
        LDX     #&00
jAC4A   JSR     jA638
        CMP     #&0D
        BEQ     jAC85
        CMP     #&20
        BNE     jAC7A
        TXA
        PHA
        LDX     j3F
jAC59   DEX
        BEQ     jAC64
        LDA     #&20
        JSR     jAB3C
        JMP     jAC59
jAC64   PLA
        TAX
        SEC
        LDA     j3E
        SBC     j16
        STA     j3E
        BCS     jAC78
        ADC     j3D
        STA     j3E
        LDA     #&20
        JSR     jAB3C
jAC78   LDA     #&20
jAC7A   JSR     jAB3C
        INY
        INX
        CPX     count
        BCC     jAC4A
        LDA     #&0D
jAC85   JMP     jAB3C
closeX  LDY     indexH
        BEQ     jAC93
        LDA     #&00
        STA     indexH
        JSR     OSFIND
jAC93   RTS
jAC94   ASL     A
jAC95   LSR     A
        BEQ     jACB3
        TAX
        LDA     #&09
        BIT     prtflg
        BMI     jACA1
        LDA     #&20
jACA1   BIT     j4B
        BPL     jACAD
        LDA     #&20
        JSR     jAB74
        JMP     jACB0
jACAD   JSR     OSWRCH
jACB0   DEX
        BNE     jACA1
jACB3   RTS
jACB4   TXA
        PHA
        TYA
        PHA
jACB8   JSR     j8403
        LDX     #&FF
        LDY     #&FF
        LDA     #&81
        JSR     OSBYTE
        CPX     #&FF
        BNE     jACB8
        LDA     #&0F
        LDX     #&FF
        JSR     OSBYTE
        PLA
        TAY
        PLA
        TAX
        RTS
jACD4   STA     j4E
        TXA
        PHA
        TYA
        PHA
        LDA     j4E
        AND     #&0F
        ASL     A
        TAX
        LDA     j0500,X
        STA     temp
        LDA     j0501,X
        TAX
        AND     #&0F
        STA     temp+1
        ORA     temp
        PHP
        TXA
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        PLP
        BNE     jAD00
        CMP     #&08
        BCC     jAD04
        LDA     #&00
        BEQ     jAD04
jAD00   CMP     #&08
        BCS     jAD46
jAD04   PHA
        LDX     #&04
        LDA     #&30
        STA     j61
        STA     j62
        STA     j63
jAD0F   LDA     #&30
        STA     j5C,X
        SEC
jAD14   LDA     temp
        SBC     jBCD7,X
        TAY
        LDA     temp+1
        SBC     jBCDC,X
        BCC     jAD29
        STY     temp
        STA     temp+1
        INC     j5C,X
        BNE     jAD14
jAD29   DEX
        BPL     jAD0F
        PLA
        STA     temp
        LDX     #&08
jAD31   DEX
        CPX     temp
        BEQ     jAD3C
        LDA     j5C,X
        AND     #&0F
        BEQ     jAD31
jAD3C   STX     temp
        PLA
        TAY
        PLA
        SEC
        ADC     temp
        TAX
        RTS
jAD46   PHA
        CMP     #&0A
        BCS     jAD95
        LDA     #&FF
        PHA
        LDX     #&0C
jAD50   SEC
        LDA     temp
        SBC     jADC2,X
        TAY
        LDA     temp+1
        SBC     jADCF,X
        BCC     jAD74
        STY     temp
        STA     temp+1
        TXA
        ASL     A
        TAY
        LDA     jADDC,Y
        PHA
        LDA     jADDD,Y
        CMP     #&20
        BEQ     jAD50
        PHA
        JMP     jAD50
jAD74   DEX
        BPL     jAD50
jAD77   PLA
        INX
        STA     j5C,X
        CMP     #&FF
        BNE     jAD77
        DEX
jAD80   PLA
        AND     #&01
        BEQ     jAD3C
        STX     temp
jAD87   LDA     j5C,X
        ORA     #&20
        STA     j5C,X
        DEX
        BPL     jAD87
        LDX     temp
        JMP     jAD3C
jAD95   LDA     temp
        BNE     jAD9B
        DEC     temp+1
jAD9B   DEC     temp
        LDY     #&00
jAD9F   LDA     temp
        SEC
jADA2   INY
        SBC     #&1A
        BCS     jADA2
        STA     temp
        LDA     temp+1
        BEQ     jADB2
        DEC     temp+1
        JMP     jAD9F
jADB2   LDA     temp
        ADC     #&5B
        LDX     #&00
jADB8   STA     j5C,X
        INX
        DEY
        BNE     jADB8
        DEX
        JMP     jAD80

jADC2   DATA    1,4,5,9,10,&28,&32,&5A,&64,&90,&F4,&84,&E8
jADCF   DATA    0,0,0,0,0 ,0  ,0  ,0  ,0  ,1  ,1  ,3  ,3

jADDC   DATA    "I"
jADDD   DATA    " IVV IXX XLL XCC CDD DMM "

printCommandTable
        ASC     "af"
        DW      jA6C5
        ASC     "an"
        DW      jA6E7
        ASC     "bl"
        DW      jA75C
        ASC     "bp"
        DW      jA761
        ASC     "cc"
        DW      jA766
        ASC     "ce"
        DW      jA76C
        ASC     "ch"
        DW      jA773
        ASC     "co"
        DW      jA797
        ASC     "dm"
        DW      jA7DE
        ASC     "ds"
        DW      jA801
        ASC     "ef"
        DW      jA806
        ASC     "eh"
        DW      jA812
        ASC     "en"
        DW      jA84A
        ASC     "ep"
        DW      jA852
        ASC     "ff"
        DW      jA85C
        ASC     "fo"
        DW      jA872
        ASC     "he"
        DW      jA87F
        ASC     "ic"
        DW      jA88C
        ASC     "ig"
        DW      jA894
        ASC     "in"
        DW      jA897
        ASC     "io"
        DW      jA89F
        ASC     "ix"
        DW      jA8B6
        ASC     "ju"
        DW      jA8CE
        ASC     "ll"
        DW      jA8D3
        ASC     "ls"
        DW      jA8DB
        ASC     "lv"
        DW      jA8E3
        ASC     "ne"
        DW      jA8F4
        ASC     "nj"
        DW      jA901
        ASC     "nn"
        DW      jA904
        ASC     "of"
        DW      jA907
        ASC     "oh"
        DW      jA914
        ASC     "op"
        DW      jA921
        ASC     "os"
        DW      jA92B
        ASC     "pl"
        DW      jA93B
        ASC     "po"
        DW      jA94D
        ASC     "rf"
        DW      jA955
        ASC     "sp"
        DW      jA95C
        ASC     "ss"
        DW      jA988
        ASC     "ta"
        DW      jA98D
        ASC     "tc"
        DW      jA98E
        ASC     "ti"
        DW      jA98F
        ASC     "tr"
        DW      jA99D
        ASC     "ul"
        DW      jA9B2

jAEA2   STR     ".he"
        STR     ".en"
        STR     ".fo"
        STR     ".ce"

jAEB2   STR     "Page .r0"
        STR     ".ff.en"

jAEC2   LDA     #&00
        STA     j5D
        JSR     cursorOff
        JSR     j976B
        STA     currle
        JSR     jBCE1
        LDA     update
        CMP     #fullsc
        BNE     jAEDA
        JSR     j97C9
jAEDA   LDA     scrnPY
        CMP     update
        BCC     jAEE2
        STA     update
jAEE2   LDA     #&00
        STA     scrnPY
        LDA     update
        BEQ     jAF27
        CMP     #&04
        BEQ     jAEF2
        CMP     #&05
        BNE     jAF0A
jAEF2   LDA     scrnY
        JSR     j99A9
        STA     scrnY
        TAY
        DEY
        STY     maxscr
        BMI     jAF0A
        LDA     #&00
        LDX     TP
        LDY     TP+1
        JSR     jAF7A
        BCS     jAF1D
jAF0A   LDX     update
        CPX     #&02
        BEQ     jAF2C
        CPX     #&03
        BEQ     jAF4D
        LDY     pagele
        STY     maxscr
        JSR     jAF74
        BCC     jAF27
jAF1D   LDA     #csrtoc
        CMP     update
        BCS     jAF25
        LDA     #harddo
jAF25   STA     scrnPY
jAF27   LDA     #&00
        STA     update
        RTS
jAF2C   JSR     csr0ST
        LDA     #&0A
        JSR     OSWRCH
        LDY     #&FF
jAF36   INY
        LDA     j0733,Y
        STA     j0732,Y
        CPY     pagele
        BNE     jAF36
        LDA     #&00
        STA     j0733,Y
        JSR     j9878
        LDA     pagele
        BNE     jAF68
jAF4D   JSR     vstrng
        DFB     &1E,&0B
        NOP
        LDY     pagele
jAF55   LDA     j0732,Y
        STA     j0733,Y
        DEY
        BPL     jAF55
        LDA     #&00
        STA     j0732
        JSR     j9878
        LDA     #&00
jAF68   STA     maxscr
        LDX     j66
        LDY     j67
        BNE     jAF7A
        TAY
        JMP     jB051
jAF74   LDA     scrnY
        LDX     GE
        LDY     GE+1
jAF7A   STA     scrupY
        STX     TP
        STY     TP+1
        LDA     update
        CMP     #csronw
        BEQ     jAFA5
        CMP     #&03
        BEQ     jAFA5
        CMP     #&01
        BNE     jAFA2
        JSR     jB02F
        LDX     scrnX
        CPX     currle
        BCC     jAF99
        LDX     currle
jAF99   LDY     scrupY
        JSR     j9926
        TXA
        TAY
        BPL     jAFAD
jAFA2   JSR     jB02F
jAFA5   LDY     scrupY
        JSR     j9924
        LDY     #&FF
jAFAC   INY
jAFAD   LDA     (TP),Y
        PHA
        JSR     jB0A5
        PLA
        CMP     #&0D
        BEQ     jAFBF
        CPY     pagewi
        BNE     jAFAC
        TYA
        BNE     jAFC0
jAFBF   TYA
jAFC0   STY     count
        LDY     markCnt
jAFC4   DEY
        BMI     jAFF6
        STY     index
        SEC
        LDA     j1C,Y
        SBC     TP
        TAX
        LDA     j1E,Y
        SBC     TP+1
        BCC     jAFC4
        BNE     jAFC4
        CPX     count
        BEQ     jAFDF
        BCS     jAFC4
jAFDF   LDY     scrupY
        JSR     j9926
        LDA     index
        CLC
        ADC     #&31
        JSR     jB0C2
        LDX     count
        INX
        JSR     j9926
        LDY     index
        BPL     jAFC4
jAFF6   LDA     count
        LDY     scrupY
        JSR     jB05F
        JSR     j9995
        BCC     jB010
        INC     j5D
        LDX     count
        LDY     scrupY
        JSR     j9926
        LDA     #&2A
        JSR     jB0C2
jB010   LDY     scrupY
        CPY     maxscr
        BCS     jB02D
        INC     scrupY
        LDA     j5D
        BNE     jB01F
        JMP     jAFA2
jB01F   JSR     jB02F
        LDY     scrupY
        JSR     jB051
        INC     scrupY
        CPY     pagele
        BCC     jB01F
jB02D   CLC
        RTS

jB02F   LDA     update
        CMP     #fullsc
        BEQ     jB050
        LDA     nextre
        BNE     jB04D
        LDA     #&81
        LDX     #&00
        LDY     #&00
        JSR     OSBYTE
        CPY     #&FF
        BEQ     jB050
        JSR     j8403
        INC     nextre
        STX     nxtchr
jB04D   PLA
        PLA
        SEC
jB050   RTS

jB051   TYA
        PHA
        JSR     j9924
        LDA     #&20
        JSR     OSWRCH
        PLA
        TAY
        LDA     #&00
jB05F   STA     atemp
        LDA     j0732,Y
        CMP     atemp
        BCC     jB09F
        BEQ     jB09F
        LDA     #&1C
        JSR     OSWRCH
        LDA     atemp
        CLC
        ADC     #&01
        JSR     OSWRCH
        TXA
        PHA
        LDA     tutmod
        AND     #&07
        TAX
        TYA
        CLC
        ADC     jB47A,X
        PHA
        JSR     OSWRCH
        LDA     j0732,Y
        JSR     OSWRCH
        PLA
        JSR     OSWRCH
        PLA
        TAX
        LDA     #&0C
        JSR     OSWRCH
        TYA
        PHA
        JSR     j9833
        PLA
        TAY
jB09F   LDA     atemp
        STA     j0732,Y
        RTS
jB0A5   CMP     #&20
        BCC     jB0B1
        CMP     #&7F
        BNE     jB0BB
        LDA     #&20
        BNE     jB0C2
jB0B1   CMP     #&0D
        BNE     jB0C0
        LDA     #crFlag
        BIT     tutmod
        BNE     jB0BE
jB0BB   JMP     OSWRCH
jB0BE   LDA     #&0D
jB0C0   ORA     #&40
jB0C2   PHA
        LDA     tutmod
        AND     #&07
        CMP     #&07
        BNE     jB0D0
        PLA
        LDA     #&FF
        BNE     jB0BB
jB0D0   JSR     starti
        PLA
        JSR     OSWRCH
jB0D7   LDA     #&11
        JSR     OSWRCH
        LDA     #&80
        JSR     OSWRCH
        LDA     #&11
        JSR     OSWRCH
        LDA     #&07
        JMP     OSWRCH
starti  JSR     vstrng
        DFB     &11,&87,&11,&00
        NOP
        RTS
key_left
        JSR     j9753
        BCC     jB0FD
        LDA     scrnX
        BEQ     jB13A
jB0FD   DEC     scrnX
        BPL     jB13A
        LDA     pagewi
        STA     scrnX
key_up  JSR     j9753
        BCS     jB13A
        LDA     #&01
        JSR     j99F2
        LDA     TSM
        CMP     scrnY
        BCS     jB119
jB115   DEC     scrnY
        BPL     jB13A
jB119   LDA     scrnY
        JSR     j99A9
        CMP     scrnY
        CLC
        BNE     jB115
        LDA     TP
        STA     j66
        LDA     TP+1
        STA     j67
        LDA     #hardup
        STA     update
        RTS
key_ctrl_left
        LDA     #&00
        STA     scrnX
        BEQ     jB13A
key_ctrl_right
        LDA     currle
        STA     scrnX
jB13A   LDA     #&00
        STA     update
        RTS
key_right
        LDA     scrnX
        CMP     pagewi
        BEQ     jB149
        INC     scrnX
        BPL     jB13A
jB149   JSR     j975C
        BCS     jB13A
        LDA     #&00
        STA     scrnX
key_down
        JSR     j975C
        BCS     jB13A
        LDA     #&01
        JSR     j9A4E
        LDA     scrnY
        CMP     BSM
        BCS     jB166
        INC     scrnY
        BPL     jB13A
jB166   LDA     #&00
        STA     j67
        SEC
        LDA     pagele
        SBC     BSM
        JSR     j996E
        LDA     count
        BNE     jB17E
        LDA     TP
        STA     j66
        LDA     TP+1
        STA     j67
jB17E   LDA     #csronw
        STA     update
        CLC
        RTS
jB184   CMP     #&30
        BCC     jB195
        CMP     #&3A
        BCC     jB194
        AND     #&DF
        CMP     #&41
        BCC     jB195
        CMP     #&5B
jB194   RTS
jB195   SEC
        RTS
jB197   LDY     scrnX
        LDA     (GE),Y
        CMP     #&0D
        BNE     jB1AD
        JSR     key_down
        BCS     jB1AA
        JSR     jAEC2
        JMP     key_ctrl_left
jB1AA   PLA
        PLA
        RTS
jB1AD   JSR     key_right
        JSR     jAEC2
        LDA     #&00
        STA     update
        RTS
key_shift_right
        LDA     currle
        CMP     scrnX
        BCS     jB1C5
        STA     scrnX
        BCC     jB1C5
jB1C2   JSR     jB197
jB1C5   LDY     scrnX
        LDA     (GE),Y
        JSR     jB184
        BCC     jB1C2
jB1CE   LDY     scrnX
        LDA     (GE),Y
        JSR     jB184
        BCC     jB1DD
        JSR     jB197
        JMP     jB1CE
jB1DD   RTS
jB1DE   LDA     scrnX
        BNE     jB1ED
        JSR     key_up
        BCS     jB1AA
        JSR     jAEC2
        JMP     key_ctrl_right
jB1ED   JMP     key_left
key_shift_left
        LDA     currle
        CMP     scrnX
        BCS     jB1F9
        STA     scrnX
        RTS
jB1F9   JSR     jB1DE
        LDY     scrnX
        LDA     (GE),Y
        JSR     jB184
        BCC     jB1F9
jB205   LDY     scrnX
        LDA     (GE),Y
        JSR     jB184
        BCC     jB214
        JSR     jB1DE
        JMP     jB205
jB214   JMP     key_right
key_sup LDA     pagele
        CLC
        ADC     #&01
        JMP     j99F2
key_shift_down
        LDA     pagele
        CLC
        ADC     #&01
        JMP     j9A4E
key_ctrl_up
        LDX     tstart
        LDY     tstart+1
        JSR     j99F9
        LDA     #&00
        STA     scrnX
        RTS
key_ctrl_down
        LDA     BSM
        STA     scrnY
        LDX     tmax
        LDY     tmax+1
        JSR     j9A55
        JMP     jBE02
key_shift_f1
        LDA     tutmod
        EOR     #insOver
        JSR     storeFlags
        JMP     j9874
jB24B   LDA     #&16
        JSR     OSWRCH
        LDA     tutmod
        AND     #&07
        TAY
        LDA     jB481,Y
        ORA     #&80
        JSR     OSWRCH
        LDA     #&83
        JSR     OSBYTE
        STX     paje
        STY     paje+1
        LDA     #&84
        JSR     OSBYTE
        STX     hymem
        STY     hymem+1
        CLC
        LDA     paje
        ADC     #&01
        STA     tstart
        LDA     paje+1
        ADC     #&00
        STA     tstart+1
        LDA     hymem
        SBC     #&00
        STA     tmax
        LDA     hymem+1
        SBC     #&00
        STA     tmax+1
        JSR     j97BB
        LDA     pagele
        SEC
        SBC     #&04
        STA     BSM
        LDA     #&04
        STA     TSM
        RTS
key_ctrl_f6
        LDA     scrnY
        STA     TSM
        BPL     jB2AB
key_ctrl_f7
        LDA     scrnY
        STA     BSM
        BPL     jB2AB
key_shift_f3
        LDA     #&00
        STA     TSM
        LDA     pagele
jB2A9   STA     BSM
jB2AB   LDA     #&00
        STA     update
        RTS
key_shift_f9
        JSR     j98E7
        DATA    "Text will be cleared if a key is hit"
        NOP
        LDA     #&81
        TAX
        LDY     #&03
        JSR     OSBYTE
        JSR     j8403
        CPY     #&00
        BEQ     jB2EC
        LDA     #fullsc
        STA     update
        RTS
jB2EC   JSR     memsta
        JMP     j851F
key_f2  JSR     j98E7
        DATA    "Type filename to load:"
        NOP
        JSR     j83A4
        LDY     #&00
        JSR     j82F0
        JMP     j8523
key_f3  JSR     jBD83
        CMP     #&01
        BEQ     jB340
        JSR     j98D1
        DATA    "to save:",7
        NOP
        JSR     j83A4
        JSR     jBD94
        LDY     #&00
        JSR     j8367
        LDX     j68
        LDY     j69
        JSR     j9A55
        JMP     jBE02
jB340   JSR     j98D1
        DATA    "for MARK TO CURSOR save:",7
        NOP
        JSR     j83A4
        JSR     jBD94
        LDY     #&00
        LDA     (temp),Y
        CMP     #&0D
        BEQ     jB384
        CMP     #&8B
        BEQ     jB384
        LDA     temp
        STA     j52
        LDA     temp+1
        STA     j53
        JSR     j836A
        LDX     j68
        LDY     j69
        JSR     j9A55
        JMP     jBE02

jB384   BRK
        DATA    1,"Bad use of stored name"
        BRK

key_shift_f2
        JSR     jBD51
        JSR     j9A86
        JSR     j98D1
        DATA    "to insert:"
        NOP
        JSR     j83A4
        LDA     GS
        STA     addr
        LDA     GS+1
        STA     addr+1
        LDA     GE
        LDX     GE+1
        LDY     #&00
        JSR     j82FC
        STX     GS
        STY     GS+1
        LDX     addr
        LDY     addr+1
        JSR     j99F9
        JMP     normal
key_f1  LDA     #&01
        STA     brkact
        JSR     j973F
        JSR     j98E7
        DATA    "Command line"
        NOP
        JSR     OSNEWL
        JSR     cursorOn
starlo  LDA     #&2A
        JSR     OSWRCH
        LDA     #&00
        LDY     #<jB411
        LDX     #>jB411
        JSR     OSWORD
        BCS     jB416
        LDA     j0500
        CMP     #&0D
        BEQ     jB41B
        LDX     #&00
        LDY     #&05
        JSR     OSCLI
        JMP     starlo

jB411   DW      j0500
        DATA    &EE,&20,&FF

jB416   LDA     #&7E
        JSR     OSBYTE

jB41B   JSR     vstrng
        DATA    0,0,0,0,0,0,0,0,0,0,4,3,15,13,&1A
        NOP

        LDA     #&87
        JSR     OSBYTE
        LDA     tutmod
        AND     #&07
        TAX
        LDA     jB481,X
        STY     string
        EOR     string
        AND     #&07
        BEQ     jB450
        LDA     #&16
        JSR     OSWRCH
        LDA     jB481,X
        ORA     #&80
        JSR     OSWRCH
jB450   JSR     j9714
        JMP     editco
key_shift_copy
        LDA     #&01
        STA     cursed
        JSR     j973F
        JMP     j9874
jB460   BRK
        DATA    1,"Only 0,1,3,4,6,7,D and K"

jB47A   DATA    0,0,7,0,0,14,0
jB481   DATA    0,1,0,3,4,0,6,7

key_shift_f5
        JSR     j98E7
        DATA    "New Mode:"
        NOP
        JSR     j83A4
        BEQ     jB460
        LDX     #&00
        LDA     (temp,X)
        AND     #&DF
        CMP     #&44
        BEQ     jB4C2
        CMP     #&4B
        BEQ     jB4BE
        JSR     jB56A
        LDA     j4C
        BNE     jB460
        LDA     j4B
        AND     #&07
        CMP     #&02
        BEQ     jB460
        CMP     #&05
        BEQ     jB460
        BNE     jB4C4
jB4BE   LDA     #&02
        BNE     jB4C4
jB4C2   LDA     #&05
jB4C4   PHA
        TAY
        LDA     jB481,Y
        PHA
        JSR     memsta
        LDA     #&82
        JSR     OSBYTE
        INX
        BNE     jB4E9
        INY
        BNE     jB4E9
        PLA
        PHA
        ORA     #&80
        TAX
        LDA     #&85
        JSR     OSBYTE
        CPX     GS
        TYA
        SBC     GS+1
        BCC     jB54A
jB4E9   PLA
        TAX
        LDA     #&F8
        AND     tutmod
        STA     tutmod
        PLA
        ORA     tutmod
        JSR     storeFlags
        JSR     jB24B
key_f9  LDA     j04FF
        CMP     paje+1
        BCC     jB556
        CMP     hymem+1
        BCS     jB556
        CMP     j04FD
        BCC     jB556
        LDA     j04FD
        CMP     paje+1
        BCC     jB556
        LDA     j04FC
        STA     argp
        LDA     j04FD
        STA     argp+1
        SEC
        LDA     j04FE
        SBC     argp
        TAX
        LDA     j04FF
        SBC     argp+1
        TAY
        BCC     jB556
        LDA     tstart
        STA     varp
        LDA     tstart+1
        STA     varp+1
        TYA
        PHA
        TXA
        PHA
        JSR     j8450
        PLA
        CLC
        ADC     tstart
        TAX
        PLA
        ADC     tstart+1
        TAY
        LDA     #&00
        STA     j04FF
        JMP     j8523
jB54A   JSR     key_ctrl_up
        BRK
        DATA    2,"No room"
jB556   BRK
        DATA    2,"No old text found"
        BRK

jB56A   LDA     #&00
        STA     index
        STA     j4B
        STA     j4C
jB572   LDY     index
        LDA     (temp),Y
        CMP     #&0D
        BEQ     jB5AD
        CMP     #&3A
        BCS     jB5FD
        SBC     #&2F
        BCC     jB5FD
        STA     atemp
        LDA     #&0A
        LDX     #&00
        LDY     #&00
jB58A   PHA
        TXA
        CLC
        ADC     j4B
        TAX
        TYA
        ADC     j4C
        TAY
        BCS     jB5FD
        PLA
        SEC
        SBC     #&01
        BNE     jB58A
        TXA
        CLC
        ADC     atemp
        STA     j4B
        BCC     jB5A7
        INY
        BEQ     jB5FD
jB5A7   STY     j4C
        INC     index
        BNE     jB572
jB5AD   RTS
key_f0  LDA     #&01
        STA     j4B
        LDY     #&00
        STY     j4C
        LDA     tstart
        STA     string
        LDA     tstart+1
        STA     string+1
jB5BE   LDA     (string),Y
        CMP     #&0D
        BNE     jB5CA
        INC     j4B
        BNE     jB5CA
        INC     j4C
jB5CA   INC     string
        BNE     jB5D0
        INC     string+1
jB5D0   LDA     string
        CMP     GS
        LDA     string+1
        SBC     GS+1
        BCC     jB5BE
        JSR     j98E7
        DATA    "At line "
        NOP
        JSR     jBCA1
        JSR     vstrng
        DATA    ", go to:"
        NOP
        JSR     jB0D7
        JSR     j83A4
        BNE     jB61A
jB5FD   BRK
        DATA    1,"Bad number"
jB609   BRK
        DATA    2,"Line not found"
        BRK
jB61A   JSR     jB56A
        SEC
        LDA     j4B
        SBC     #&01
        STA     j4B
        LDA     j4C
        SBC     #&00
        STA     j4C
        BCC     jB5FD
        JSR     key_ctrl_up
        LDA     GE
        STA     TP
        LDA     GE+1
        STA     TP+1
jB637   LDA     j4B
        ORA     j4C
        BEQ     jB655
jB63D   LDA     #&01
        JSR     j9976
        BCS     jB609
        LDA     atemp
        CMP     #&0D
        BNE     jB63D
        LDA     j4B
        BNE     jB650
        DEC     j4C
jB650   DEC     j4B
        JMP     jB637
jB655   LDA     TSM
        BNE     jB65B
        LDA     #&04
jB65B   STA     scrnY
        JMP     j9A51
jB660   LDA     #&00
        STA     j46
        STA     j61
        STA     j44
        STA     j47
        STA     offset
        STA     j5E
jB66E   LDA     #&00
        STA     j45
        BEQ     jB677
jB674   JSR     jB7AF
jB677   LDY     j45
        LDA     j0500,Y
        STA     atemp
        INC     j45
        CMP     #&0D
        RTS
jB683   JSR     jB660
jB686   LDA     #&00
        STA     j4E
        STA     j60
        STA     j5F
        LDA     atemp
        CMP     #&0D
        BEQ     jB6E1
        CMP     #&2F
        BEQ     jB6DF
        CMP     #&5E
        BNE     jB6A0
        INC     j5F
        BCS     jB6A4
jB6A0   CMP     #&2A
        BNE     jB6AB
jB6A4   INC     j4E
        LDX     #&80
        JSR     jB674
jB6AB   CMP     #&7E
        BNE     jB6B4
        LDX     #&81
        JSR     jB674
jB6B4   CMP     #&5B
        BNE     jB6F0
        INC     j5E
        LDX     #&86
        JSR     jB7AF
        JSR     jB7AF
        STY     j4A
        JSR     jB677
jB6C7   JSR     jB7F3
        LDA     atemp
        CMP     #&5D
        BNE     jB6C7
        DEC     j5E
        LDA     j46
        LDY     j4A
        STA     j0600,Y
        JSR     jB677
        JMP     jB6F3
jB6DF   INC     j61
jB6E1   JSR     jB7AD
        JSR     jB677
        LDA     j46
        STA     j3B
        LDA     j61
        BNE     jB74E
        RTS
jB6F0   JSR     jB7F3
jB6F3   LDA     j5F
        BEQ     jB6FC
        LDX     #&8B
        JSR     jB7AF
jB6FC   LDA     j60
        BEQ     jB716
        LDX     j44
        CPX     #&0A
        BCS     jB686
        INC     j44
        LDA     offset
        STA     j0728,X
        LDA     j4E
        BNE     jB71B
        LDA     j47
        STA     j071E,X
jB716   INC     offset
jB718   JMP     jB686
jB71B   INC     j47
        LDA     j47
        CMP     #&05
        BCS     jB72E
        ORA     #&80
        STA     j071E,X
        LDA     #&00
        STA     offset
        BEQ     jB718
jB72E   BRK
        DATA    1,"Too many find multiples"
        BRK
jB748   JSR     jB677
jB74B   JSR     jB7AF
jB74E   LDA     #&FF
        STA     j5E
        LDA     atemp
        CMP     #&0D
        BEQ     jB7AD
        LDX     #&88
        CMP     #&26
        BEQ     jB748
        CMP     #&5C
        BNE     jB769
        JSR     jB677
        TAX
        JMP     jB748
jB769   LDX     #&87
        CMP     #&25
        BNE     jB781
        JSR     jB7AF
        JSR     jB677
        SEC
        SBC     #&30
        BCC     jB792
        CMP     j44
        BCS     jB792
        TAX
        BPL     jB748
jB781   JSR     jB87E
        STX     j49
        TXA
        BPL     jB74B
        LDX     #&89
        JSR     jB7AF
        LDX     j49
        BNE     jB74B
jB792   BRK
        DATA    1,"Bad replace field number"
        BRK
jB7AD   LDX     #&8C
jB7AF   LDY     j46
        LDA     j5E
        BNE     jB7D3
        CPX     #&41
        BCC     jB7D3
        CPX     #&7B
        BCS     jB7D3
        CPX     #&5B
        BCC     jB7C5
        CPX     #&61
        BCC     jB7D3
jB7C5   TXA
        ORA     #&20
        TAX
        LDA     #&8A
        STA     j0600,Y
        INY
        INC     j46
        BEQ     jB7E0
jB7D3   TXA
        STA     j0600,Y
        BPL     jB7DB
        INC     j60
jB7DB   INC     j46
        BEQ     jB7E0
        RTS
jB7E0   BRK
        DATA    1,"Syntax incorrect"
        BRK
jB7F3   LDA     atemp
        CMP     #&7E
        BNE     jB812
        LDX     #&81
        JSR     jB7AF
        JSR     jB677
        BNE     jB812
        BRK
        DATA    1,"Error with ~"
        BRK
jB812   CMP     #&5C
        BNE     jB836
        INC     j5E
        JSR     jB677
        BNE     jB82C
        BRK
        DATA    1,"Error with \"
        BRK
jB82C   TAX
        JSR     jB677
        JSR     jB7AF
        DEC     j5E
        RTS
jB836   LDX     #&82
        CMP     #&2E
        BEQ     jB848
        LDX     #&83
        CMP     #&40
        BEQ     jB848
        LDX     #&84
        CMP     #&23
        BNE     jB84E
jB848   JSR     jB677
        JMP     jB7AF
jB84E   JSR     jB87E
        STX     j49
        LDA     atemp
        CMP     #&2D
        BNE     jB871
        INC     j5E
        LDX     #&85
        JSR     jB7AF
        JSR     jB677
        LDX     j49
        JSR     jB7AF
        JSR     jB87E
        JSR     jB7AF
        DEC     j5E
        RTS
jB871   TXA
        BPL     jB87B
        LDX     #&89
        JSR     jB7AF
        LDX     j49
jB87B   JMP     jB7AF
jB87E   LDA     #&00
        STA     count
        LDA     atemp
        BMI     jB8B8
        CMP     #&7C
        BNE     jB898
        JSR     jB677
        BEQ     jB8C5
        CMP     #&21
        BNE     jB8A5
        INC     count
        JSR     jB677
jB898   CMP     #&24
        BEQ     jB8B6
        CMP     #&7C
        BNE     jB8B8
        JSR     jB677
        BEQ     jB8C5
jB8A5   CMP     #&3F
        BNE     jB8AD
        LDA     #&7F
        BNE     jB8B8
jB8AD   BCC     jB8B8
        AND     #&DF
        SBC     #&40
        JMP     jB8B8
jB8B6   LDA     #&0D
jB8B8   PHA
        JSR     jB677
        PLA
        LDY     count
        BEQ     jB8C3
        ORA     #&80
jB8C3   TAX
        RTS
jB8C5   BRK
        DATA    1,"Error with ||"
        BRK
jB8D4   LDY     #&00
        STY     j3A
        LDA     j14
        STA     j16
        CMP     j68
        LDA     j15
        STA     j17
        SBC     j69
        BCC     jB90B
        LDA     j5C
        BNE     jB903
        JSR     jBAFC
        LDA     GS
        STA     string
        LDA     GS+1
        STA     string+1
        INC     j5C
        LDA     j64
        STA     j68
        LDA     j65
        STA     j69
        LDY     #&00
        BEQ     jB90B
jB903   SEC
        RTS
jB905   INC     j16
        BNE     jB90B
        INC     j17
jB90B   JSR     j8403
        LDA     j0600,Y
        CMP     #&8C
        BEQ     jB92A
        CMP     #&80
        BEQ     jB986
        JSR     jB9AB
        BEQ     jB905
jB91E   LDX     j3A
        BNE     jB945
        INC     j14
        BNE     jB8D4
        INC     j15
        BNE     jB8D4
jB92A   LDA     j14
        STA     j0706
        LDA     j15
        STA     j070C
        SEC
        LDA     j16
        SBC     j14
        STA     j0712
        LDA     j17
        SBC     j15
        STA     j0718
        CLC
        RTS
jB945   STY     j5F
        CLC
        LDA     j0706,X
        ADC     j0712,X
        STA     j16
        LDA     j070C,X
        ADC     j0718,X
        STA     j17
        LDA     j0700,X
        TAY
        JSR     jB9AB
        BNE     jB96D
        LDX     j3A
        INC     j0712,X
        BNE     jB905
        INC     j0718,X
        BNE     jB905
jB96D   LDX     j5F
        LDA     j05FF,X
        CMP     #&8B
        BNE     jB981
        INY
        LDX     j3A
        LDA     j0712,X
        ORA     j0718,X
        BNE     jB90B
jB981   DEC     j3A
        JMP     jB91E
jB986   INC     j3A
        LDX     j3A
        INY
        TYA
        STA     j0700,X
        LDA     j16
        STA     j0706,X
        LDA     j17
        STA     j070C,X
        LDA     #&00
        STA     j0712,X
        STA     j0718,X
        JSR     jB9AB
        JMP     jB90B
jB9A7   PLP
jB9A8   LDA     #&01
        RTS
jB9AB   LDA     j16
        CMP     j64
        BNE     jB9B7
        LDA     j17
        CMP     j65
        BEQ     jB9A8
jB9B7   LDX     #&00
        LDA     j0600,Y
        CMP     #&81
        PHP
        BNE     jB9C2
        INY
jB9C2   INY
        LDA     j05FF,Y
        BMI     jB9CE
        CMP     (j16,X)
        BNE     jBA45
        BEQ     jBA49
jB9CE   CMP     #&82
        BEQ     jBA49
        CMP     #&8A
        BEQ     jBA06
        CMP     #&83
        BEQ     jBA12
        CMP     #&8B
        BEQ     jB9A7
        CMP     #&84
        BEQ     jBA2A
        CMP     #&85
        BEQ     jB9F4
        CMP     #&86
        BEQ     jBA36
        INY
        LDA     j05FF,Y
        CMP     (j16,X)
        BNE     jBA45
        BEQ     jBA49
jB9F4   INY
        INY
        LDA     (j16,X)
        CMP     j05FE,Y
        BCC     jBA45
        CMP     j05FF,Y
        BCC     jBA49
        BNE     jBA45
        BEQ     jBA49
jBA06   INY
        LDA     (j16,X)
        ORA     #&20
        CMP     j05FF,Y
        BNE     jBA45
        BEQ     jBA49
jBA12   LDA     (j16,X)
        CMP     #&5F
        BEQ     jBA49
        CMP     #&41
        BCC     jBA2C
        CMP     #&7B
        BCS     jBA45
        CMP     #&5B
        BCC     jBA49
        CMP     #&61
        BCC     jBA45
        BCS     jBA49
jBA2A   LDA     (j16,X)
jBA2C   CMP     #&30
        BCC     jBA45
        CMP     #&3A
        BCS     jBA45
        BCC     jBA49
jBA36   LDA     j0600,Y
        STA     j4A
        INY
jBA3C   JSR     jB9AB
        BEQ     jBA47
        CPY     j4A
        BNE     jBA3C
jBA45   PLP
        RTS
jBA47   LDY     j4A
jBA49   PLA
        AND     #&02
        RTS
jBA4D   JSR     jBAFC
        LDA     j16
        STA     GE
        LDA     j17
        STA     GE+1
        LDA     j3B
        STA     lnbufx
jBA5C   LDA     GS
        CMP     j14
        LDA     GS+1
        SBC     j15
        BCS     jBABF
        LDY     lnbufx
        INC     lnbufx
        LDA     j0600,Y
        BPL     jBAB3
        CMP     #&8C
        BEQ     jBAC9
        CMP     #&87
        BEQ     jBA87
        CMP     #&88
        BEQ     jBA83
        INC     lnbufx
        LDA     j0601,Y
        JMP     jBAB3
jBA83   LDY     #&00
        BEQ     jBACD
jBA87   INC     lnbufx
        LDA     j0601,Y
        TAX
        LDA     j071E,X
        BMI     jBACA
        TAY
        BEQ     jBAA6
        CLC
        LDA     j0706,Y
        ADC     j0712,Y
        STA     temp
        LDA     j070C,Y
        ADC     j0718,Y
        BNE     jBAAC
jBAA6   LDA     j14
        STA     temp
        LDA     j15
jBAAC   STA     temp+1
        LDY     j0728,X
        LDA     (temp),Y
jBAB3   LDY     #&00
        STA     (GS),Y
        INC     GS
        BNE     jBA5C
        INC     GS+1
        BNE     jBA5C

jBABF   BRK
        DATA    2,"No room"
        BRK

jBAC9   RTS
jBACA   AND     #&7F
        TAY
jBACD   LDA     j0706,Y
        STA     argp
        LDA     j070C,Y
        STA     argp+1
        LDA     GS
        STA     varp
        LDA     GS+1
        STA     varp+1
        CLC
        LDA     j0712,Y
        TAX
        ADC     GS
        STA     GS
        LDA     j0718,Y
        TAY
        ADC     GS+1
        STA     GS+1
        JSR     j8450
        JMP     jBA5C
jBAF6   JSR     j9863
        ORA     #&20
        RTS
jBAFC   LDX     j14
        LDY     j15
        JMP     j9A55
key_f4  JSR     j98E7
        DATA    "Find and replace:"
        NOP
        JSR     j83DB
        JSR     j83D7
        LDX     #&00
        LDA     (temp,X)
        CMP     #&0D
        BNE     jBB38
        CMP     j0400
        BNE     jBB2E
        JMP     jBBFB
jBB2E   LDA     j0400,Y
        STA     (temp),Y
        INY
        BPL     jBB2E
        LDY     #&00
jBB38   LDA     (temp),Y
        STA     j0400,Y
        INY
        CPY     #&64
        BNE     jBB38
        JSR     jB683
        JSR     jBF10
        JSR     j9A86
        LDA     j4B
        STA     scrnX
        LDA     tmax
        STA     j68
        LDA     tmax+1
        STA     j69
        STA     j5C
jBB59   LDX     GE
        LDY     GE+1
jBB5D   STX     j14
        STY     j15
        JSR     jB8D4
        BCS     jBBDD
        JSR     jBAFC
        JSR     jBE02
        LDA     BSM
        STA     scrnY
        JSR     jAEC2
        LDA     #harddo
        STA     update
        JSR     j98E7
        DATA    "R(eplace), C(ontinue) or ESCAPE"
        NOP
        JSR     j991B
        JSR     cursorOn
jBBA0   JSR     jBAF6
        CMP     #&63
        BNE     jBBAD
        LDX     j16
        LDY     j17
        BCS     jBB5D
jBBAD   CMP     #&72
        BNE     jBBA0
        JSR     jBD51
        LDA     j61
        BNE     jBBD7
        JSR     j98E7
        DATA    "Replace by:"
        NOP
        JSR     j83DB
        JSR     j83D7
        JSR     jB66E
        LDA     j3B
        STA     j46
        JSR     jB74E
jBBD7   JSR     jBA4D
        JMP     jBB59
jBBDD   JSR     normal
        LDA     #fullsc
        STA     update
        JSR     jAEC2
        JSR     j9878
        LDX     #&0E
        JSR     j98EF
        DATA    " Not found"
        NOP
        RTS

jBBFB   BRK
        DATA    1,"No previous string"
        BRK

key_f5  JSR     jBD83
        JSR     j98E7
        DATA    "Global replace:"
        NOP
        JSR     j83DB
        JSR     j83D7
        LDX     #&00
        LDA     (temp,X)
        CMP     #&0D
        BNE     jBC43
        CMP     j0464
        BEQ     jBBFB
jBC39   LDA     j0464,Y
        STA     (temp),Y
        INY
        BPL     jBC39
        LDY     #&00
jBC43   LDA     (temp),Y
        STA     j0464,Y
        INY
        CPY     #&64
        BNE     jBC43
        JSR     jB683
        JSR     jBD94
        LDA     #&00
        STA     j4B
        STA     j4C
        STA     j5C
jBC5B   LDX     GE
        LDY     GE+1
jBC5F   STX     j14
        STY     j15
        JSR     jB8D4
        BCS     jBC7F
        INC     j4B
        BNE     jBC6E
        INC     j4C
jBC6E   LDA     j61
        BNE     jBC79
        LDX     j16
        LDY     j17
        JMP     jBC5F
jBC79   JSR     jBA4D
        JMP     jBC5B
jBC7F   LDX     string
        LDY     string+1
        JSR     j99F9
        JSR     normal
        JSR     jAEC2
        LDX     #&0E
        JSR     j98EF
        DFB     ' '
        NOP
        JSR     jBCA1
        JSR     j98EF
        DATA    " found"
        NOP
        RTS
jBCA1   JSR     starti
        LDX     #&04
        STX     string
jBCA8   LDA     #&00
        STA     string+1
jBCAC   SEC
        LDA     j4B
        SBC     jBCD7,X
        TAY
        LDA     j4C
        SBC     jBCDC,X
        BCC     jBCC2
        STY     j4B
        STA     j4C
        INC     string+1
        BCS     jBCAC
jBCC2   LDA     string+1
        BNE     jBCCA
        DEC     string
        BPL     jBCD3
jBCCA   ORA     #&30
        JSR     OSWRCH
        LDA     #&00
        STA     string
jBCD3   DEX
        BPL     jBCA8
        RTS
jBCD7   DATA    1,10,&64,&E8,&10
jBCDC   DATA    0,0,0,3,&27
jBCE1   JSR     jBD0C
jBCE4   LDA     #&00
        STA     j3F
        LDX     markCnt
jBCEA   DEX
        BMI     jBD0B
        LDY     j18,X
        STY     j1C,X
        CPY     GE
        LDA     j1A,X
        STA     j1E,X
        SBC     GE+1
        BCS     jBCEA
        INC     j3F
        SEC
        TYA
        SBC     j3C
        STA     j1C,X
        LDA     j1E,X
        SBC     j3D
        STA     j1E,X
        BCS     jBCEA
jBD0B   RTS
jBD0C   SEC
        LDA     GE
        SBC     GS
        STA     j3C
        LDA     GE+1
        SBC     GS+1
        STA     j3D
        RTS
jBD1A   JSR     j9A86
        JSR     jBD0C
        JSR     jBCE4
        LDX     markCnt
        CPX     #&02
        BNE     jBD43
        LDA     j1D
        CMP     j1C
        LDA     j1F
        SBC     j1E
        BCS     jBD43
        LDA     j1C
        LDY     j1D
        STA     j1D
        STY     j1C
        LDA     j1E
        LDY     j1F
        STA     j1F
        STY     j1E
jBD43   LDA     markCnt
        STA     j3E
        LDA     #&00
        STA     markCnt
        JSR     j9878
        LDA     j3E
jBD50   RTS
jBD51   LDA     markCnt
        BEQ     jBD50
        BRK
        DATA    1,"Mark(s) set"
        BRK
jBD63   LDA     GE
        STA     j68
        LDA     GE+1
        STA     j69
        LDA     j3E
        BEQ     jBD82
        CMP     #&01
        BNE     jBDC9
        LDX     j1C
        LDY     j1E
        DEC     j3F
        BNE     jBD82
        JSR     j99F9
        LDX     j68
        LDY     j69
jBD82   RTS
jBD83   JSR     jBF10
        JSR     jBD1A
        CMP     #&02
        BEQ     jBDC9
        PHA
        LDA     j4B
        STA     scrnX
        PLA
        RTS
jBD94   JSR     jBD63
        BNE     jBDA0
        JSR     key_ctrl_up
        LDX     tmax
        LDY     tmax+1
jBDA0   STX     j64
        STY     j65
        RTS
jBDA5   JSR     jBD1A
        CMP     #&02
        BNE     jBDC9
        LDA     j1D
        CMP     GE
        BNE     jBDC2
        LDA     j1F
        CMP     GE+1
        BNE     jBDC2
        LDA     GS
        STA     j1D
        LDA     GS+1
        STA     j1F
        INC     j3F
jBDC2   LDA     j3F
        CMP     #&01
        BEQ     jBDC9
        RTS

jBDC9   BRK
        DATA    1,"Bad marking"
        BRK

key_f6  JSR     j9A86
        LDX     markCnt
        CPX     #&02
        BEQ     jBDC9
        LDA     GE
        STA     j18,X
        LDA     GE+1
        STA     j1A,X
        JSR     normal
        INC     markCnt
        JMP     j9878
key_shift_f6
        JSR     jBD1A
        JMP     normal
key_shift_f8
        JSR     jBD1A
        JSR     jBD63
        BEQ     jBDC9
        STX     GE
        STY     GE+1
jBE02   JSR     normal
        LDA     string
        STA     scrnX
        RTS
key_f7  JSR     jBDA5
        SEC
        LDA     j1D
        SBC     j1C
        TAX
        LDA     j1F
        SBC     j1E
        TAY
        LDA     j3F
        BEQ     jBE39
        STX     string
        STY     string+1
        SEC
        LDA     j18
        SBC     string
        STA     j18
        LDA     j1A
        SBC     string+1
        STA     j1A
        LDA     j19
        SBC     string
        STA     j19
        LDA     j1B
        SBC     string+1
        STA     j1B
jBE39   JSR     j977B
        LDA     j1C
        STA     argp
        LDA     j1E
        STA     argp+1
        STX     GE
        STX     varp
        STY     GE+1
        STY     varp+1
        JSR     j9A24
        LDX     #&02
        STX     markCnt
        JSR     j9878
        JMP     normal
key_shift_f7
        JSR     jBDA5
        LDX     j1C
        LDY     j1E
        LDA     j3F
        BEQ     jBE77
        STX     argp
        STY     argp+1
        LDA     j1D
        STA     varp
        LDA     j1F
        STA     varp+1
        LDX     GS
        LDY     GS+1
        JMP     jBE87
jBE77   STX     varp
        STY     varp+1
        LDA     GE
        STA     argp
        LDA     GE+1
        STA     argp+1
        LDX     j1D
        LDY     j1F
jBE87   STX     j64
        STY     j65
jBE8B   SEC
        LDA     varp
        SBC     argp
        STA     size
        LDA     varp+1
        SBC     argp+1
        STA     size+1
        LDA     j64
        SBC     varp
        TAX
        LDA     j65
        SBC     varp+1
        TAY
        CPX     size
        SBC     size+1
        BCS     jBEAC
        STX     size
        STY     size+1
jBEAC   LDA     size
        ORA     size+1
        BEQ     jBEDE
        BCS     jBEC9
        LDX     varp
        LDY     varp+1
        JSR     jBEE5
        CLC
        TYA
        ADC     temp
        STA     argp
        LDA     #&00
        ADC     temp+1
        STA     argp+1
        BCC     jBE8B
jBEC9   SEC
        LDA     j64
        SBC     size
        STA     j64
        TAX
        LDA     j65
        SBC     size+1
        STA     j65
        TAY
        JSR     jBEE5
        JMP     jBE8B
jBEDE   LDA     #harddo
        STA     update
        JMP     normal
jBEE5   LDA     argp
        STA     temp
        LDA     argp+1
        STA     temp+1
        STX     addr
        STY     addr+1
        INC     size+1
        LDY     #&00
jBEF5   CPY     size
        BNE     jBEFD
        DEC     size+1
        BEQ     jBF1C
jBEFD   LDA     (temp),Y
        TAX
        LDA     (addr),Y
        STA     (temp),Y
        TXA
        STA     (addr),Y
        INY
        BNE     jBEF5
        INC     temp+1
        INC     addr+1
        BNE     jBEF5
jBF10   LDA     scrnX
        STA     j4B
        LDA     currle
        CMP     scrnX
        BCS     jBF1C
        STA     scrnX
jBF1C   RTS

jBF1D   DATA    "Roger Wilson",0

jBF2A   DATA    "play",&A9,"Insert/",&A9,"Insert ",&A9,"Remove ",&A9
        DATA    "Return ",&A9,32,"Set   ",&A9,32,"Clear ",&A9,"Marked "
        DATA    &A9,"Marked ",&A9,"Clear ",&A9

        DATA    &A9,"Returns",&A9,"Over   ",&A9,32,"file  ",&A9
        DATA    "Margins",&A9,"Languag",&A9,32,"Mode  ",&A9,32
        DATA    "Marks ",&A9,"Move   ",&A9,"Delete ",&A9,"text  ",&A9

        DATA    &AB,&A6,&A6,"f0",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f1",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f2",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f3",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f4",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f5",&A6,&A6,&A6
        DATA    &AF,&A6,&A6,"f6",&A6,&A6,&A6,&AF,&A6

        END

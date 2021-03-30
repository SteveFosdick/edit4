; Disassembly of EDIT 4 (110) from the BBC MOS 3.20 ROM
; Copyright Acorn 1984.

            cpu     1

; Zero page workspace.

L0000       =       $0000
L0001       =       $0001
OSHWM       =       $0002
L0004       =       $0004
L0005       =       $0005
L0006       =       $0006
L0007       =       $0007
L0008       =       $0008
L0009       =       $0009
L000A       =       $000A
L000B       =       $000B
L000C       =       $000C
L000D       =       $000D
L000E       =       $000E
L000F       =       $000F
L0010       =       $0010
L0011       =       $0011
L0012       =       $0012
L0013       =       $0013
L0014       =       $0014
L0015       =       $0015
L0016       =       $0016
L0017       =       $0017
L0018       =       $0018
L0019       =       $0019
L001A       =       $001A
L001B       =       $001B
L001C       =       $001C
L001D       =       $001D
L001E       =       $001E
L001F       =       $001F
HIMEM       =       $0020
L0022       =       $0022
L0023       =       $0023
L0024       =       $0024
L0025       =       $0025
L0026       =       $0026
L0027       =       $0027
L0028       =       $0028
L0029       =       $0029
L002A       =       $002A
options     =       $002B
L002C       =       $002C
L002D       =       $002D
L002E       =       $002E
L002F       =       $002F
L0030       =       $0030
L0031       =       $0031
L0032       =       $0032
L0033       =       $0033
L0034       =       $0034
L0035       =       $0035
L0036       =       $0036
L0037       =       $0037
L0038       =       $0038
L0039       =       $0039
L003A       =       $003A
L003B       =       $003B
L003C       =       $003C
L003D       =       $003D
L003E       =       $003E
L003F       =       $003F
L0040       =       $0040
L0041       =       $0041
L0042       =       $0042
L0043       =       $0043
L0044       =       $0044
L0045       =       $0045
L0046       =       $0046
L0047       =       $0047
L0048       =       $0048
L0049       =       $0049
L004A       =       $004A
L004B       =       $004B
L004C       =       $004C
L004D       =       $004D
L004E       =       $004E
mark_count  =       $004F
L0050       =       $0050
L0051       =       $0051
L0052       =       $0052
L0053       =       $0053
L0054       =       $0054
L0055       =       $0055
L0056       =       $0056
L0057       =       $0057
L0058       =       $0058
L0059       =       $0059
L005A       =       $005A
L005B       =       $005B
L005C       =       $005C
L005D       =       $005D
L005E       =       $005E
L005F       =       $005F
L0060       =       $0060
L0061       =       $0061
L0062       =       $0062
L0063       =       $0063
L0064       =       $0064
L0065       =       $0065
L0066       =       $0066
L0067       =       $0067
L0068       =       $0068
L0069       =       $0069
L006E       =       $006E
L00EA       =       $00EA
L00F2       =       $00F2
L00FD       =       $00FD
L00FF       =       $00FF

; References to the stack.

L019F       =       $019F
L01A0       =       $01A0

; OS vectors.

BRKV        =       $0202
WRCHV       =       $020E

; References to the language workspace.

L0400       =       $0400
L0463       =       $0463
L0464       =       $0464
L04C7       =       $04C7
L04C8       =       $04C8
L04FB       =       $04FB
L04FC       =       $04FC
L04FD       =       $04FD
L04FE       =       $04FE
L04FF       =       $04FF
L0500       =       $0500
L0501       =       $0501
L0502       =       $0502
L0503       =       $0503
L0514       =       $0514
L0515       =       $0515
L0516       =       $0516
L0517       =       $0517
L0518       =       $0518
L0519       =       $0519
L051A       =       $051A
L051B       =       $051B
L051C       =       $051C
L051D       =       $051D
L052F       =       $052F
L0530       =       $0530
L0531       =       $0531
L05FE       =       $05FE
L05FF       =       $05FF
L0600       =       $0600
L0601       =       $0601
L060A       =       $060A
L0700       =       $0700
L0706       =       $0706
L070C       =       $070C
L0712       =       $0712
L0718       =       $0718
L071E       =       $071E
L0728       =       $0728
L0732       =       $0732
L0733       =       $0733

; Suspect references.

L2034       =       $2034
L6F66       =       $6F66

; References to MOS API

LFF20       =       $FF20
OSRDRM      =       $FFB9
VDUCHR      =       $FFBC
OSEVEN      =       $FFBF
GSINIT      =       $FFC2
GSREAD      =       $FFC5
NVRDCH      =       $FFC8
NVWRCH      =       $FFCB
OSFIND      =       $FFCE
OSGBPB      =       $FFD1
OSBPUT      =       $FFD4
OSBGET      =       $FFD7
OSARGS      =       $FFDA
OSFILE      =       $FFDD
OSRDCH      =       $FFE0
OSASCI      =       $FFE3
OSNEWL      =       $FFE7
OSWRCH      =       $FFEE
OSWORD      =       $FFF1
OSBYTE      =       $FFF4
OSCLI       =       $FFF7

; Startard ROM Header.

            org     $8000
.langent    JMP     language
.servent    JMP     service
            EQUB    %11000010       ; ROM type.
            EQUB    <(copyright-1)  ; Copyright offset.
            EQUB    $01             ; Binary version.
            EQUS    "Edit",$00      ; ROM title.
            EQUS    "1.00",$00      ; ASCII version.
.copyright  EQUS    "(C)1984 Acorn",$00

.brkhand    LDX     #$FF
            TXS
            STZ     L0039
            LDA     #$7E            ; Acknowledge Escape condition.
            JSR     OSBYTE
            LDA     L0024
            CMP     #$FF
            BNE     L8055
.L8031      LDA     L0008
            BNE     L8037
            DEC     L0009
.L8037      DEC     L0008
            LDA     L000A
            BNE     L803F
            DEC     L000B
.L803F      DEC     L000A
            LDA     (L000A)
            STA     (L0008)
            LDA     L0008
            BNE     L8031
            LDA     L0009
            CMP     L0001
            BNE     L8031
            LDA     #$0D
            STA     (L0004)
            LDA     #$00
.L8055      CMP     #$01
            BEQ     L80D0
            BCC     L8061
            JSR     LADD3
            JSR     ctl_up
.L8061      JSR     write_istr
            EQUS    $03,$0F,$EA
.L8067      JSR     L998D
            JSR     L80D6
            JSR     L9815
            LDA     options
            AND     #$07
            CMP     #$05
            BEQ     L80A2
            LDA     (L00FD)
            CMP     #$01
            BNE     L80A2
            JSR     write_istr
            EQUS    "For help type: shf-f5 D RETURN",$0A,$0D,$EA
.L80A2      JSR     L9968
            EQUS    "Press ESCAPE to continue",$EA
.L80BE      JSR     OSRDCH
            CMP     #$1B
            BNE     L80BE
.L80C5      LDA     #$7E            ; Acknowledge Escape condition.
            JSR     OSBYTE
            JSR     L999F
            JMP     L8534
.L80D0      JSR     L80D6
            JMP     LB504
.L80D6      JSR     OSNEWL
            LDY     #$01
.L80DB      LDA     (L00FD),Y
            BEQ     L80E5
            JSR     OSASCI
            INY
            BNE     L80DB
.L80E5      JMP     OSNEWL

.service    CMP     #$04            ; Unrecognised command?
            BEQ     srvcmd
            CMP     #$09            ; *HELP?
            BNE     srvnhlp
            LDA     (L00F2),Y       ; Next character from command.
            CMP     #$0D            ; Only respond to empty *HELP.
            BNE     L8103
            PHY
            LDY     #$07            ; Print help string.
.L80F9      LDA     helpstr,Y
            JSR     OSASCI
            DEY
            BPL     L80F9
            PLY
.L8103      LDA     #$09            ; Allow other ROMS to also serve *HELP.
.srvnhlp    RTS

.helpstr    EQUS    $0D,"4 "
.command    EQUS    "TIDE",$0D

.srvcmd     PHY
            PHX
            LDX     #$03            ; Only compare 4 characters.
.L8112      LDA     (L00F2),Y       ; Get character from command line.
            CMP     #$2E            ; Abreviation?
            BEQ     cmdmatch
            AND     #$DF            ; Make upper case.
            CMP     command,X       ; Compare with command.
            BNE     L8129
            INY
            DEX
            BPL     L8112           ; Loop for all characters.
            LDA     (L00F2),Y
            CMP     #$21
            BCC     cmdmatch
.L8129      PLX                     ; Command does not match.
            PLY
            LDA     #$04            ; Pass on to next ROM.
            RTS
            
.cmdmatch   LDA     #$8E            ; Enter this ROM as a language.
            PLX
            JMP     OSBYTE

.language   CLI
            CLD
            LDX     #$FF
            TXS
            LDA     #$03            ; Turn off printer.
            JSR     OSWRCH
            LDA     #<brkhand
            STA     BRKV
            LDA     #>brkhand
            STA     BRKV+1
            STZ     L04FF
            LDA     #$F2            ; Address in I/O processor memory
            STA     L0052           ; of command line.
            STZ     L0053
            LDA     #$FF
            STA     L0054
            STA     L0055
            JSR     get_iobyte      ; Get low byte from I/O processor.
            PHA
            JSR     get_io_inc      ; Get high byte from I/O processor.
            STA     L0053
            PLA
            STA     L0052           ; &52/3 now has address of command.
            LDX     #$14
.L8165      DEX                     ; Skip over up to 20 characters for
            BEQ     L81E6           ; the command name, looking for a
            JSR     get_iobyte      ; space or CR.
            JSR     inc5253
            CMP     #$0D
            BEQ     L81E6
            CMP     #$20
            BNE     L8165
            LDX     #$00
.L8178      JSR     get_iobyte      ; Copy 64 bytes from the command
            JSR     inc5253         ; to the stack.
            STA     L01A0,X
            INX
            CPX     #$40
            BNE     L8178
            LDA     #$0D
            STA     L019F,X
            STA     L04C8
            LDY     #$00
            JSR     L824D           ; Attempt to parse a small integer.
            BCC     L81BB
            CMP     #','            ; Is next character a comma.
            BNE     L81BB
            LDA     L0000,X         ; Fetch ZP pointer based on 1st integer.
            STA     L04FC
            LDA     L0001,X
            STA     L04FD
            INY
            JSR     L824D           ; Convert a 2nd small integer.
            BCC     L81BB
            CMP     #$0D            ; Check for end of line.
            BNE     L81BB
            LDA     L0000,X         ; Fetch ZP pointer based on 2nd integer.
            STA     L04FE
            LDA     L0001,X
            STA     L04FF
            STZ     L0039           ; Mark as using data already in memory.
            BRA     L81FA
.L81BB      LDX     #$FF            ; Wasn't an integer, maybe filename?
.L81BD      INX
            LDA     L01A0,X
            CMP     #$20
            BEQ     L81BD
            CMP     #$0D
            BEQ     L81E6
.L81C9      LDA     L01A0,X         ; Copy filename into workspace.
            CMP     #$0D
            BEQ     L81D8
            CMP     #$20
            BCC     L81E6
            CMP     #$7F
            BCS     L81E6
.L81D8      STA     L04C8,X
            INX
            CMP     #$0D
            BNE     L81C9
            LDA     #$01            ; Flag as file
            STA     L0039
            BRA     L81FA
.L81E6      LDX     #$FF            ; Flag as empty buffer.
            STX     L0039
            LDA     #$0D            ; Set a NULL filename.
            STA     L04C8
            CMP     (OSHWM)         ; Is there an old file in memory?
            BNE     L81FA
            CMP     (L0004)
            BNE     L81FA
            JSR     L84B6           ; Attempt to recover old file?
.L81FA      LDA     #$A1            ; Read the "Edit" byte in CMOS RAM.
            LDX     #$08
            LDY     #$10
            JSR     OSBYTE
            STY     options
            LDA     #$0D
            STA     L0400
            STA     L0464
            STA     L0463
            STA     L04C7
            STA     L04FB
            STZ     L004D
            LDA     L0039
            BEQ     L8223
            CMP     #$01
            BEQ     L8229
            JMP     L852A
.L8223      JSR     LB363
            JMP     exec_f9

.L8229      STZ     L0024
            JSR     LB363
            JSR     LB325
            LDY     #$00
            LDA     #$C8            ; Set up pointer to filename.
            STA     L0006
            LDA     #$04
            STA     L0007
            JSR     L832C           ; Load file.
            JMP     L8531
.L8241      LDX     #$52
            LDY     #$00
            RTS
.inc5253    INC     L0052
            BNE     L824C
            INC     L0053
.L824C      RTS
.L824D      LDX     #$00
            STZ     L0057
.L8251      LDA     L01A0,Y
            CMP     #$30
            BCC     L8277
            CMP     #$3A
            BCC     L8266
            SBC     #$37
            CMP     #$0A
            BCC     L8277
            CMP     #$10
            BCS     L8277
.L8266      ASL     L0057
            ASL     L0057
            ASL     L0057
            ASL     L0057
            AND     #$0F
            TSB     L0057
            INY
            LDX     #$01
            BRA     L8251
.L8277      CPX     #$01
            LDX     L0057
            RTS
.get_io_inc JSR     inc5253
.get_iobyte PHX
            PHY
            JSR     L8241
            LDA     #$05            ; Read a byte from I/O processor memory.
            JSR     OSWORD
            PLY
            PLX
            LDA     L0056
            RTS
.L828E      SEC
            SBC     L0008
            STA     L0027
            TXA
            SBC     L0009
            STA     L0028
.L8298      LDA     (L0006),Y
            CMP     #$0D
            BEQ     L82BF
            CMP     #$8B
            BEQ     L82AF
            LDX     #$00
.L82A4      LDA     (L0006),Y
            STA     L04C8,X
            INY
            INX
            CPX     #$34
            BNE     L82A4
.L82AF      LDA     L04C8
            CMP     #$0D
            BEQ     L82F8
            LDA     #$C8
            STA     L0052
            LDA     #$04
            STA     L0053
            RTS
.L82BF      LDX     L0012
            LDY     L0013
            PHX
            PHY
            LDX     L0022
            LDY     L0023
            JSR     L9A68
            LDY     #$00
.L82CE      LDA     (L0012),Y
            STA     L0600,Y
            INY
            BNE     L82CE
            PLY
            PLX
            JSR     L9AC7
            LDY     #$FF
.L82DD      INY
            BMI     L82F8
            LDA     L0600,Y
            CMP     #$0D
            BEQ     L82F8
            CMP     #$3E
            BNE     L82DD
            INY
            STY     L0052
.L82EE      LDA     L0600,Y
            CMP     #$0D
            BEQ     L830C
            INY
            BPL     L82EE
.L82F8      TYA
            BEQ     L82DD
.L82FB      BRK
            EQUB    $01
            EQUS    "No name found",$00
            EQUB    $00
.L830C      LDA     #$06
            STA     L0053
            RTS
.L8311      JSR     blk_on_wht
            LDY     #$FF
.L8316      INY
            LDA     (L0052),Y
            CMP     #$20
            BEQ     L8316
.L831D      LDA     (L0052),Y
            CMP     #$21
            BCC     L8329
            JSR     OSWRCH
            INY
            BRA     L831D
.L8329      JMP     wht_on_blk
.L832C      LDA     L0022
            STA     L0008
            LDA     L0023
            STA     L0009
            LDA     L0004
            LDX     L0005
.L8338      JSR     L828E
            JSR     L9956
            EQUS    "Loading ",$EA
.L8347      JSR     L8311
.L834A      LDY     #$00            ; Get current filing system.
            TYA
            JSR     OSARGS
            CMP     #$04            ; DFS of better?
            BCC     L8370           ; no, more primitive.
            LDA     #$05            ; Get file attributes.
            JSR     L8241
            JSR     OSFILE
            CMP     #$01            ; Is this a file?
            BNE     L8370
            LDA     L005E           ; Check upper bytes of length
            ORA     L005F           ; must not be > 64K.
            BNE     L8395
            LDA     L0027           ; Work out if the file will fit.
            CMP     L005C
            LDA     L0028
            SBC     L005D
            BCC     L8395           ; File won't fit.
.L8370      LDA     L0008
            STA     L0054
            LDA     L0009
            STA     L0055
            STZ     L0056
            STZ     L0057
            STZ     L0058
            LDA     #$FF            ; Load file.
            JSR     L8241
            JSR     OSFILE
            STZ     L04FF
            CLC
            LDA     L0008
            ADC     L005C
            TAX
            LDA     L0009
            ADC     L005D
            TAY
            RTS
.L8395      BRK
            EQUB    $02
            EQUS    "File too big",$00
.L83A4      JSR     L8298
.L83A7      JSR     L9956
            EQUS    "Saving to ",$EA
.L83B5      JSR     L8311
            LDX     #$0F            ; Clear OSFILE control block.
.L83BA      STZ     L0054,X
            DEX
            BPL     L83BA
            DEC     L0058           ; Set EXEC address to &FFFF
            DEC     L0059
            DEC     L005A
            DEC     L005B
            LDA     L0012           ; Set start address.
            STA     L005C
            LDA     L0013
            STA     L005D
            LDA     L0064           ; Set end address.
            STA     L0060
            LDA     L0065
            STA     L0061
            LDA     #$00            ; Save file.
            JSR     L8241
            JMP     OSFILE

.L83DF      JSR     L8415
            TYA
            BEQ     L83EF
.L83E5      LDA     L04FF,Y
            CMP     #$20
            BNE     L83EF
            DEY
            BNE     L83E5
.L83EF      LDA     #$0D
            STA     L0500,Y
            LDY     #$FF
.L83F6      INY
            LDA     L0500,Y
            CMP     #$20
            BEQ     L83F6
            CLC
.L83FF      TYA
            ADC     #$00
            STA     L0006
            LDA     #$00
            ADC     #$05
            STA     L0007
            LDY     #$00
            LDA     (L0006)
            CMP     #$0D
.L8410      RTS
.L8411      LDY     #$00
            BRA     L83FF
.L8415      LDA     #' '            ; Print a space.
            JSR     OSWRCH
            LDA     #$06
            STA     L0034
            JSR     L8440
            BCC     L8410
.L8423      JSR     write_istr
            EQUS    $03,$0F,$0D,$EA
.L842A      LDA     L0024
            CMP     #$02
            BNE     L8436
            JSR     LADD3
            JSR     ctl_up
.L8436      STZ     L0039
            JMP     L80C5
.L843B      BIT     L00FF
            BMI     L8423
            RTS
.L8440      LDY     #$00
.L8442      JSR     OSRDCH
            BCS     L8479
            STA     L0500,Y
            CMP     #$7F
            BNE     L8458
            CPY     #$00
            BEQ     L8442
            DEY
            JSR     OSWRCH
            BRA     L8442
.L8458      CMP     #$15
            BNE     L8468
            LDA     #$7F
.L845E      CPY     #$00
            BEQ     L8442
            JSR     OSWRCH
            DEY
            BRA     L845E
.L8468      INY
            CMP     #$0D
            BEQ     L8472
            JSR     LB1C1
            BRA     L8442
.L8472      PHY
            JSR     L9815
            PLY
            DEY
            CLC
.L8479      RTS
.L847A      STX     L0025
            STY     L0026
            LDA     L0025
            ORA     L0026
            BEQ     L84B5
            LDX     L0026
            SEC
            LDA     #$00
            SBC     L0025
            TAY
            BEQ     L84A7
            STA     L0006
            SEC
            LDA     L000A
            SBC     L0006
            STA     L000A
            BCS     L849C
            DEC     L000B
            SEC
.L849C      LDA     L000C
            SBC     L0006
            STA     L000C
            BCS     L84A6
            DEC     L000D
.L84A6      INX
.L84A7      LDA     (L000A),Y
            STA     (L000C),Y
            INY
            BNE     L84A7
            INC     L000B
            INC     L000D
            DEX
            BNE     L84A7
.L84B5      RTS
.L84B6      LDA     L0023
            JSR     L84EF
            BCC     L84EE
            LDA     L0011
            JSR     L84EF
            BCC     L84EE
            LDA     L0013
            JSR     L84EF
            BCC     L84EE
            LDA     L0005
            JSR     L84EF
            BCC     L84EE
            LDX     L0004
            LDY     L0005
            JSR     L9AC7
            LDA     L0022
            STA     L04FC
            LDA     L0023
            STA     L04FD
            LDA     L0010
            STA     L04FE
            LDA     L0011
            STA     L04FF
.L84ED      CLC
.L84EE      RTS
.L84EF      CMP     HIMEM+1
            BCS     L84ED
            CMP     OSHWM+1
            RTS
            
; Print the in-line string following the subroutine call.

.write_istr PLA                     ; Store return address as the string address.
            STA     L0000
            PLA
            STA     L0001
            JSR     write_str       ; Print the string.
            JMP     (L0000)         ; Jump to the NOP at the end of the string.

; Print the string whose address is in L0000, terminated by a NOP.

.L8502      JSR     OSWRCH
.write_str  INC     L0000           ; Increment to next character.
            BNE     L850B
            INC     L0001
.L850B      LDA     (L0000)         ; Fetch character.
            CMP     #$EA            ; Terminator?
            BNE     L8502           ; If not, loop and print.
            RTS

; shift-f0 - Toggle display returns.

.exec_sf0   LDA     #$20
            EOR     options
.L8516      STA     options
            PHX
            PHY
            TAY
            LDA     #$A2            ; Write the "Edit" byte in CMOS RAM.
            LDX     #$08
            JSR     OSBYTE
            PLY
            PLX
            RTS
.L8525      LDA     #$10
            BIT     options
            RTS
.L852A      JSR     LB363
.L852D      LDX     L0022
            LDY     L0023
.L8531      JSR     LB329
.L8534      LDX     #$FF
            TXS
            STZ     L0024
            JSR     L978C
            LDA     #$06
            STA     L0034
.main_loop  JSR     LAFFD
            JSR     text_curs
            JSR     L980F
            LDA     #$05
            STA     L0034
            JSR     L98D4           ; Get input character and check Esc.
            TAX
            BPL     L85C1           ; Probably an ASCII character.
            CMP     #$B0
            BCS     L85C1           ; Too high to be a function key.
            LDX     L0039
            BNE     L85C1           ; Flag set to insert code literally.
            TAX
            LDA     options
            AND     #$07
            CMP     #$05            ; Check for describe mode.
            BNE     L85B5
            CPX     #$9C
            BCS     L85B5           ; Out of range for describe.
            CPX     #$90
            BCS     L8570           ; It's a shift-function key - describe.
            CPX     #$8A
            BCS     L85B5           ; Out of range for describe.
.L8570      TXA
            PHA
            ASL     A               ; Convert to a table index.
            TAY
            JSR     write_istr      ; Restore windows, move to line 8.
            EQUS    $1A,$1E,$1F,$00,$08,$EA
.L857D      LDA     L874F,Y         ; Get low byte from table.
            STA     L0000
            LDA     L874F+1,Y       ; Get hight byte from table.
            STA     L0001
.L8587      LDY     #$00
            JSR     OSNEWL
.L858C      LDA     (L0000)         ; Fetch character.
            INC     L0000
            BNE     L8594
            INC     L0001
.L8594      CMP     #$0D            ; Handle CR separately.
            BEQ     desc_cr
            CMP     #$EA            ; End marker (NOP)?
            BEQ     L85AE
            JSR     OSWRCH
            INY
            BRA     L858C           ; Loop for next character.

.desc_cr    LDA     #$20            ; Pad to the end of the area.
.L85A4      CPY     #$36
            BCS     L8587
            JSR     OSWRCH
            INY
            BRA     L85A4

.L85AE      JSR     text_win        ; Re-create text window (if used).
            JSR     text_curs       ; Set the cursor to the insert point.
            PLX
.L85B5      TXA                     ; Convert key to table index.
            ASL     A
            TAX
            JSR     L85BE           ; Invoke the routine.
            JMP     main_loop       ; Loop for next character.
.L85BE      JMP     (L86EF,X)

.L85C1      JSR     L85C7           ; Process non-function character.
            JMP     main_loop

.L85C7      CMP     #$7F
            BEQ     L8631
            STZ     L04FF
            CMP     #$0D
            BNE     L85E3
            JSR     L8525           ; Check bit 4 of options.
            BNE     L85E1
            JSR     L97D4
            BCS     L85E1
            STZ     L0036
            JMP     curs_down
.L85E1      LDA     #$0D
.L85E3      PHA
            JSR     L9B08
            JSR     L8525           ; Check bit 4 of options.
            BNE     L85F4
            LDY     L0036
            LDA     (L0012),Y
            CMP     #$0D
            BNE     L85FB
.L85F4      LDX     #$01
            LDA     L0036
            JSR     L9B36
.L85FB      PLA                     ; Store character in buffer.
            LDY     L0036
            STA     (L0012),Y
            CMP     #$0D
            BNE     L861F
            JSR     LB1D0
            LDA     L0036
            LDY     L0037
            JSR     LB0BC
            STZ     L0036
            JSR     curs_down
.L8613      LDA     L0034
            BEQ     L861A
            JSR     LAFFD
.L861A      LDA     #$02
            STA     L0034
.L861E      RTS
.L861F      JSR     LB1C1           ; Display the new character.
            JSR     curs_right      ; Advance the cursor.
.L8625      LDA     L0034
            BEQ     L862C
            JSR     LAFFD
.L862C      LDA     #$01
            STA     L0034
            RTS

.L8631      JSR     L9B2C
            BEQ     L8639
            JMP     curs_left
.L8639      LDA     L0036
            BNE     L8642
            JSR     L97CB
            BCS     L861E
.L8642      JSR     curs_left
            JSR     L97E3
            CMP     L0036
            BCS     L864E
            STA     L0036
.L864E      LDY     L0036
            JSR     L8525
            BNE     L8664
            LDA     (L0012),Y
            CMP     #$0D
            BEQ     L861E
            LDA     #$20
            STA     (L0012),Y
            LDA     #$01
            STA     L0034
            RTS
.L8664      LDA     (L0012),Y
            CMP     #$0D
            BEQ     L8675
            LDA     L0040
            CMP     L002F
            BEQ     L8675
            JSR     L86B6
            BRA     L8625
.L8675      JSR     L86B6
            BRA     L8613
.L867A      JSR     exec_copy
.ctl_copy   STZ     L0036
            LDA     (L0012)
            CMP     #$0D
            BNE     L867A
            JSR     L97E3
            STA     L0040
            JSR     exec_copy
            LDA     #$02
            STA     L0034
            RTS

.exec_copy  JSR     L97D4
            BCC     L869E
            LDA     L0036
            CMP     L0040
            BCC     L869E
.L869D      RTS
.L869E      LDA     L0040
            CMP     L0036
            BCC     L869D
            LDY     #$01
            STY     L0034
            CMP     L002F
            BEQ     L86B4
            LDY     L0036
            LDA     (L0012),Y
            CMP     #$0D
            BNE     L86B6
.L86B4      INC     L0034
.L86B6      CLC
            LDA     L0012
            STA     L0006
            ADC     L0036
            STA     L0008
            LDA     L0013
            STA     L0007
            ADC     #$00
            STA     L0009
            INC     L0012
            BNE     L86CD
            INC     L0013
.L86CD      LDY     L0036
            BRA     L86D5
.L86D1      LDA     (L0006),Y
            STA     (L0012),Y
.L86D5      DEY
            BPL     L86D1
            LDX     mark_count
.L86DA      DEX
            BMI     L869D
            LDY     L0018,X
            CPY     L0008
            LDA     L001A,X
            SBC     L0009
            BCS     L86DA
            INC     L0018,X
            BNE     L86DA
            INC     L001A,X
            BRA     L86DA
.L86EF      EQUW    exec_f0
            EQUW    exec_f1
            EQUW    exec_f2
            EQUW    exec_f3
            EQUW    exec_f4
            EQUW    exec_f5
            EQUW    exec_f6
            EQUW    exec_f7
            EQUW    exec_f8
            EQUW    exec_f9
            EQUW    exec_tab
            EQUW    exec_copy
            EQUW    curs_left
            EQUW    curs_right
            EQUW    curs_down
            EQUW    curs_up
            EQUW    exec_sf0
            EQUW    exec_sf1
            EQUW    exec_sf2
            EQUW    exec_sf3
            EQUW    exec_sf4
            EQUW    exec_sf5
            EQUW    exec_sf6
            EQUW    exec_sf7
            EQUW    exec_sf8
            EQUW    exec_sf9
            EQUW    shift_tab
            EQUW    shift_copy
            EQUW    shift_left
            EQUW    shift_rght
            EQUW    shift_down
            EQUW    shift_up
            EQUW    main_loop       ; ctl-f0
            EQUW    main_loop       ; ctl-f1
            EQUW    main_loop       ; ctl-f2
            EQUW    main_loop       ; ctl-f3
            EQUW    main_loop       ; ctl-f4
            EQUW    main_loop       ; ctl-f5
            EQUW    exec_cf6        ; ctl-f6
            EQUW    exec_cf7        ; ctl-f7
            EQUW    main_loop       ; ctl-f8
            EQUW    main_loop       ; ctl-f9
            EQUW    main_loop       ; ctl-tab
            EQUW    ctl_copy        ; ctl-copy      
            EQUW    ctl_left        ; ctl-left
            EQUW    ctl_right       ; ctl-right
            EQUW    ctl_down        ; ctl-down
            EQUW    ctl_up

.L874F      EQUW    help_f0,help_f1,help_f2,help_f3
            EQUW    help_f4,help_f5,help_f6,help_f7
            EQUW    help_f8,help_f9,help_f9,help_f9
            EQUW    help_f9,help_f9,help_f9,help_f9
            EQUW    help_sf0,help_sf1,help_sf2,help_sf3
            EQUW    help_sf4,help_sf5,help_sf6,help_sf7
            EQUW    help_sf8,help_sf9,help_stab,help_scopy
        
.L8787      EQUS    $B0,"shf-f0",$A6,$A7,"shf-f1",$A6
            EQUS    $A7,"shf-f2",$A6,$A7,"shf-f3",$A6
            EQUS    $A7,"shf-f4",$A6,$A7,"shf-f5",$A6
            EQUS    $A7,"shf-f6",$A6,$A7,"shf-f7",$A6
            EQUS    $A7,"shf-f8",$A6,$A7,"shf-f9",$B1
            EQUS    $A9,"Display",$A9,"Insert/",$A9,"Insert "
            EQUS    $A9,"Remove ",$A9,"Return ",$A9," Set   "
            EQUS    $A9," Clear ",$A9,"Marked ",$A9,"Marked "
            EQUS    $A9,"Clear ",$A9
            EQUS    $A9,"Returns",$A9,"Over   ",$A9," file  "
            EQUS    $A9,"Margins",$A9,"Languag",$A9," Mode  "
            EQUS    $A9," Marks ",$A9,"Move   ",$A9,"Delete "
            EQUS    $A9,"text  ",$A9
            EQUS    $AB,$A6,$A6,"f0",$A6,$A6,$A6
            EQUS    $AF,$A6,$A6,"f1",$A6,$A6,$A6
            EQUS    $AF,$A6,$A6,"f2",$A6,$A6,$A6
            EQUS    $AF,$A6,$A6,"f3",$A6,$A6,$A6
            EQUS    $AF,$A6,$A6,"f4",$A6,$A6,$A6
            EQUS    $AF,$A6,$A6,"f5",$A6,$A6,$A6
            EQUS    $AF,$A6,$A6,"f6",$A6,$A6,$A6
            EQUS    $AF,$A6,$A6,"f7",$A6,$A6,$A6
            EQUS    $AF,$A6,$A6,"f8",$A6,$A6,$A6
            EQUS    $AF,$A6,$A6,"f9",$A6,$A6,$AD
            EQUS    $A9," Goto  ",$A9,"Command",$A9," Load  "
            EQUS    $A9," Save  ",$A9,"Find   ",$A9,"Global "
            EQUS    $A9," Mark  ",$A9,"Marked ",$A9," Print "
            EQUS    $A9," Old  ",$A9
            EQUS    $A9," line  ",$A9,"line   ",$A9," file  "
            EQUS    $A9," file  ",$A9,"String ",$A9,"Replace"
            EQUS    $A9," Place ",$A9,"Copy   ",$A9," text  "
            EQUS    $A9," text ",$A9
            EQUB    $B2,$A6,$A6,$A6,$A6,$A6,$A6,$A6
            EQUB    $AE,$A6,$A6,$A6,$A6,$A6,$A6,$A6
            EQUB    $AE,$A6,$A6,$A6,$A6,$A6,$A6,$A6
            EQUB    $AE,$A6,$A6,$A6,$A6,$A6,$A6,$A6
            EQUB    $AE,$A6,$A6,$A6,$A6,$A6,$A6,$A6
            EQUB    $AE,$A6,$A6,$A6,$A6,$A6,$A6,$A6
            EQUB    $AE,$A6,$A6,$A6,$A6,$A6,$A6,$A6
            EQUB    $AE,$A6,$A6,$A6,$A6,$A6,$A6,$A6
            EQUB    $AE,$A6,$A6,$A6,$A6,$A6,$A6,$A6
            EQUB    $AE,$A6,$A6,$A6,$A6,$A6,$A6,$B3,$EA

.L89B8      EQUS    "The Acorn Screen Editor ",$87
            EQUS    " 1984 Acorn Computers Ver 1.10 ",$B0
            EQUS    $A6,$A6,$A6,$B1
            EQUS    "Shift: screen up                    "
            EQUS    "              Descriptive Mode      "
            EQUS    "   ",$A9," ",$8B," ",$A9
            EQUS    "Control: text startTAB performs "
            EQUS    "tabulation controlled by shift TAB."
            EQUS    "      ",$B0,$A6,$AE,$A6,$A7,$A6,$AE,$A6,$B1
            EQUS    "Shift: word l/r  COPY deletes the"
            EQUS    " character above the cursor.          "
            EQUS    $A9," ",$88,$A4,$A9,$A2,$89," ",$A9
            EQUS    "Control:         shift COPY provides "
            EQUS    "normal soft keys and cursor       "
            EQUS    $B2,$A6,$A7,$A6,$AE,$A6,$A7,$A6,$B3
            EQUS    "    l/r of line         copying "
            EQUS    "(ESCAPE to leave this mode).     "
            EQUS    "        ",$A9," ",$8A," ",$A9
            EQUS    "Shift: screen down control COPY deletes the "
            EQUS    "current line (to next RETURN)  "
            EQUS    $B2,$A6,$A6,$A6,$B3,"Control: text end  "
            EQUB    $EA
            
.help_f0    EQUS    "f0",$0D
            EQUS    "The cursor can be moved to a new line.",$0D
            EQUS    "For this operation lines are character sequences",$0D
            EQUS    "ended by RETURN (|M).",$0D
            EQUB    $EA

.help_sf0   EQUS    "shf-f0",$0D
            EQUS    "The ends of lines can be shown as a special",$0D
            EQUS    "character so that they can be seen clearly.",$0D
            EQUS    "This alters with each press of shf-f0.",$0D
            EQUB    $EA

.help_f1    EQUS    "f1",$0D
            EQUS    "Commands to the computer's operating system can be",$0D
            EQUS    "given. The result is seen at once. Extra commands",$0D
            EQUS    "can be entered until RETURN by itself is typed.",$0D
            EQUB    $EA

.help_sf1   EQUS    "shf-f1",$0D
            EQUS    "Changes between Insert and Over. In Insert mode the",$0D
            EQUS    "text typed is inserted causing the existing text to",$0D
            EQUS    "move. In Over mode the text is typed over old text.",$0D
            EQUB    $EA

.help_f2    EQUS    "f2",$0D
            EQUS    "A text file will be loaded, erasing the current text.",$0D
            EQUS    "RETURN uses the name at the start of text after a '>'",$0D
            EQUS    "COPY, RETURN to use the current file name.",$0D
            EQUB    $EA

.help_sf2   EQUS    "shf-f2",$0D
            EQUS    "A text file will be loaded at the current cursor.",$0D
            EQUS    "RETURN uses the name at the start of text after a '>'",$0D
            EQUS    "COPY, RETURN to use the current file name.",$0D
            EQUS    $EA

.help_f3    EQUS    "f3",$0D
            EQUS    "All or 'mark to cursor' text will be saved to a file.",$0D
            EQUS    "RETURN uses the name at the start of text after a '>'",$0D
            EQUS    "COPY, RETURN to use the current file name.",$0D
            EQUB    $EA

.help_sf3   EQUS    "shf-f3",$0D
            EQUS    "The top and bottom scroll margins have been removed.",$0D
            EQUS    "Set Top scroll margin to cursor line with ctrl-f6",$0D
            EQUS    "Set Bottom scroll margin to cursor line with ctrl-f7",$0D
            EQUB    $EA

.help_f4    EQUS    "f4:- Interactive Find and Replace Function.",$0D
            EQUS    "RETURN to use last f4. Special search characters are:",$0D
            EQUS    "# digit, $ RETURN, . any, [ ] set of char, a-z a to z",$0D
            EQUS    "~ not, * many, ^ many, | control, @ alpha, \ literal.",$0D
            EQUB    $EA

.help_sf4   EQUS    "shf-f4",$0D
            EQUS    "Return to specified language.",$0D
            EQUS    "The text in the buffer will be 'transferred' into the",$0D
            EQUS    "language.",$0D
            EQUB    $EA

.help_f5    EQUS    "f5:- Global replace.              All, or marked text.",$0D
            EQUS    "RETURN to use last f5. Special replace characters are:",$0D
            EQUS    "/ to begin the replace section; & is the found string",$0D
            EQUS    "%n found wild section n. See f4 for find characters.",$0D
            EQUB    $EA

.help_sf5   EQUS    "shf-f5",$0D
            EQUS    "The screen mode may be set to a specific mode. Also",$0D
            EQUS    "Descriptive (D), or Key legend (K) modes may be set.",$0D
            EQUS    "D and K use mode 0.",$0D
            EQUB    $EA

.help_f6    EQUS    "f6",$0D
            EQUS    "The current position of the cursor (_) is remembered.",$0D
            EQUS    "The number at the bottom indicates how many (0,1,2)",$0D
            EQUS    "marks (",$FF,") are being used.",$0D
            EQUS    $EA

.help_sf6   EQUS    "shf-f6",$0D
            EQUS    "All place marks are cleared.",$0D
            EQUB    $0D,$0D,$EA

.help_f7    EQUS    "f7",$0D
            EQUS    "The text between two marked places is copied to",$0D
            EQUS    "the current cursor position.",$0D
            EQUS    "The marks are NOT cleared.",$0D
            EQUB    $EA

.help_sf7   EQUS    "shf-f7",$0D
            EQUS    "The text between two marked places is moved to",$0D
            EQUS    "the current cursor position.",$0D
            EQUS    "The marks are then cleared.",$0D,$EA

.help_f8    EQUS    "f8",$0D
            EQUS    "The whole text is printed out to the screen or printer",$0D
            EQUS    "using the built-in formatter/paginator.",$0D
            EQUB    $0D,$EA

.help_sf8   EQUS    "shf-f8",$0D
            EQUS    "The text between the cursor and the marked place",$0D
            EQUS    "is deleted.",$0D
            EQUS    "The mark is then cleared.",$0D
            EQUB    $EA

.help_f9    EQUS    "f9",$0D
            EQUS    "The old text in the buffer is recovered after a BREAK",$0D
            EQUS    "or immediately after a Clear Text (by shf-f9).",$0D
            EQUB    $0D,$EA

.help_sf9   EQUS    "shf-f9",$0D
            EQUS    "All text in the buffer is deleted.",$0D
            EQUS    "Use shf-f9 twice to remove the text beyond hope of a",$0D
            EQUS    "recovery by f9.",$0D
            EQUB    $EA

.help_stab  EQUS    "shf-TAB",$0D
            EQUS    "The TAB key may be used to move to zones of eight",$0D
            EQUS    "characters across the screen, or to position under",$0D
            EQUS    "the first character of the line immediately above.",$0D
            EQUB    $EA

.help_scopy EQUS    "shf-COPY",$0D
            EQUS    "Cursor editing can be used with "
            EQUS    $8B,$88,$A4,$A2,$89,$8A," and COPY.",$0D
            EQUS    "User defined soft keys are available as normal.",$0D
            EQUS    "All characters except ESCAPE are put into text.",$0D
            EQUS    $EA

.L978C      LDA     #$04            ; Disable cursor editing.
            LDX     #$02            ; Cursor keys act as soft-keys.
            JSR     OSBYTE
            LDA     #$DB            ; Read/write TAB character.
            LDX     #$8A            ; Set to generate &8A.
            LDY     #$00
            JSR     OSBYTE
            LDA     #$E3            ; Read/write CTRL+function key status.
            LDX     #$A0            ; Generate codes starting with &A0.
            LDY     #$00
            JSR     OSBYTE
            LDA     #$E2            ; Read/write SHIFT+function key status
            LDX     #$90            ; Generate codes starting with &90.
            LDY     #$00
            JSR     OSBYTE
            LDX     #$80            ; Generate codes starting with &80.
.L97B0      LDA     #$E1            ; Read/write plain function key status.
            LDY     #$00
            JMP     OSBYTE
.L97B7      LDA     #$DB            ; Read/write TAB character.
            LDX     #$09            ; Set it back to a real tab.
            LDY     #$00
            JSR     OSBYTE
            LDA     #$04            ; Re-enable cursor editing.
            LDX     #$00
            JSR     OSBYTE
            LDX     #$01
            BRA     L97B0
.L97CB      LDA     L0022
            CMP     L0010
            LDA     L0023
            SBC     L0011
            RTS
.L97D4      CLC
            LDA     L0040
            ADC     L0012
            TAX
            LDA     #$00
            ADC     L0013
            CPX     L0004
            SBC     L0005
            RTS
.L97E3      LDY     #$00
.L97E5      LDA     (L0012),Y
            CMP     #$0D
            BEQ     L97F0
            INY
            CPY     L002F
            BNE     L97E5
.L97F0      TYA
            RTS
.L97F2      STX     L0025
            STY     L0026
            SEC
            LDA     L0012
            SBC     L0025
            TAX
            LDA     L0013
            SBC     L0026
            TAY
            STX     L0006
            STY     L0007
            CPX     L0010
            SBC     L0011
            BCC     L980C
            RTS
.L980C      JMP     LBBAF
.L980F      LDX     #$01
            LDY     #$01
            BNE     L9819
.L9815      LDX     #$01
            LDY     #$00
.L9819      LDA     #$17            ; Re-program display character.
            JSR     OSWRCH
            TXA
            JSR     OSWRCH
            TYA
            JSR     OSWRCH
            JSR     write_istr
            EQUS    $00,$00,$00,$00,$00,$00,$00,$EA
.L9831      RTS
.L9832      LDA     options
            AND     #$07
            CMP     #$02
            BEQ     L9871
            CMP     #$05
            BEQ     L9871
            BRA     L987C
.L9840      LDA     options
            AND     #$07
            CMP     #$02
            BEQ     L984C
            CMP     #$05
            BNE     L987C
.L984C      PHA
            JSR     write_istr
            EQUS    $1A,$1E,$EA
.L9853      JSR     blk_on_wht
            LDA     #$87
            STA     L0001
            LDA     #$87
            STA     L0000
            JSR     L850B
            PLA
            CMP     #$02
            BEQ     L9871
            LDA     #$89
            STA     L0001
            LDA     #$B8
            STA     L0000
            JSR     L850B
.L9871      JSR     wht_on_blk
            JSR     L988F
            STA     L0031
            JSR     text_win
.L987C      JSR     L988F
            TAX
            INX
            LDA     L002F
.L9883      STA     L0732,X
            DEX
            BPL     L9883
            JSR     L98E5
            STZ     L0035
            RTS
.L988F      LDA     #$A0            ; Read VDU variable.
            LDX     #$0A            ; Text window, right column.
            JSR     OSBYTE
            STX     L002F
            STY     L0030
            LDX     #$08            ; Text window, left column
            JSR     OSBYTE
            TYA
            CLC
            SBC     L0030
            STA     L0030
            RTS
.text_win   LDA     options
            AND     #$07
            LDY     #$0E
            CMP     #$05            ; Describe mode?
            BEQ     L98B6
            LDY     #$07
            CMP     #$02
            BNE     L98CF
.L98B6      LDA     #$1C            ; Define text window.
            JSR     OSWRCH
            LDA     #$00
            JSR     OSWRCH
            LDA     L0031
            INC     A
            JSR     OSWRCH
            LDA     L002F
            JSR     OSWRCH
            TYA
            JMP     OSWRCH
.L98CF      LDA     #$1A            ; Restore default windows.
            JMP     OSWRCH
.L98D4      LDA     L0041
            BEQ     L98DD
            LDA     L0042
            STZ     L0041
            RTS
.L98DD      JSR     OSRDCH
            JMP     L843B
.L98E3      STZ     L0034
.L98E5      JSR     L998D
            JSR     blk_on_wht
            LDX     L0039
            BEQ     L9903
            JSR     write_istr
            EQUS    "Cursor Editing",$EA
.L9901      BRA     L9931
.L9903      JSR     L8525
            BEQ     L9915
            JSR     write_istr
            EQUS    "Insert ",$EA
.L9913      BRA     L9920
.L9915      JSR     write_istr
            EQUS    "Over   ",$EA
.L9920      LDA     mark_count
            ORA     #$30            ; Convert to digit.
            JSR     OSWRCH
            JSR     write_istr
            EQUS    " marks",$EA
.L9931      JSR     wht_on_blk
            LDY     L0030
            INY
            LDA     #$0D
            JMP     LB0BC
.L993C      JSR     L9956
            EQUS    "Type filename ",$EA
.L994E      LDX     #$01
            BRA     L996A
.L9952      LDX     #$0E
            BRA     L995E
.L9956      LDY     L0030
            INY
            JSR     LB0B0
            LDX     #$00
.L995E      LDY     L0030
            INY
            JSR     move_crsr
            LDX     #$01
            BRA     L996A
.L9968      LDX     #$00
.L996A      JSR     blk_on_wht
            PLA
            STA     L0000
            PLA
            STA     L0001
            JSR     write_str
            JSR     wht_on_blk
            TXA
            BEQ     L9984
            LDA     L002F
            DEC     A
            LDY     L0030
            STA     L0733,Y
.L9984      JMP     (L0000)
.text_curs  LDX     L0036
            LDY     L0037
            BPL     move_crsr
.L998D      LDY     L0030
            INY
.L9990      LDX     #$00
.move_crsr  LDA     #$1F            ; Move text cursor to X,Y
            JSR     OSWRCH
            TXA
            JSR     OSWRCH
            TYA
            JMP     OSWRCH
.L999F      LDA     L0010
            STA     L0006
            LDA     L0011
            STA     L0007
            JSR     L99BA
            STA     L0000
            SEC
            LDA     L0010
            SBC     L0000
            TAX
            LDA     L0011
            SBC     #$00
            TAY
            JMP     L9A68
.L99BA      CLC
            LDA     L0006
            SBC     L002F
            STA     L0006
            BCS     L99C5
            DEC     L0007
.L99C5      LDY     L002F
.L99C7      LDA     (L0006),Y
            CMP     #$0D
            BEQ     L99D2
.L99CD      DEY
            BPL     L99C7
            BMI     L99BA
.L99D2      STY     L002C
            SEC
            LDA     L002F
            SBC     L002C
            RTS
.L99DA      LDX     L0012
            LDY     L0013
            STX     L000E
            STY     L000F
.L99E2      TAX
            STX     L002D
            BEQ     L9A00
.L99E7      LDY     #$FF
.L99E9      INY
            LDA     (L000E),Y
            CMP     #$0D
            BEQ     L99F4
            CPY     L002F
            BNE     L99E9
.L99F4      STA     L002C
            TYA
            JSR     L9A01
            BCS     L9A00
            DEC     L002D
            BNE     L99E7
.L9A00      RTS
.L9A01      SEC
            ADC     L000E
            TAX
            LDA     #$00
            ADC     L000F
            TAY
            CPX     HIMEM
            SBC     HIMEM+1
            BCS     L9A14
            STX     L000E
            STY     L000F
.L9A14      RTS
.L9A15      LDX     L0010
            LDY     L0011
            STX     L000E
            STY     L000F
            TAX
            STX     L002D
            BEQ     L9A5D
            LDX     #$00
.L9A24      LDA     L0022
            CMP     L000E
            LDA     L0023
            SBC     L000F
            BCS     L9A5C
            CLC
            LDA     L000E
            SBC     L002F
            STA     L000E
            BCS     L9A39
            DEC     L000F
.L9A39      LDY     L002F
            LDA     (L000E),Y
            CMP     #$0D
            BNE     L9A57
            LDA     L000E
            STA     L0006
            LDA     L000F
            STA     L0007
            JSR     L99CD
            BEQ     L9A57
            TYA
            ADC     L000E
            STA     L000E
            BCC     L9A57
            INC     L000F
.L9A57      INX
            CPX     L002D
            BCC     L9A24
.L9A5C      TXA
.L9A5D      RTS

.shift_up   LDA     L0030
            INC     A
.L9A61      JSR     L9A15
            LDX     L000E
            LDY     L000F
.L9A68      STX     L000A
            STY     L000B
            SEC
            LDA     L0010
            SBC     L000A
            STX     L0010
            TAX
            LDA     L0011
            SBC     L000B
            STY     L0011
            TAY
            STX     L0025
            STY     L0026
            LDA     L0012
            SBC     L0025
            STA     L000C
            STA     L0012
            LDA     L0013
            SBC     L0026
            STA     L000D
            STA     L0013
            STX     L0025
            STY     L0026
.L9A93      LDA     L0025
            TAY
            ORA     L0026
            BEQ     L9ABC
            LDX     L0026
            CLC
            TXA
            ADC     L000B
            STA     L000B
            TXA
            ADC     L000D
            STA     L000D
            INX
            BCC     L9AAE
.L9AAA      LDA     (L000A),Y
            STA     (L000C),Y
.L9AAE      DEY
            CPY     #$FF
            BNE     L9AAA
            DEX
            BEQ     L9ABC
            DEC     L000B
            DEC     L000D
            BNE     L9AAA
.L9ABC      RTS

.shift_down LDA     L0030
            INC     A
.L9AC0      JSR     L99DA
.L9AC3      LDX     L000E
            LDY     L000F
.L9AC7      LDA     L0012
            STA     L000A
            LDA     L0013
            STA     L000B
            LDA     L0010
            STA     L000C
            LDA     L0011
            STA     L000D
            SEC
            TXA
            SBC     L0012
            TAX
            TYA
            SBC     L0013
            TAY
            CLC
            TXA
            ADC     L0010
            STA     L0010
            TYA
            ADC     L0011
            STA     L0011
            TXA
            ADC     L0012
            STA     L0012
            TYA
            ADC     L0013
            STA     L0013
            JMP     L847A
.L9AF8      JSR     L9B08
            CLC
            LDA     L0012
            ADC     L0036
            TAX
            LDA     L0013
            ADC     #$00
            TAY
            BRA     L9AC7
.L9B08      JSR     L9B2C
            BEQ     L9B29
            PHA
            TAX
            LDA     L0040
            JSR     L9B36
            LDX     L0040
            LDY     L0037
            JSR     move_crsr
            LDA     #' '
            JSR     OSWRCH
            PLX
            LDY     L0036
.L9B23      DEY
            STA     (L0012),Y
            DEX
            BNE     L9B23
.L9B29      JMP     text_curs
.L9B2C      SEC
            LDA     L0036
            SBC     L0040
            BCS     L9B35
            LDA     #$00
.L9B35      RTS
.L9B36      STA     L002C
            CLC
            ADC     L0012
            PHA
            LDA     L0013
            ADC     #$00
            PHA
            PHX
            LDY     #$00
            JSR     L97F2
            LDY     #$00
.L9B49      LDA     (L0012),Y
            STA     (L0006),Y
            INY
            CPY     L002C
            BCC     L9B49
            STX     L0012
            LDA     L0007
            STA     L0013
            PLX
            STX     L002D
            PLA
            STA     L0007
            PLA
            STA     L0006
            LDY     mark_count
.L9B63      DEY
            BMI     L9B82
            LDX     L0018,Y
            CPX     L0006
            LDA     L001A,Y
            SBC     L0007
            BCS     L9B63
            SEC
            TXA
            SBC     L002D
            STA     L0018,Y
            LDA     L001A,Y
            SBC     #$00
            STA     L001A,Y
            BRA     L9B63
.L9B82      RTS

.shift_tab  LDA     #$08
            EOR     options
            STZ     L0034
            JSR     L8516
            LDA     #$08
            AND     options
            BNE     L9BA8
            JSR     L9952
            EQUS    " TAB columns of 8",$EA
.L9BA7      RTS
.L9BA8      JSR     L9952
            EQUS    " TAB below words.",$EA
.L9BBD      RTS

.exec_tab   LDA     #$08
            BIT     options
            BNE     L9BD6
.L9BC4      INC     L0036
            LDA     L0036
            AND     #$07
            BNE     L9BC4
            LDA     L0036
            CMP     L002F
            BCC     L9BFE
            STZ     L0036
            BRA     L9BFE
.L9BD6      LDA     #$01
            JSR     L9A15
            LDY     L0036
            DEY
.L9BDE      INY
            CPY     L002F
            BCS     L9BEF
            LDA     (L000E),Y
            CMP     #$0D
            BEQ     L9BEF
            CMP     #$20
            BNE     L9BDE
            BRA     L9BF1
.L9BEF      LDY     #$FF
.L9BF1      INY
            CPY     L002F
            BCS     L9BFC
            LDA     (L000E),Y
            CMP     #$20
            BEQ     L9BF1
.L9BFC      STY     L0036
.L9BFE      STZ     L0034
.L9C00      RTS

; shift-f4 - Return to language.

.exec_sf4   JSR     L9956
            EQUS    "Type language name:",$EA
.L9C18      JSR     L8415
            BEQ     L9C00
            LDY     #$00
.L9C1F      LDA     L0500,Y
            INY
            CMP     #$0D
            BNE     L9C1F
            STA     L0501,Y
            LDA     #$20
            STA     L04FF,Y
            LDA     #$40
            STA     L0500,Y
            LDA     #$06
            STA     L0034
            JSR     ctl_up
            LDA     L0013
            DEC     A
            CMP     OSHWM+1
            BCS     L9C6B
.L9C42      BRK
            EQUB    $02
            EQUS    "Not enough space to return to language",$00
.L9C6B      LDA     #$FF
            STA     L0024
            LDA     OSHWM+1
            INC     A
            STA     L000B
            STZ     L000A
            LDA     #$00
            STA     (L0004)
            LDA     L0012
            STA     L0008
            LDA     L0013
            STA     L0009
.L9C82      LDA     (L0008)
            STA     (L000A)
            INC     L000A
            BNE     L9C8C
            INC     L000B
.L9C8C      INC     L0008
            BNE     L9C82
            INC     L0009
            LDA     L0009
            CMP     HIMEM+1
            BNE     L9C82
            JSR     L980F
            JSR     write_istr
            EQUS    $1A,$0C,$EA
.L9CA1      JSR     L97B7
            LDA     OSHWM+1
            INC     A
            STA     L0001
            STZ     L0000
            LDX     #$00
            LDY     #$05
            JMP     OSCLI
            EQUS    $0E,$0D,$0D,"Format commands:- {initial values}",$0D,$0D,".afrn assign format n to "
            EQUS    "register r {0}",$0D,".anrn assign number to register r {0}",$0D,".bl   bold "
            EQUS    "line",$0D,".bp   begin page",$0D,".cc c control character is c {.}",$0D,".ce   cen"
            EQUS    "tre line",$0D,".ch*c chain in next file",$0D,".co   comment line",$0D,".dmcc defin"
            EQUS    "e macro to .en",$0D,".ds   double space lines",$0D,".ef   even page foot tit"
            EQUS    "le to .en",$0D,".eh   even page head title to .en",$0D,".en   end of .at, .i"
            EQUS    "x or .ef etc",$0D,".ep   begin even page",$0D,".ff   form feed the printer, "
            EQUS    "wait if paged mode",$0D,".fo   even and odd foot title to .en",$0D,".he   ev"
            EQUS    "en and odd head title to .en",$0D,".ic   close indexfile",$0D,".ig   ignore "
            EQUS    "input until .en",$0D,".in+- indent left margin n places {0}",$0D,".io*c open"
            EQUS    " indexfile for output",$0D,".ix   send text to indexfile until .en",$0D,".ju"
            EQUS    "   justify right margin of lines {on}",$0D,".ll+- line length includin"
            EQUS    "g indent {76}",$0D,".ls+- line spacing is n {1}",$0D,".lv n leave n blank li"
            EQUS    "nes (by .ne n and .sp n)",$0D,".ne n needs n output lines, .bp if nece"
            EQUS    "ssary",$0D,".nj   no justification of lines",$0D,".nn   no new line after th"
            EQUS    "is line",$0D,".of   odd page foot title to .en",$0D,".oh   odd page head tit"
            EQUS    "le to .en",$0D,".op   begin odd page",$0D,".os*c call operating system with "
            EQUS    "this string",$0D,".pl+- text area length is n lines {58}",$0D,".po+- page of"
            EQUS    "fset is n {0}",$0D,".rf   right flush this line",$0D,".sp n insert n blank l"
            EQUS    "ines",$0D,".ss   single space lines",$0D,".ta   define tabs {8,16,24,...,96}"
            EQUS    $0D,".tcc  define tab character as c {ctrl I}",$0D,".ti+- temporary indent"
            EQUS    " n",$0D,".trcc translate {ctrl J is space}",$0D,".ul   underline line",$0D,$0D,"n rep"
            EQUS    "resents a decimal number, 0 is used if not present",$0D,"Spaces are al"
            EQUS    "lowed before n. c represents any character",$0D,"+- allows n, +n or -n"
            EQUS    ": .in+2 sets an indent 2 more than current",$0D,".ti+2 is a temporary "
            EQUS    "indent of 2 more than the current indent",$0D,$0D,"Formatting commands wh"
            EQUS    "ich can appear anywhere",$0D,$0D,".bb   begin bold",$0D,".bu   begin underline",$0D
            EQUS    ".eb   end bold",$0D,".eu   end underline",$0D,".oc n output CHR$(n) to print"
            EQUS    "er counted as 1 char",$0D,".on n output CHR$(n) to printer without bei"
            EQUS    "ng counted",$0D,".r0-9 contents of register e.g. .r0",$0F,$0D,$0D,$EA
.LA424      LDA     #$B2
            STA     L0000
            LDA     #$9C
            STA     L0001
            LDA     (L0000)
.LA42E      JSR     OSASCI
            INC     L0000
            BNE     LA437
            INC     L0001
.LA437      LDA     (L0000)
            BPL     LA42E
            JSR     L9968
            EQUS    "Press SHIFT to continue",$EA
.LA456      JSR     LADFE
            JMP     L8534
.LA45C      JMP     LA424

; f8 - Print text.

.exec_f8    JSR     LBE22
            LDX     #$FF
            STX     L0029
            STX     L002A
            TXS
            JSR     L9956
            EQUS    "S(creen), P(rinter) or H(elp) ?",$EA
.LA48C      JSR     LBBE6
            CMP     #$68
            BEQ     LA45C
            CMP     #$73
            BEQ     LA49D
            CMP     #$70
            BNE     LA48C
            STZ     L002A
.LA49D      JSR     L9956
            EQUS    "C(ontinuous) or P(aged) ?",$EA
.LA4BA      JSR     LBBE6
            CMP     #$63
            BEQ     LA4C7
            CMP     #$70
            BNE     LA4BA
            STZ     L0029
.LA4C7      JSR     L84B6
            LDA     L0022
            STA     L0008
            LDA     L0023
            STA     L0009
            LDA     #$2E
            STA     L0045
            LDA     #$09
            STA     L004E
            LDX     #$00
.LA4DC      STZ     L0500,X
            INX
            TXA
            STA     L0600,X
            BNE     LA4DC
            LDA     #$08
.LA4E8      STA     L051C,X
            INX
            CLC
            ADC     #$08
            CMP     #$64
            BCC     LA4E8
            LDA     #$20
            STA     L060A
            LDA     #$01
            STA     L0500
            STA     L001F
            STA     L0502
            STZ     L004B
            STZ     L004D
            STZ     L001D
            STZ     L0049
            STZ     L001B
            STZ     L003A
            STZ     L0048
            STZ     L0019
            LDA     #$3A
            STA     L0043
            LDA     #$02
            STA     L0024
            JSR     write_istr
            EQUS    $1A,$0C,$EA
.LA520      BIT     L002A
            BMI     LA533
            LDX     #$00
            LDA     #$05            ; Set printer driver type.
            JSR     OSBYTE          ; Set it
            JSR     OSBYTE          ; Set if back.  Current type in X.
            LDA     #$02            ; Turn on printer.
            JSR     OSWRCH
.LA533      BIT     L0029
            BMI     LA540
            BIT     L002A
            BPL     LA540
            LDA     #$0E            ; Paged mode on.
            JSR     OSWRCH
.LA540      LDA     #$4C
            STA     L001A
            LDA     #$FF
            STA     L0044
.LA548      LDA     #$0D
            STA     (L0010)
            LDA     #$DD
            STA     L0514
            STA     L0516
            LDA     #$AF
            STA     L0515
            STA     L0517
            LDA     #$E5
            STA     L0518
            STA     L051A
            LDA     #$AF
            STA     L0519
            STA     L051B
            LDX     #$D0
.LA56E      STZ     L052F,X
            DEX
            BNE     LA56E
.LA574      STZ     L0017
            STZ     L0018
            LDA     #$FF
            STA     L003B
            LDA     L001D
            STA     L001C
            STA     L0047
            LDA     L0049
            STA     L001E
            STA     L0046
.LA588      LDX     #$80
            STX     L0014
            LDA     L0009
            CMP     #$A5
            BCS     LA59C
            LDA     L0008
            CMP     L0010
            LDA     L0009
            SBC     L0011
            BCS     LA616
.LA59C      LDA     (L0008)
            CMP     L0045
            BNE     LA5EA
            LDX     #$00
            LDY     #$02
            LDA     (L0008),Y
            STA     L0007
            DEY
            LDA     (L0008),Y
            STA     L0006
.LA5AF      CMP     fmt_tab,X
            BEQ     LA5EC
.LA5B4      INX
            INX
            INX
            INX
            CPX     #$AC
            BNE     LA5AF
            LDX     L0007
            JSR     LA8D6
            BCC     LA5EA
            LDA     L0008
            PHA
            LDA     L0009
            PHA
            LDA     L0045
            PHA
            LDA     (L005C)
            STA     L0045
            LDA     L005C
            STA     L0008
            LDA     L005D
            STA     L0009
            LDY     #$02
            JSR     LA60C
            PLA
            STA     L0045
            PLA
            STA     L0009
            PLA
            STA     L0008
            LDY     #$03
            BRA     LA5FC
.LA5EA      BRA     LA654
.LA5EC      LDA     L0007
            CMP     fmt_tab+1,X
            BEQ     LA5F7
            LDA     L0006
            BRA     LA5B4
.LA5F7      LDY     #$03
            JSR     LA64F
.LA5FC      JSR     LA71B
            PHA
            DEY
            CLC
            JSR     LAAF3
            PLA
            CMP     L0045
            BEQ     LA59C
            LDY     #$00
.LA60C      JSR     fmt_co
            SEC
            JSR     LAAF3
            JMP     LA588
.LA616      JSR     fmt_bp
            BIT     L002A
            BPL     LA63F
            JSR     L9968
            EQUS    "Print done, press shift key",$EA
.LA63C      JSR     LADFE
.LA63F      JSR     write_istr
            EQUS    $03,$0F,$EA
.LA645      JSR     LADD3
            LDX     L0010
            LDY     L0011
            JMP     L8531
.LA64F      LDA     #$FF
            JMP     (fmt_tab+2,X)
.LA654      LDA     #$FF
            CMP     L0044
            BNE     LA65D
            JSR     LAB55
.LA65D      LDA     L001A
            LDY     L003B
            INY
            BEQ     LA669
            SEC
            SBC     L003B
            BRA     LA66C
.LA669      SEC
            SBC     L001B
.LA66C      STA     L003C
            LDY     #$00
            LDX     #$00
            STZ     L003D
            STZ     L004A
.LA676      CPY     #$FA
            BCS     LA6D3
            JSR     LA725
            CMP     #$0D
            BEQ     LA6D3
            CMP     L004E
            BNE     LA6AB
            TXA
            LDX     #$FF
.LA688      INX
            PHA
            LDA     L051C,X
            BEQ     LA6A8
            PLA
            CMP     L051C,X
            BCS     LA688
            PHA
            LDA     L051C,X
            PLX
            INY
            CMP     L003C
            BCS     LA6B9
            TAX
            STX     L0015
            STX     L004A
            STZ     L003D
            BRA     LA6B5
.LA6A8      PLX
            LDA     #$20
.LA6AB      CMP     #$20
            BNE     LA6B3
            STX     L0015
            INC     L003D
.LA6B3      INX
            INY
.LA6B5      CPX     L003C
            BCC     LA676
.LA6B9      JSR     LA725
            CMP     #$20
            BEQ     LA6D0
            CMP     L004E
            BEQ     LA6D0
            CMP     #$0D
            BEQ     LA6D0
            LDA     L003D
            BEQ     LA6D0
            LDX     L0015
            DEC     L003D
.LA6D0      DEX
            STZ     L0014
.LA6D3      INX
            STX     L002D
            BIT     L002A
            BPL     LA6DF
            JSR     LAD0E
            BRA     LA6F9
.LA6DF      LDA     #$40
            TSB     L002A
            LDA     L001C
            PHA
            JSR     LACF1
            PLA
            STA     L001C
            BIT     L0047
            BPL     LA6F9
            LDA     #$40
            TRB     L002A
            JSR     LAD0E
            STZ     L001C
.LA6F9      BIT     L0019
            BMI     LA70A
            LDX     L001F
.LA6FF      JSR     LACB2
            LDA     L0044
            INC     A
            BEQ     LA70A
            DEX
            BNE     LA6FF
.LA70A      STZ     L0019
            JSR     LA71B
            CMP     #$0D
            BEQ     LA714
            DEY
.LA714      CLC
            JSR     LAAF3
            JMP     LA574
.LA71B      LDA     (L0008),Y
            INY
            BEQ     LA724
            CMP     #$20
            BEQ     LA71B
.LA724      RTS
.LA725      LDA     (L0008),Y
            CMP     L0045
            BNE     LA774
            INY
            LDA     (L0008),Y
            CMP     #$62
            BEQ     LA73E
            CMP     #$6F
            BEQ     LA74C
            CMP     #$72
            BEQ     LA760
            CMP     #$65
            BNE     LA771
.LA73E      INY
            LDA     (L0008),Y
            CMP     #$62
            BEQ     LA749
            CMP     #$75
            BNE     LA770
.LA749      INY
            BRA     LA725
.LA74C      INY
            LDA     (L0008),Y
            CMP     #$6E
            BEQ     LA758
            CMP     #$63
            BNE     LA770
            INX
.LA758      PHX
            INY
            JSR     LAB2B
            PLX
            BRA     LA725
.LA760      INY
            LDA     (L0008),Y
            CMP     #$30
            BCC     LA770
            CMP     #$3A
            BCS     LA770
            JSR     LAE1A
            BRA     LA749
.LA770      DEY
.LA771      DEY
            LDA     (L0008),Y
.LA774      RTS
.LA775      INY
.LA776      LDA     (L0008),Y
            CMP     L0045
            BNE     LA774
            INY
            LDA     (L0008),Y
            CMP     #$62
            BEQ     LA7A6
            CMP     #$6F
            BEQ     LA7C5
            CMP     #$72
            BEQ     LA7E2
            CMP     #$65
            BNE     LA771
            INY
            LDA     (L0008),Y
            CMP     #$62
            BEQ     LA7A0
            CMP     #$75
            BNE     LA770
            STZ     L001D
            STZ     L001C
            BRA     LA775
.LA7A0      STZ     L0049
            STZ     L001E
            BRA     LA775
.LA7A6      INY
            LDA     (L0008),Y
            CMP     #$62
            BEQ     LA7BB
            CMP     #$75
            BNE     LA770
            LDA     #$FF
            STA     L001C
            STA     L001D
            STA     L0047
            BRA     LA775
.LA7BB      LDA     #$FF
            STA     L0049
            STA     L0046
            STA     L001E
            BRA     LA775
.LA7C5      INY
            LDA     (L0008),Y
            CMP     #$6E
            BEQ     LA7D1
            CMP     #$63
            BNE     LA770
            INX
.LA7D1      PHX
            INY
            JSR     LAB2B
            LDA     #$01            ; Next character to printer.
            JSR     OSWRCH
            TXA
            JSR     OSWRCH
            PLX
            BRA     LA776
.LA7E2      INY
            LDA     (L0008),Y
            CMP     #$30
            BCC     LA770
            CMP     #$3A
            BCS     LA770
            JSR     LAE1A
            PHX
            LDX     L0006
.LA7F3      LDA     L005C,X
            JSR     LAC6E
            DEX
            BPL     LA7F3
            PLX
            JMP     LA775

.fmt_af     JSR     LAB2B
            AND     #$0F
            ASL     A
            TAX
            LDA     L0501,X
            AND     #$0F
            STA     L0501,X
            INY
            PHX
            JSR     LAB2B
            PLX
            ASL     A
            ASL     A
            ASL     A
            ASL     A
            ORA     L0501,X
            STA     L0501,X
            RTS

.fmt_an     JSR     LAB2B
            AND     #$0F
            ASL     A
            PHA
            LDA     (L0008),Y
            INY
            PHA
            JSR     LAB2B
            PLA
            CMP     #$2B
            BEQ     LA848
            CMP     #$2D
            BEQ     LA85D
            CMP     #$3D
            BEQ     LA871
            TXA
            PLX
            STA     L0500,X
            LDA     L0501,X
            AND     #$F0
            STA     L0501,X
            RTS

.LA848      CLC
            STX     L005C
            PLX
            LDA     L0500,X
            ADC     L005C
            STA     L0500,X
            LDA     L0501,X
            ADC     #$00
            STA     L0501,X
            RTS
.LA85D      STX     L005C
            PLX
            LDA     L0500,X
            SBC     L005C
            STA     L0500,X
            LDA     L0501,X
            SBC     #$00
            STA     L0501,X
            RTS
.LA871      TXA
            AND     #$0F
            ASL     A
            TAX
            LDA     L0501,X
            AND     #$0F
            STA     L005C
            LDA     L0500,X
            PLX
            STA     L0500,X
            LDA     L0501,X
            AND     #$F0
            ORA     L005C
            STA     L0501,X
            RTS

.fmt_bl     STA     L001E
            STA     L0046
            RTS

.fmt_bp     LDA     L0044
            JMP     LAA84

.fmt_cc     LDA     (L0008),Y
            STA     L0045
            INY
            RTS

.fmt_ce     STA     L0017
            STZ     L0018
            RTS

.fmt_ch     LDA     L0008
            STA     L0006
            LDA     L0009
            STA     L0007
            LDA     L0022
            STA     L0008
            LDA     L0023
            STA     L0009
            LDA     L0004
            LDX     L0005
            JSR     L828E
            JSR     L834A
            STX     L0010
            STY     L0011
            LDX     #$FF
            TXS
            JMP     LA548

.fmt_co     LDA     #$0D
            BRA     LA8D1

.LA8CC      INY
            BNE     LA8D1
            INC     L0009
.LA8D1      CMP     (L0008),Y
            BNE     LA8CC
            RTS
.LA8D6      STA     L0006
            STX     L0007
            LDX     #$FE
.LA8DC      INX
            INX
            CPX     #$D0
            BCS     LA908
            LDA     L0530,X
            STA     L005C
            LDA     L0531,X
            STA     L005D
            BEQ     LA90A
            PHY
            LDY     #$03
.LA8F1      LDA     (L005C),Y
            INY
            CMP     #$20
            BEQ     LA8F1
            STA     L005E
            LDA     (L005C),Y
            PLY
            CMP     L0007
            BNE     LA8DC
            LDA     L005E
            CMP     L0006
            BNE     LA8DC
            RTS
.LA908      CLC
            TXA
.LA90A      RTS
.LA90B      DEY
            RTS

.fmt_dm     JSR     LA71B
            CMP     #$0D
            BEQ     LA90B
            CMP     #$45
            BEQ     LA90B
            TAX
            LDA     (L0008),Y
            CMP     #$0D
            BEQ     LA90B
            JSR     LA8D6
            BNE     LA90B
            LDA     L0008
            STA     L0530,X
            LDA     L0009
            STA     L0531,X
            BRA     LA94B

.fmt_ds     LDA     #$02
            STA     L001F
            RTS

.fmt_ef     LDA     L0008
            STA     L0518
            LDA     L0009
            STA     L0519
            BRA     LA94B

.fmt_eh     LDA     L0008
            STA     L0514
            LDA     L0009
            STA     L0515
.LA94B      CLC
            JSR     LAAF3
.LA94F      LDA     (L0008)
            INC     L0008
            BNE     LA963
            PHA
            INC     L0009
            LDA     L0008
            CMP     L0010
            LDA     L0009
            SBC     L0011
            BCS     LA976
            PLA
.LA963      CMP     L0045
            BNE     LA94F
            LDA     (L0008)
            CMP     #$65
            BNE     LA94F
            LDY     #$01
            LDA     (L0008),Y
            CMP     #$6E
            BNE     LA94F
            INY
.LA976      RTS

.fmt_en     TSX
            CPX     #$FD
            BCS     LA976
            PLA
            PLA
            RTS

.fmt_ep     JSR     fmt_bp
            LDA     L0500
            LSR     A
            BCS     fmt_ep
            RTS

.fmt_ff     LDA     L0029
            BMI     LA994
            LDA     L002A
            BPL     LA999
            JSR     LADFE
.LA994      LDA     #$0C            ; Clear text area.
            JMP     OSWRCH
.LA999      JSR     LA994
            JMP     LADFE

.fmt_fo     LDA     L0008
            STA     L051A
            LDA     L0009
            STA     L051B
            JMP     fmt_ef

.fmt_he     LDA     L0008
            STA     L0516
            LDA     L0009
            STA     L0517
            JMP     fmt_eh

.fmt_ic     PHY
            JSR     LADD3
            PLY
            RTS

.fmt_ig     JMP     LA94B

.fmt_in     LDX     L001B
            JSR     LAAFD
            STX     L001B
            RTS

.fmt_io     CLC
            JSR     LAAF3
            JSR     LADD3
            LDX     L0008
            LDY     L0009
            LDA     #$80            ; Open file for output.
            JSR     OSFIND
            STA     L004D
            LDY     #$00
            JMP     fmt_co

.fmt_ix     STA     L004B
            CLC
            JSR     LAAF3
            LDA     L0044
            PHA
            LDA     #$FD
            STA     L0044
            JSR     LA588
            PLA
            STA     L0044
            STZ     L004B
            RTS

.fmt_ju     STZ     L003A
            RTS

.fmt_jl     LDX     L001A
            JSR     LAAFD
            STA     L001A
            RTS

.fmt_ls     LDX     L001F
            JSR     LAAFD
            STX     L001F
            RTS

.fmt_lv     JSR     LAB2B
            CMP     L0044
            BEQ     LAA18
            BCC     LAA18
            PHA
            JSR     fmt_bp
            PLA
.LAA18      JMP     LAA84

.fmt_ne     JSR     LAB2B
            CMP     L0044
            BEQ     LAA27
            BCC     LAA27
            JMP     fmt_bp

.LAA27      RTS

.fmt_nj     STA     L003A
            RTS

.fmt_nn     STA     L0019
            RTS

.fmt_of     LDA     L0008
            STA     L051A
            LDA     L0009
            STA     L051B
            JMP     LA94B

.fmt_oh     LDA     L0008
            STA     L0516
            LDA     L0009
            STA     L0517
            JMP     LA94B

.fmt_op     JSR     fmt_bp
            LDA     L0500
            LSR     A
            BCC     fmt_op
            RTS

.fmt_os     CLC
            JSR     LAAF3
            LDX     L0008
            LDY     L0009
            JSR     OSCLI
            LDY     #$00
            JMP     fmt_co

.fmt_pl     LDX     L0043
            JSR     LAAFD
            TXA
            BEQ     LAA73
            STA     L0043
            LDX     L0044
            INX
            BEQ     LAA73
            STA     L0044
.LAA73      RTS

.fmt_po     LDX     L0048
            JSR     LAAFD
            STA     L0048
            RTS

.fmt_rf     STA     L0018
            STZ     L0017
            RTS

.fmt_sp     JSR     LAB2B
.LAA84      TAX
            BEQ     LAAA7
            PHY
            CMP     #$FF
            BNE     LAA91
            JSR     LAB55
            LDX     L0044
.LAA91      LDA     L0044
            INC     A
            BNE     LAA9B
            PHX
            JSR     LAB55
            PLX
.LAA9B      LDA     #$0D
            JSR     OSWRCH
            JSR     LACB2
            DEX
            BNE     LAA91
            PLY
.LAAA7      RTS

.fmt_ss     LDA     #$01
            STA     L001F
            RTS

.fmt_ta     STZ     L004A
.LAAAF      JSR     LAB2B
            LDX     L004A
            STA     L051C,X
            STZ     L051D,X
            INC     L004A
            JSR     LA71B
            CMP     #$2C
            BEQ     LAAAF
            DEY
            RTS

.fmt_tc     LDA     (L0008),Y
            STA     L004E
            INY
            RTS

.fmt_ti     LDX     L003B
            CPX     #$FF
            BNE     LAAD3
            LDX     L001B
.LAAD3      JSR     LAAFD
            STX     L003B
            RTS

.fmt_tr     LDA     (L0008),Y
            CMP     #$0D
            BEQ     LAAED
            TAX
            INY
            LDA     (L0008),Y
            DEY
            CMP     #$0D
            BEQ     LAAED
            INY
            INY
            STA     L0600,X
.LAAED      RTS

.fmt_ul     STA     L001C
            STA     L0047
            RTS

.LAAF3      TYA
            ADC     L0008
            STA     L0008
            BCC     LAAFC
            INC     L0009
.LAAFC      RTS
.LAAFD      JSR     LA71B
            CMP     #$2D
            BEQ     LAB1B
            CMP     #$2B
            BEQ     LAB0B
            DEY
            LDX     #$00
.LAB0B      PHX
            JSR     LAB2B
            PLX
            CLC
            STX     L0006
            ADC     L0006
            BCC     LAB19
            LDA     #$00
.LAB19      TAX
            RTS
.LAB1B      PHX
            JSR     LAB2B
            STA     L0006
            PLA
            SEC
            SBC     L0006
            BCS     LAB19
            LDA     #$00
            TAX
            RTS
.LAB2B      LDX     #$00
            JSR     LA71B
            DEY
.LAB31      LDA     (L0008),Y
            CMP     #$30
            BCC     LAB53
            CMP     #$3A
            BCS     LAB52
            AND     #$0F
            PHA
            TXA
            ASL     A
            ASL     A
            STA     L0006
            TXA
            CLC
            ADC     L0006
            ASL     A
            STA     L0006
            PLA
            CLC
            ADC     L0006
            TAX
            INY
            BRA     LAB31
.LAB52      CLC
.LAB53      TXA
            RTS
.LAB55      LDX     L0514
            LDY     L0515
            LDA     L0500
            LSR     A
            BCC     LAB67
            LDX     L0516
            LDY     L0517
.LAB67      DEC     L0044
            JSR     LAB7B
            LDA     L0043
            STA     L0044
            LDA     #$01
            STA     L0502
            LDA     #$0F
            TRB     L0503
            RTS
.LAB7B      LDA     L0008
            PHA
            LDA     L0009
            PHA
            LDA     L0045
            PHA
            LDA     L001A
            PHA
            LDA     L001B
            PHA
            LDA     L003B
            PHA
            LDA     L001E
            PHA
            LDA     L0049
            PHA
            LDA     L0046
            PHA
            LDA     L001C
            PHA
            LDA     L001D
            PHA
            LDA     L0047
            PHA
            LDA     L003A
            PHA
            LDA     L001F
            PHA
            LDA     L0017
            PHA
            LDA     L0018
            PHA
            LDA     L0019
            PHA
            STZ     L0019
            STZ     L003A
            STZ     L0049
            STZ     L001D
            STZ     L001B
            LDA     #$01
            STA     L001F
            STX     L0008
            STY     L0009
            LDA     (L0008)
            STA     L0045
            LDY     #$03
            CLC
            JSR     LAAF3
            JSR     LA574
            PLA
            STA     L0019
            PLA
            STA     L0018
            PLA
            STA     L0017
            PLA
            STA     L001F
            PLA
            STA     L003A
            PLA
            STA     L0047
            PLA
            STA     L001D
            PLA
            STA     L001C
            PLA
            STA     L0046
            PLA
            STA     L0049
            PLA
            STA     L001E
            PLA
            STA     L003B
            PLA
            STA     L001B
            PLA
            STA     L001A
            PLA
            STA     L0045
            PLA
            STA     L0009
            PLA
            STA     L0008
            RTS
.LAC01      TAY
            LDA     L0600,Y
            STA     L0052
            JSR     L8241
            LDA     #$0A            ; Read character definition.
            JMP     OSWORD
.LAC0F      BIT     L001E
            BPL     LAC2A
            PHY
            PHX
            JSR     LAC01
            LDX     #$07
.LAC1A      LDA     L0053,X
            LSR     A
            ORA     L0053,X
            STA     L0053,X
            DEX
            BPL     LAC1A
            BIT     L001C
            BPL     LAC3E
            BRA     LAC33
.LAC2A      BIT     L001C
            BPL     LAC9B
            PHY
            PHX
            JSR     LAC01
.LAC33      LDA     L005A
            LSR     A
            ROR     A
            ORA     L005A
            ROL     A
            EOR     #$FF
            TSB     L005A
.LAC3E      LDA     #$17            ; Re-program display character.
            JSR     OSWRCH
            LDA     #' '
            JSR     OSWRCH
            LDX     #$01
.LAC4A      LDA     L0052,X
            JSR     OSWRCH
            INX
            CPX     #$09
            BNE     LAC4A
            JSR     write_istr
            EQUS    " ",$17," ",$00,$00,$00,$00,$00,$00,$00,$00,$EA
.LAC63      PLX
            PLY
            RTS
.LAC66      LDA     #$7E            ; Acknowledge Escape condition.
            JSR     OSBYTE
            JMP     LA63F
.LAC6E      BIT     L00FF
            BMI     LAC66
            BIT     L004B
            BMI     LACA4
            CMP     #$0D
            BEQ     LACA1
            BIT     L002A
            BMI     LAC0F
            BVS     LAC88
            LDA     #$20
            BIT     L001C
            BPL     LAC88
            LDA     #$5F
.LAC88      PHA
            LDA     #$20
            BIT     L002A
            BNE     LAC9A
            BIT     L001E
            BMI     LAC9A
            LDA     #' '
            JSR     OSWRCH
            PLA
            RTS
.LAC9A      PLA
.LAC9B      PHY
            TAY
            LDA     L0600,Y
            PLY
.LACA1      JMP     (WRCHV)
.LACA4      PHY
            TAY
            LDA     L0600,Y
            LDY     L004D
            BEQ     LACB0
            JSR     OSBPUT
.LACB0      PLY
            RTS
.LACB2      BIT     L004B
            BMI     LACF0
            LDA     #$0A
            INC     L0502
            BNE     LACC0
            INC     L0503
.LACC0      DEC     L0044
            BNE     LACA1
            JSR     OSWRCH
            PHX
            PHY
            LDX     L0518
            LDY     L0519
            LDA     L0500
            LSR     A
            BCC     LACDB
            LDX     L051A
            LDY     L051B
.LACDB      DEC     L0044
            DEC     L0044
            JSR     LAB7B
            LDA     #$FF
            STA     L0044
            INC     L0500
            BNE     LACEE
            INC     L0501
.LACEE      PLY
            PLX
.LACF0      RTS
.LACF1      LDA     #$20
            TSB     L002A
            LDA     L001E
            PHA
            JSR     LAD0E
            PLA
            STA     L001E
            BIT     L0046
            BPL     LACF0
            LDA     #$20
            TRB     L002A
            JSR     LAD0E
            LDA     #$20
            TSB     L002A
            RTS
.LAD0E      LDA     L0048
            JSR     LADDF
            STZ     L0016
            LDA     L0014
            BNE     LAD20
            SEC
            LDA     L003C
            SBC     L002D
            STA     L0016
.LAD20      LDA     L003B
            CMP     #$FF
            BNE     LAD28
            LDA     L001B
.LAD28      JSR     LADDF
            LDA     L0017
            BPL     LAD38
            SEC
            LDA     L003C
            INC     A
            SBC     L002D
            JSR     LADE0
.LAD38      BIT     L0018
            BPL     LAD46
            SEC
            LDA     L003C
            ADC     #$01
            SBC     L002D
            JSR     LADDF
.LAD46      LDY     #$00
            LDX     #$00
            LDA     L003D
            BEQ     LAD6A
            LSR     A
            STA     L003E
            LDA     #$00
            BIT     L003A
            BMI     LAD59
            LDA     L0016
.LAD59      LDX     #$01
.LAD5B      CMP     L003D
            BCC     LAD64
            INX
            SBC     L003D
            BCS     LAD5B
.LAD64      STX     L003F
            STA     L0016
            LDX     #$00
.LAD6A      JSR     LA776
            CMP     #$0D
            BEQ     LADD0
            CMP     L004E
            BNE     LAD9B
            TXA
            LDX     #$FF
.LAD78      INX
            PHA
            LDA     L051C,X
            BEQ     LAD98
            PLA
            CMP     L051C,X
            BCS     LAD78
            SEC
            SBC     L051C,X
            EOR     #$FF
            INC     A
            PHX
            JSR     LADDF
            PLX
            LDA     L051C,X
            TAX
            DEX
            BRA     LADC8
.LAD98      PLX
            LDA     #$20
.LAD9B      CMP     #$20
            BNE     LADC5
            CPX     L004A
            BCC     LADC5
            PHX
            LDX     L003F
.LADA6      DEX
            BEQ     LADB0
            LDA     #$20
            JSR     LAC6E
            BRA     LADA6
.LADB0      PLX
            SEC
            LDA     L003E
            SBC     L0016
            STA     L003E
            BCS     LADC3
            ADC     L003D
            STA     L003E
            LDA     #$20
            JSR     LAC6E
.LADC3      LDA     #$20
.LADC5      JSR     LAC6E
.LADC8      INY
            INX
            CPX     L002D
            BCC     LAD6A
            LDA     #$0D
.LADD0      JMP     LAC6E
.LADD3      LDY     L004D
            BEQ     LADDE
            STZ     L004D
            LDA     #$00            ; Close file.
            JSR     OSFIND
.LADDE      RTS
.LADDF      ASL     A
.LADE0      LSR     A
            BEQ     LADFD
            TAX
            LDA     #$09
            BIT     L002A
            BMI     LADEC
            LDA     #$20
.LADEC      BIT     L004B
            BPL     LADF7
            LDA     #$20
            JSR     LACA4
            BRA     LADFA
.LADF7      JSR     OSWRCH
.LADFA      DEX
            BNE     LADEC
.LADFD      RTS
.LADFE      PHX
            PHY
.LAE00      JSR     L843B
            LDX     #$FF            ; Check shift key status.
            LDY     #$FF
            LDA     #$81
            JSR     OSBYTE
            CPX     #$FF
            BNE     LAE00
            LDA     #$0F            ; Flush buffer.
            LDX     #$FF
            JSR     OSBYTE
            PLY
            PLX
            RTS
.LAE1A      PHX
            PHY
            AND     #$0F
            ASL     A
            TAX
            LDA     L0500,X
            STA     L0006
            LDA     L0501,X
            TAX
            AND     #$0F
            STA     L0007
            ORA     L0006
            PHP
            TXA
            LSR     A
            LSR     A
            LSR     A
            LSR     A
            PLP
            BNE     LAE40
            CMP     #$08
            BCC     LAE44
            LDA     #$00
            BRA     LAE44
.LAE40      CMP     #$08
            BCS     LAE85
.LAE44      PHA
            LDX     #$04
            LDA     #$30
            STA     L0061
            STA     L0062
            STA     L0063
.LAE4F      LDA     #$30
            STA     L005C,X
            SEC
.LAE54      LDA     L0006
            SBC     LBDAC,X
            TAY
            LDA     L0007
            SBC     LBDB1,X
            BCC     LAE69
            STY     L0006
            STA     L0007
            INC     L005C,X
            BNE     LAE54
.LAE69      DEX
            BPL     LAE4F
            PLA
            STA     L0006
            LDX     #$08
.LAE71      DEX
            CPX     L0006
            BEQ     LAE7C
            LDA     L005C,X
            AND     #$0F
            BEQ     LAE71
.LAE7C      STX     L0006
            PLY
            PLA
            SEC
            ADC     L0006
            TAX
            RTS
.LAE85      PHA
            CMP     #$0A
            BCS     LAED2
            LDA     #$FF
            PHA
            LDX     #$0C
.LAE8F      SEC
            LDA     L0006
            SBC     LAEFD,X
            TAY
            LDA     L0007
            SBC     LAF0A,X
            BCC     LAEB2
            STY     L0006
            STA     L0007
            TXA
            ASL     A
            TAY
            LDA     LAF17,Y
            PHA
            LDA     LAF18,Y
            CMP     #$20
            BEQ     LAE8F
            PHA
            BRA     LAE8F
.LAEB2      DEX
            BPL     LAE8F
.LAEB5      PLA
            INX
            STA     L005C,X
            CMP     #$FF
            BNE     LAEB5
            DEX
.LAEBE      PLA
            AND     #$01
            BEQ     LAE7C
            STX     L0006
.LAEC5      LDA     L005C,X
            ORA     #$20
            STA     L005C,X
            DEX
            BPL     LAEC5
            LDX     L0006
            BRA     LAE7C
.LAED2      LDA     L0006
            BNE     LAED8
            DEC     L0007
.LAED8      DEC     L0006
            LDY     #$00
.LAEDC      LDA     L0006
            SEC
.LAEDF      INY
            SBC     #$1A
            BCS     LAEDF
            STA     L0006
            LDA     L0007
            BEQ     LAEEE
            DEC     L0007
            BRA     LAEDC
.LAEEE      LDA     L0006
            ADC     #$5B
            LDX     #$00
.LAEF4      STA     L005C,X
            INX
            DEY
            BNE     LAEF4
            DEX
            BRA     LAEBE
.LAEFD      EQUB    $01,$04,$05,$09,$0A,$28,$32,$5A
            EQUB    $64,$90,$F4,$84,$E8
.LAF0A      EQUB    $00,$00,$00,$00,$00,$00,$00,$00
            EQUB    $00,$01,$01,$03,$03
.LAF17      EQUB    $49
.LAF18      EQUB    $20,$49,$56,$56,$20,$49,$58,$58
            EQUB    $20,$58,$4C,$4C,$20,$58,$43,$43
            EQUB    $20,$43,$44,$44,$20,$44,$4D,$4D
            EQUB    $20
.fmt_tab    EQUS    "af"
            EQUW    fmt_af
            EQUS    "an"
            EQUW    fmt_an
            EQUS    "bl"
            EQUW    fmt_bl
            EQUS    "bp"
            EQUW    fmt_bp
            EQUS    "cc"
            EQUW    fmt_cc
            EQUS    "ce"
            EQUW    fmt_ce
            EQUS    "ch"
            EQUW    fmt_ch
            EQUS    "co"
            EQUW    fmt_co
            EQUS    "dm"
            EQUW    fmt_dm
            EQUS    "ds"
            EQUW    fmt_ds
            EQUS    "ef"
            EQUW    fmt_ef
            EQUS    "eh"
            EQUW    fmt_eh
            EQUS    "en"
            EQUW    fmt_en
            EQUS    "ep"
            EQUW    fmt_ep
            EQUS    "ff"
            EQUW    fmt_ff
            EQUS    "fo"
            EQUW    fmt_fo
            EQUS    "he"
            EQUW    fmt_he
            EQUS    "ic"
            EQUW    fmt_ic
            EQUS    "ig"
            EQUW    fmt_ig
            EQUS    "in"
            EQUW    fmt_in
            EQUS    "io"
            EQUW    fmt_io
            EQUS    "ix"
            EQUW    fmt_ix
            EQUS    "ju"
            EQUW    fmt_ju
            EQUS    "ll"
            EQUW    fmt_jl
            EQUS    "ls"
            EQUW    fmt_ls
            EQUS    "lv"
            EQUW    fmt_lv
            EQUS    "ne"
            EQUW    fmt_ne
            EQUS    "nj"
            EQUW    fmt_nj
            EQUS    "nn"
            EQUW    fmt_nn
            EQUS    "of"
            EQUW    fmt_of
            EQUS    "oh"
            EQUW    fmt_oh
            EQUS    "op"
            EQUW    fmt_op
            EQUS    "os"
            EQUW    fmt_os
            EQUS    "pl"
            EQUW    fmt_pl
            EQUS    "po"
            EQUW    fmt_po
            EQUS    "rf"
            EQUW    fmt_rf
            EQUS    "sp"
            EQUW    fmt_sp
            EQUS    "ss"
            EQUW    fmt_ss
            EQUS    "ta"
            EQUW    fmt_ta
            EQUS    "tc"
            EQUW    fmt_tc
            EQUS    "ti"
            EQUW    fmt_ti
            EQUS    "tr"
            EQUW    fmt_tr
            EQUS    "ul"
            EQUW    fmt_ul
            EQUS    ".he",$0D,".en",$0D,".fo",$0D,".ce",$0D
            EQUS    "Page .r0",$0D,".ff.en",$0D
.LAFFD      JSR     L97E3
            STA     L0040
            TAY
            BEQ     LB009
            CMP     L002F
            BNE     LB011
.LB009      LDA     L0034
            CMP     #$01
            BNE     LB011
            INC     L0034
.LB011      JSR     LBDB6
            JSR     L9815
            LDA     L0035
            CMP     L0034
            BCC     LB01F
            STA     L0034
.LB01F      STZ     L0035
            LDA     L0034
            CMP     #$06
            BNE     LB02A
            JSR     L9840
.LB02A      LDA     L0034
            BEQ     LB06C
            CMP     #$05
            BCC     LB049
            LDA     L0037
            JSR     L9A15
            STA     L0037
            DEC     A
            STA     L0033
            BMI     LB049
            LDA     #$00
            LDX     L000E
            LDY     L000F
            JSR     LB0FC
            BCS     LB062
.LB049      LDX     L0034
            CPX     #$03
            BEQ     LB06F
            CPX     #$04
            BEQ     LB08E
            LDY     L0030
            STY     L0033
            LDA     L0037
            LDX     L0012
            LDY     L0013
            JSR     LB0FC
            BCC     LB06C
.LB062      LDA     #$02
            CMP     L0034
            BCS     LB06A
            LDA     #$05
.LB06A      STA     L0035
.LB06C      STZ     L0034
            RTS
.LB06F      JSR     L998D
            LDA     #$0A
            JSR     OSWRCH
            LDX     #$FF
.LB079      INX
            LDA     L0733,X
            STA     L0732,X
            CPX     L0030
            BNE     LB079
            STZ     L0733,X
            JSR     L98E5
            LDA     L0030
            BRA     LB0A7
.LB08E      JSR     write_istr
            EQUS    $1E,$0B,$EA
.LB094      LDY     L0030
.LB096      LDA     L0732,Y
            STA     L0733,Y
            DEY
            BPL     LB096
            STZ     L0732
            JSR     L98E5
            LDA     #$00
.LB0A7      STA     L0033
            LDX     L0066
            LDY     L0067
            BNE     LB0FC
            TAY
.LB0B0      PHY
            JSR     L9990
            LDA     #' '
            JSR     OSWRCH
            LDA     #$00
            PLY
.LB0BC      STA     L002C
            LDA     L0732,Y
            CMP     L002C
            BCC     LB0F6
            BEQ     LB0F6
            LDA     #$1C            ; Define text window.
            JSR     OSWRCH
            LDA     L002C
            INC     A
            JSR     OSWRCH
            PHX
            LDA     options
            AND     #$07
            TAX
            TYA
            CLC
            ADC     LB58D,X
            PLX
            PHA
            JSR     OSWRCH
            LDA     L0732,Y
            JSR     OSWRCH
            PLA
            JSR     OSWRCH
            LDA     #$0C            ; Clear text area.
            JSR     OSWRCH
            PHY
            JSR     text_win
            PLY
.LB0F6      LDA     L002C
            STA     L0732,Y
            RTS
.LB0FC      STA     L0032
            STX     L000E
            STY     L000F
            LDX     #$00
            LDA     L0034
            CMP     #$01
            BEQ     LB10E
            CMP     #$02
            BNE     LB116
.LB10E      LDX     L0036
            CPX     L0040
            BCC     LB116
            LDX     L0040
.LB116      PHX
            LDY     L0032
            JSR     move_crsr
            PLY
            DEY
.LB11E      INY
            LDA     (L000E),Y
            CMP     #$0D
            BEQ     LB12E
            JSR     LB1C1
            CPY     L002F
            BNE     LB11E
            BRA     LB131
.LB12E      JSR     LB1D0
.LB131      STY     L002D
            LDY     mark_count
.LB135      DEY
            BMI     LB167
            STY     L002E
            SEC
            LDA     L001C,Y
            SBC     L000E
            TAX
            LDA     L001E,Y
            SBC     L000F
            BCC     LB135
            BNE     LB135
            CPX     L002D
            BEQ     LB150
            BCS     LB135
.LB150      LDY     L0032
            JSR     move_crsr
            LDA     L002E
            CLC
            ADC     #$31
            JSR     LB1DA
            LDX     L002D
            INX
            JSR     move_crsr
            LDY     L002E
            BRA     LB135
.LB167      LDA     L002D
            LDY     L0032
            JSR     LB0BC
            JSR     L9A01
            BCS     LB1A6
            LDA     L0034
            CMP     #$01
            BEQ     LB1BF
            LDY     L0032
            CPY     L0033
            BCS     LB1BF
            LDA     L0034
            CMP     #$06
            BEQ     LB19F
            LDA     L0041
            BNE     LB19D
            LDA     #$81            ; Scan keyboard.
            LDX     #$00
            LDY     #$00
            JSR     OSBYTE
            CPY     #$FF
            BEQ     LB19F
            JSR     L843B
            INC     L0041
            STX     L0042
.LB19D      SEC
            RTS
.LB19F      INC     L0032
            LDX     #$00
            JMP     LB116
.LB1A6      LDX     L002D
            LDY     L0032
            JSR     move_crsr
            LDA     #$2A
            JSR     LB1DA
            BRA     LB1B9
.LB1B4      LDY     L0032
            JSR     LB0B0
.LB1B9      INC     L0032
            CPY     L0030
            BCC     LB1B4
.LB1BF      CLC
            RTS
.LB1C1      CMP     #$20
            BCC     LB1D8
            CMP     #$7F
            BNE     LB1CD
            LDA     #$3F
            BRA     LB1DA
.LB1CD      JMP     OSWRCH
.LB1D0      LDA     #$20
            BIT     options
            BEQ     LB1CD
            LDA     #$0D
.LB1D8      ORA     #$40
.LB1DA      PHA
            LDA     options
            AND     #$07
            CMP     #$07
            BNE     LB1E8
            PLA
            LDA     #$FF
            BRA     LB1CD
.LB1E8      JSR     blk_on_wht
            PLA
            JSR     OSWRCH
.wht_on_blk LDA     #$11            ; Define text colour.
            JSR     OSWRCH
            LDA     #$80            ; Black background.
            JSR     OSWRCH
            LDA     #$11            ; Define text colour.
            JSR     OSWRCH
            LDA     #$07            ; White foreground.
            JMP     OSWRCH
            
.blk_on_wht JSR     write_istr      ; White background, black foreground.
            EQUS    $11,$87,$11,$00,$EA
.LB20B      RTS

.curs_left  JSR     L97CB
            BCC     LB215
            LDA     L0036
            BEQ     LB250
.LB215      DEC     L0036
            BPL     LB250
            LDA     L002F
            STA     L0036
.curs_up    JSR     L97CB
            BCS     LB250
            LDA     #$01
            JSR     L9A61
            LDA     L0050
            CMP     L0037
            BCS     LB231
.LB22D      DEC     L0037
            BPL     LB250
.LB231      LDA     L0037
            JSR     L9A15
            CMP     L0037
            CLC
            BNE     LB22D
            LDA     L000E
            STA     L0066
            LDA     L000F
            STA     L0067
            LDA     #$04
            STA     L0034
            RTS

.ctl_left   STZ     L0036
            BRA     LB250
.ctl_right  LDA     L0040
            STA     L0036
.LB250      STZ     L0034
            RTS

.curs_right LDA     L0036
            CMP     L002F
            BEQ     LB25D
            INC     L0036
            BRA     LB250
.LB25D      JSR     L97D4
            BCS     LB250
            LDA     #$00
            STZ     L0036
.curs_down  JSR     L97D4
            BCS     LB250
            LDA     #$01
            JSR     L9AC0
            LDA     L0037
            CMP     L0051
            BCS     LB27A
            INC     L0037
            BRA     LB250
.LB27A      STZ     L0067
            SEC
            LDA     L0030
            SBC     L0051
            JSR     L99DA
            LDA     L002D
            BNE     LB290
            LDA     L000E
            STA     L0066
            LDA     L000F
            STA     L0067
.LB290      LDA     #$03
            STA     L0034
            CLC
            RTS
.LB296      LDY     L0036
            LDA     (L0012),Y
            CMP     #$0D
            BNE     LB2AC
            JSR     curs_down
            BCS     LB2A9
            JSR     LAFFD
            JMP     ctl_left
.LB2A9      PLA
            PLA
            RTS
.LB2AC      JSR     curs_right
            JSR     LAFFD
            STZ     L0034
            RTS

.shift_rght LDA     L0040
            CMP     L0036
            BCS     LB2C2
            STA     L0036
            BRA     LB2C2
.LB2BF      JSR     LB296
.LB2C2      LDY     L0036
            LDA     (L0012),Y
            JSR     LB312
            BCC     LB2BF
.LB2CB      LDY     L0036
            LDA     (L0012),Y
            JSR     LB312
            BCC     LB2D9
            JSR     LB296
            BRA     LB2CB
.LB2D9      RTS
.LB2DA      LDA     L0036
            BNE     LB2E9
            JSR     curs_up
            BCS     LB2A9
            JSR     LAFFD
            JMP     ctl_right
.LB2E9      JMP     curs_left

.shift_left LDA     L0040
            CMP     L0036
            BCS     LB2F5
            STA     L0036
            RTS
.LB2F5      JSR     LB2DA
            LDY     L0036
            LDA     (L0012),Y
            JSR     LB312
            BCC     LB2F5
.LB301      LDY     L0036
            LDA     (L0012),Y
            JSR     LB312
            BCC     LB30F
            JSR     LB2DA
            BRA     LB301
.LB30F      JMP     curs_right
.LB312      CMP     #$30
            BCC     LB323
            CMP     #$3A
            BCC     LB322
            AND     #$DF
            CMP     #$41
            BCC     LB323
            CMP     #$5B
.LB322      RTS
.LB323      SEC
            RTS
.LB325      LDX     L0022
            LDY     L0023
.LB329      STX     L0010
            STY     L0011
            LDA     L0004
            STA     L0012
            LDA     L0005
            STA     L0013
            STZ     L0039
            STZ     L0041
            STZ     mark_count
            LDA     #$0D
            STA     (OSHWM)
            STA     (L0004)
.ctl_up     LDX     L0022
            LDY     L0023
            JSR     L9A68
            STZ     L0036
            RTS

.ctl_down   LDA     L0051
            STA     L0037
            LDX     L0004
            LDY     L0005
            JSR     L9AC7
            JMP     LBED2

; shift-f1 - Toggle insert/overwrite.

.exec_sf1   LDA     options
            EOR     #$10
            JSR     L8516
            JMP     L98E3

.LB363      LDA     #$16            ; Select screen mode.
            JSR     OSWRCH
            LDA     options
            AND     #$07
            TAY
            LDA     LB594,Y
            ORA     #$80            ; Use shadow mode.
            JSR     OSWRCH
            LDA     #$83            ; Read OSHWM
            JSR     OSBYTE
            STX     OSHWM
            STY     OSHWM+1
            LDA     #$84            ; Read top of user RAM.
            JSR     OSBYTE
            STX     HIMEM
            STY     HIMEM+1
            CLC
            LDA     OSHWM
            ADC     #$01
            STA     L0022
            LDA     OSHWM+1
            ADC     #$00
            STA     L0023
            LDA     HIMEM
            SBC     #$00
            STA     L0004
            LDA     HIMEM+1
            SBC     #$00
            STA     L0005
            JSR     L9832
            LDA     L0030
            SEC
            SBC     #$04
            STA     L0051
            LDA     #$04
            STA     L0050
            RTS

.exec_cf6   LDA     L0037
            STA     L0050
            BRA     LB3C1

.exec_cf7   LDA     L0037
            STA     L0051
            BRA     LB3C1

; shift-f3 - Remove margins

.exec_sf3   STZ     L0050
            LDA     L0030
            STA     L0051
.LB3C1      STZ     L0034
            RTS

; shift-f9 - Clear text.

.exec_sf9   JSR     L9956
            EQUS    "Text will be cleared if a key is hit",$EA
.LB3EC      LDA     #$81            ; Scan keyboard.
            TAX
            LDY     #$03
            JSR     OSBYTE
            JSR     L843B
            CPY     #$00
            BEQ     LB400
            LDA     #$06
            STA     L0034
            RTS
.LB400      JSR     L84B6
            JMP     L852D

; f2 - Load file.

.exec_f2    JSR     L9956
            EQUS    "Type filename to load:",$EA
.LB420      JSR     L83DF
            LDY     #$00
            JSR     L832C
            JMP     L8531

; f3 - Save file.

.exec_f3    JSR     LBE54
            CMP     #$01
            BEQ     LB454
            JSR     L993C
            EQUS    "to save:",$07,$EA
.LB43F      JSR     L83DF
            JSR     LBE65
            LDY     #$00
            JSR     L83A4
            LDX     L0068
            LDY     L0069
            JSR     L9AC7
            JMP     LBED2
.LB454      JSR     L993C
            EQUS    "for MARK TO CURSOR save:",$07,$EA
.LB471      JSR     L83DF
            JSR     LBE65
            LDY     #$00
            LDA     (L0006)
            CMP     #$0D
            BEQ     LB498
            CMP     #$8B
            BEQ     LB498
            LDA     L0006
            STA     L0052
            LDA     L0007
            STA     L0053
            JSR     L83A7
            LDX     L0068
            LDY     L0069
            JSR     L9AC7
            JMP     LBED2
.LB498      BRK
            EQUB    $01
            EQUS    "Bad use of stored name",$00

; shift-f2 - Insert file.

.exec_sf2   JSR     LBE22
            JSR     L9AF8
            JSR     L993C
            EQUS    "to insert:",$EA
.LB4C5      JSR     L83DF
            LDA     L0010
            STA     L0008
            LDA     L0011
            STA     L0009
            LDA     L0012
            LDX     L0013
            LDY     #$00
            JSR     L8338
            STX     L0010
            STY     L0011
            LDX     L0008
            LDY     L0009
            JSR     L9A68
            JMP     L999F

; f1 - Command line.

.exec_f1    LDA     #$01
            STA     L0024
            JSR     L97B7
            JSR     L9956
            EQUS    "Command line",$EA
.LB4FE      JSR     OSNEWL
            JSR     L980F
.LB504      LDA     #'*'            ; Give prompt for command.
            JSR     OSWRCH
            LDA     #$00            ; Read input line.
            LDY     #$B5
            LDX     #$24
            JSR     OSWORD
            BCS     LB529
            LDA     L0500
            CMP     #$0D
            BEQ     LB52E
            LDX     #$00
            LDY     #$05
            JSR     OSCLI
            BRA     LB504
            BRK
            EQUB    $05
            INC     LFF20
.LB529      LDA     #$7E            ; Acknowledge Escape condition.
            JSR     OSBYTE
.LB52E      JSR     write_istr
            EQUS    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$03,$0F,$0D,$1A,$EA
.LB541      LDA     #$87            ; Read character and screen mode.
            JSR     OSBYTE
            LDA     options
            AND     #$07
            TAX
            LDA     LB594,X
            STY     L0000
            EOR     L0000
            AND     #$07
            BEQ     LB563
            LDA     #$16            ; Select screen mode.
            JSR     OSWRCH
            LDA     LB594,X
            ORA     #$80            ; Use shadow mode.
            JSR     OSWRCH
.LB563      JSR     L978C
            JMP     L8534

.shift_copy LDA     #$01
            STA     L0039
            JSR     L97B7
            JMP     L98E3

.LB573      BRK
            EQUB    $01
            EQUS    "Only 0,1,3,4,6,7,D and K"
.LB58D      EQUS    $00
            EQUB    $00,$07,$00,$00,$0E,$00
.LB594      EQUB    $00,$01,$00,$03,$04,$00,$06,$07

; shift-f5 - Set mode.

.exec_sf5   JSR     L9956
            EQUS    "New Mode:",$EA
.LB5A9      JSR     L83DF
            BEQ     LB573
            LDA     (L0006)
            AND     #$DF
            CMP     #$44
            BEQ     LB5D3
            CMP     #$4B
            BEQ     LB5CF
            JSR     LB674
            LDA     L004C
            BNE     LB573
            LDA     L004B
            AND     #$07
            CMP     #$02
            BEQ     LB573
            CMP     #$05
            BEQ     LB573
            BRA     LB5D5
.LB5CF      LDA     #$02
            BRA     LB5D5
.LB5D3      LDA     #$05
.LB5D5      PHA
            TAY
            LDA     LB594,Y
            PHA
            JSR     L84B6
            LDA     #$82            ; Read machine high order address.
            JSR     OSBYTE
            INX
            BNE     LB5FA
            INY
            BNE     LB5FA
            PLA
            PHA
            ORA     #$80
            TAX
            LDA     #$85            ; Read top of user RAM for specified mode.
            JSR     OSBYTE
            CPX     L0010
            TYA
            SBC     L0011
            BCC     LB654
.LB5FA      PLX
            LDA     #$07
            TRB     options
            PLA
            ORA     options
            JSR     L8516
            JSR     LB363           ; Fall through!
            
; f9 - old text.

.exec_f9    LDA     L04FF
            CMP     OSHWM+1
            BCC     LB660
            CMP     HIMEM+1
            BCS     LB660
            CMP     L04FD
            BCC     LB660
            LDA     L04FD
            CMP     OSHWM+1
            BCC     LB660
            LDA     L04FC
            STA     L000A
            LDA     L04FD
            STA     L000B
            SEC
            LDA     L04FE
            SBC     L000A
            TAX
            LDA     L04FF
            SBC     L000B
            TAY
            BCC     LB660
            LDA     L0022
            STA     L000C
            LDA     L0023
            STA     L000D
            PHY
            PHX
            JSR     L847A
            PLA
            CLC
            ADC     L0022
            TAX
            PLA
            ADC     L0023
            TAY
            STZ     L04FF
            JMP     L8531
.LB654      JSR     ctl_up
.LB657      BRK
            EQUB    $02
            EQUS    "No room"
.LB660      EQUS    $00
            EQUB    $02
            EQUS    "No old text found",$00
.LB674      STZ     L002E
            STZ     L004B
            STZ     L004C
.LB67A      LDY     L002E
            LDA     (L0006),Y
            CMP     #$0D
            BEQ     LB6B2
            CMP     #$3A
            BCS     LB703
            SBC     #$2F
            BCC     LB703
            STA     L002C
            LDA     #$0A
            LDX     #$00
            LDY     #$00
            CLC
.LB693      PHA
            TXA
            ADC     L004B
            TAX
            TYA
            ADC     L004C
            TAY
            BCS     LB703
            PLA
            DEC     A
            BNE     LB693
            TXA
            ADC     L002C
            STA     L004B
            BCC     LB6AC
            INY
            BEQ     LB703
.LB6AC      STY     L004C
            INC     L002E
            BNE     LB67A
.LB6B2      RTS

; f0 - Goto line.

.exec_f0    LDA     #$01
            STA     L004B
            STZ     L004C
            LDA     L0022
            STA     L0000
            LDA     L0023
            STA     L0001
.LB6C1      LDA     (L0000)
            CMP     #$0D
            BNE     LB6CD
            INC     L004B
            BNE     LB6CD
            INC     L004C
.LB6CD      INC     L0000
            BNE     LB6D3
            INC     L0001
.LB6D3      LDA     L0000
            CMP     L0010
            LDA     L0001
            SBC     L0011
            BCC     LB6C1
            JSR     L9956
            EQUS    "At line ",$EA
.LB6E9      JSR     LBD7A
            JSR     write_istr
            EQUS    ", new line:",$EA
.LB6FB      JSR     wht_on_blk
            JSR     L83DF
            BNE     LB720
.LB703      BRK
            EQUB    $01
            EQUS    "Bad number"
.LB70F      EQUS    $00
            EQUB    $02
            EQUS    "Line not found",$00
.LB720      JSR     LB674
            SEC
            LDA     L004B
            SBC     #$01
            STA     L004B
            LDA     L004C
            SBC     #$00
            STA     L004C
            BCC     LB703
            JSR     ctl_up
            LDA     L0012
            STA     L000E
            LDA     L0013
            STA     L000F
.LB73D      LDA     L004B
            ORA     L004C
            BEQ     LB75A
.LB743      LDA     #$01
            JSR     L99E2
            BCS     LB70F
            LDA     L002C
            CMP     #$0D
            BNE     LB743
            LDA     L004B
            BNE     LB756
            DEC     L004C
.LB756      DEC     L004B
            BRA     LB73D
.LB75A      LDA     L0050
            BNE     LB760
            LDA     #$04
.LB760      STA     L0037
            JMP     L9AC3
.LB765      STZ     L0046
            STZ     L0060
            STZ     L0044
            STZ     L0047
            STZ     L0048
            STZ     L005D
.LB771      STZ     L0045
            BRA     LB778
.LB775      JSR     LB8AA
.LB778      LDY     L0045
            LDA     L0500,Y
            STA     L002C
            INC     L0045
            CMP     #$0D
            RTS
.LB784      JSR     LB765
.LB787      STZ     L004E
            STZ     L005F
            STZ     L005E
            LDA     L002C
            CMP     #$0D
            BEQ     LB7DF
            CMP     #$2F
            BEQ     LB7DD
            CMP     #$5E
            BNE     LB79F
            INC     L005E
            BRA     LB7A3
.LB79F      CMP     #$2A
            BNE     LB7AA
.LB7A3      INC     L004E
            LDX     #$80
            JSR     LB775
.LB7AA      CMP     #$7E
            BNE     LB7B3
            LDX     #$81
            JSR     LB775
.LB7B3      CMP     #$5B
            BNE     LB7EE
            INC     L005D
            LDX     #$86
            JSR     LB8AA
            JSR     LB8AA
            STY     L004A
            JSR     LB778
.LB7C6      JSR     LB8EE
            LDA     L002C
            CMP     #$5D
            BNE     LB7C6
            DEC     L005D
            LDA     L0046
            LDY     L004A
            STA     L0600,Y
            JSR     LB778
            BRA     LB7F1
.LB7DD      INC     L0060
.LB7DF      JSR     LB8A8
            JSR     LB778
            LDA     L0046
            STA     L003B
            LDA     L0060
            BNE     LB84A
            RTS
.LB7EE      JSR     LB8EE
.LB7F1      LDA     L005E
            BEQ     LB7FA
            LDX     #$8B
            JSR     LB8AA
.LB7FA      LDA     L005F
            BEQ     LB814
            LDX     L0044
            CPX     #$0A
            BCS     LB787
            INC     L0044
            LDA     L0048
            STA     L0728,X
            LDA     L004E
            BNE     LB819
            LDA     L0047
            STA     L071E,X
.LB814      INC     L0048
.LB816      JMP     LB787
.LB819      INC     L0047
            LDA     L0047
            CMP     #$05
            BCS     LB82A
            ORA     #$80
            STA     L071E,X
            STZ     L0048
            BRA     LB816
.LB82A      BRK
            EQUB    $01
            EQUS    "Too many find multiples",$00
.LB844      JSR     LB778
.LB847      JSR     LB8AA
.LB84A      LDA     #$FF
            STA     L005D
            LDA     L002C
            CMP     #$0D
            BEQ     LB8A8
            LDX     #$88
            CMP     #$26
            BEQ     LB844
            CMP     #$5C
            BNE     LB864
            JSR     LB778
            TAX
            BRA     LB844
.LB864      LDX     #$87
            CMP     #$25
            BNE     LB87C
            JSR     LB8AA
            JSR     LB778
            SEC
            SBC     #$30
            BCC     LB88D
            CMP     L0044
            BCS     LB88D
            TAX
            BPL     LB844
.LB87C      JSR     LB979
            STX     L0049
            TXA
            BPL     LB847
            LDX     #$89
            JSR     LB8AA
            LDX     L0049
            BRA     LB847
.LB88D      BRK
            EQUB    $01
            EQUS    "Bad replace field number",$00
.LB8A8      LDX     #$8C
.LB8AA      LDY     L0046
            LDA     L005D
            BNE     LB8CE
            CPX     #$41
            BCC     LB8CE
            CPX     #$7B
            BCS     LB8CE
            CPX     #$5B
            BCC     LB8C0
            CPX     #$61
            BCC     LB8CE
.LB8C0      TXA
            ORA     #$20
            TAX
            LDA     #$8A
            STA     L0600,Y
            INY
            INC     L0046
            BEQ     LB8DB
.LB8CE      TXA
            STA     L0600,Y
            BPL     LB8D6
            INC     L005F
.LB8D6      INC     L0046
            BEQ     LB8DB
            RTS
.LB8DB      BRK
            EQUB    $01
            EQUS    "Syntax incorrect",$00
.LB8EE      LDA     L002C
            CMP     #$7E
            BNE     LB90D
            LDX     #$81
            JSR     LB8AA
            JSR     LB778
            BNE     LB90D
.LB8FE      BRK
            EQUB    $01
            EQUS    "Error with ~",$00
.LB90D      CMP     #$5C
            BNE     LB931
            INC     L005D
            JSR     LB778
            BNE     LB927
.LB918      BRK
            EQUB    $01
            EQUS    "Error with \",$00
.LB927      TAX
            JSR     LB778
            JSR     LB8AA
            DEC     L005D
            RTS
.LB931      LDX     #$82
            CMP     #$2E
            BEQ     LB943
            LDX     #$83
            CMP     #$40
            BEQ     LB943
            LDX     #$84
            CMP     #$23
            BNE     LB949
.LB943      JSR     LB778
            JMP     LB8AA
.LB949      JSR     LB979
            STX     L0049
            LDA     L002C
            CMP     #$2D
            BNE     LB96C
            INC     L005D
            LDX     #$85
            JSR     LB8AA
            JSR     LB778
            LDX     L0049
            JSR     LB8AA
            JSR     LB979
            JSR     LB8AA
            DEC     L005D
            RTS
.LB96C      TXA
            BPL     LB976
            LDX     #$89
            JSR     LB8AA
            LDX     L0049
.LB976      JMP     LB8AA
.LB979      STZ     L002D
            LDA     L002C
            BMI     LB9B0
            CMP     #$7C
            BNE     LB991
            JSR     LB778
            BEQ     LB9BD
            CMP     #$21
            BNE     LB99E
            INC     L002D
            JSR     LB778
.LB991      CMP     #$24
            BEQ     LB9AE
            CMP     #$7C
            BNE     LB9B0
            JSR     LB778
            BEQ     LB9BD
.LB99E      CMP     #$3F
            BNE     LB9A6
            LDA     #$7F
            BRA     LB9B0
.LB9A6      BCC     LB9B0
            AND     #$DF
            SBC     #$40
            BRA     LB9B0
.LB9AE      LDA     #$0D
.LB9B0      PHA
            JSR     LB778
            PLA
            LDY     L002D
            BEQ     LB9BB
            ORA     #$80
.LB9BB      TAX
            RTS
.LB9BD      BRK
            EQUB    $01
            EQUS    "Error with |",$00
.LB9CC      LDY     #$00
            STZ     L003A
            LDA     L0014
            STA     L0016
            CMP     L0068
            LDA     L0015
            STA     L0017
            SBC     L0069
            BCC     LBA03
            LDA     L005C
            BNE     LB9FB
            JSR     LBBEC
            LDA     L0010
            STA     L0000
            LDA     L0011
            STA     L0001
            INC     L005C
            LDA     L0064
            STA     L0068
            LDA     L0065
            STA     L0069
            LDY     #$00
            BRA     LBA03
.LB9FB      SEC
            RTS
.LB9FD      INC     L0016
            BNE     LBA03
            INC     L0017
.LBA03      JSR     L843B
            LDA     L0600,Y
            CMP     #$8C
            BEQ     LBA22
            CMP     #$80
            BEQ     LBA7D
            JSR     LBAA0
            BEQ     LB9FD
.LBA16      LDX     L003A
            BNE     LBA3D
            INC     L0014
            BNE     LB9CC
            INC     L0015
            BRA     LB9CC
.LBA22      LDA     L0014
            STA     L0706
            LDA     L0015
            STA     L070C
            SEC
            LDA     L0016
            SBC     L0014
            STA     L0712
            LDA     L0017
            SBC     L0015
            STA     L0718
            CLC
            RTS
.LBA3D      STY     L005E
            CLC
            LDA     L0706,X
            ADC     L0712,X
            STA     L0016
            LDA     L070C,X
            ADC     L0718,X
            STA     L0017
            LDA     L0700,X
            TAY
            JSR     LBAA0
            BNE     LBA65
            LDX     L003A
            INC     L0712,X
            BNE     LB9FD
            INC     L0718,X
            BRA     LB9FD
.LBA65      LDX     L005E
            LDA     L05FF,X
            CMP     #$8B
            BNE     LBA79
            INY
            LDX     L003A
            LDA     L0712,X
            ORA     L0718,X
            BNE     LBA03
.LBA79      DEC     L003A
            BRA     LBA16
.LBA7D      INC     L003A
            LDX     L003A
            INY
            TYA
            STA     L0700,X
            LDA     L0016
            STA     L0706,X
            LDA     L0017
            STA     L070C,X
            STZ     L0712,X
            STZ     L0718,X
            JSR     LBAA0
            JMP     LBA03
.LBA9C      PLP
.LBA9D      LDA     #$01
            RTS
.LBAA0      LDA     L0016
            CMP     L0064
            BNE     LBAAC
            LDA     L0017
            CMP     L0065
            BEQ     LBA9D
.LBAAC      LDA     L0600,Y
            CMP     #$81
            PHP
            BNE     LBAB5
            INY
.LBAB5      INY
            LDA     L05FF,Y
            BMI     LBAC1
            CMP     (L0016)
            BNE     LBB38
            BRA     LBB3C
.LBAC1      CMP     #$82
            BEQ     LBB3C
            CMP     #$8A
            BEQ     LBAF9
            CMP     #$83
            BEQ     LBB05
            CMP     #$8B
            BEQ     LBA9C
            CMP     #$84
            BEQ     LBB1D
            CMP     #$85
            BEQ     LBAE7
            CMP     #$86
            BEQ     LBB29
            INY
            LDA     L05FF,Y
            CMP     (L0016)
            BNE     LBB38
            BEQ     LBB3C
.LBAE7      INY
            INY
            LDA     (L0016)
            CMP     L05FE,Y
            BCC     LBB38
            CMP     L05FF,Y
            BCC     LBB3C
            BNE     LBB38
            BRA     LBB3C
.LBAF9      INY
            LDA     (L0016)
            ORA     #$20
            CMP     L05FF,Y
            BNE     LBB38
            BRA     LBB3C
.LBB05      LDA     (L0016)
            CMP     #$5F
            BEQ     LBB3C
            CMP     #$41
            BCC     LBB1F
            CMP     #$7B
            BCS     LBB38
            CMP     #$5B
            BCC     LBB3C
            CMP     #$61
            BCC     LBB38
            BRA     LBB3C
.LBB1D      LDA     (L0016)
.LBB1F      CMP     #$30
            BCC     LBB38
            CMP     #$3A
            BCS     LBB38
            BRA     LBB3C
.LBB29      LDA     L0600,Y
            STA     L004A
            INY
.LBB2F      JSR     LBAA0
            BEQ     LBB3A
            CPY     L004A
            BNE     LBB2F
.LBB38      PLP
            RTS
.LBB3A      LDY     L004A
.LBB3C      PLA
            AND     #$02
            RTS
.LBB40      JSR     LBBEC
            LDA     L0016
            STA     L0012
            LDA     L0017
            STA     L0013
            LDA     L003B
            STA     L0038
.LBB4F      LDA     L0010
            CMP     L0014
            LDA     L0011
            SBC     L0015
            BCS     LBBAF
            LDY     L0038
            INC     L0038
            LDA     L0600,Y
            BPL     LBBA5
            CMP     #$8C
            BEQ     LBBE5
            CMP     #$87
            BEQ     LBB79
            CMP     #$88
            BEQ     LBB75
            INC     L0038
            LDA     L0601,Y
            BRA     LBBA5
.LBB75      LDY     #$00
            BRA     LBBBC
.LBB79      INC     L0038
            LDA     L0601,Y
            TAX
            LDA     L071E,X
            BMI     LBBB9
            TAY
            BEQ     LBB98
            CLC
            LDA     L0706,Y
            ADC     L0712,Y
            STA     L0006
            LDA     L070C,Y
            ADC     L0718,Y
            BNE     LBB9E
.LBB98      LDA     L0014
            STA     L0006
            LDA     L0015
.LBB9E      STA     L0007
            LDY     L0728,X
            LDA     (L0006),Y
.LBBA5      STA     (L0010)
            INC     L0010
            BNE     LBB4F
            INC     L0011
            BRA     LBB4F
.LBBAF      BRK
            EQUB    $02
            EQUS    "No room",$00
.LBBB9      AND     #$7F
            TAY
.LBBBC      LDA     L0706,Y
            STA     L000A
            LDA     L070C,Y
            STA     L000B
            LDA     L0010
            STA     L000C
            LDA     L0011
            STA     L000D
            CLC
            LDA     L0712,Y
            TAX
            ADC     L0010
            STA     L0010
            LDA     L0718,Y
            TAY
            ADC     L0011
            STA     L0011
            JSR     L847A
            JMP     LBB4F
.LBBE5      RTS
.LBBE6      JSR     L98D4
            ORA     #$20
            RTS
.LBBEC      LDX     L0014
            LDY     L0015
            JMP     L9AC7

; f5 - Global replace

.exec_f5    JSR     LBE54
            JSR     L9956
            EQUS    "Global replace:",$EA
.LBC09      JSR     L8415
            JSR     L8411
            BNE     LBC20
            CMP     L0464
            BEQ     LBC78
.LBC16      LDA     L0464,Y
            STA     (L0006),Y
            INY
            BPL     LBC16
            LDY     #$00
.LBC20      LDA     (L0006),Y
            STA     L0464,Y
            INY
            CPY     #$64
            BNE     LBC20
            JSR     LB784
            JSR     LBE65
            STZ     L004B
            STZ     L004C
            STZ     L005C
.LBC36      LDX     L0012
            LDY     L0013
.LBC3A      STX     L0014
            STY     L0015
            JSR     LB9CC
            BCS     LBC58
            INC     L004B
            BNE     LBC49
            INC     L004C
.LBC49      LDA     L0060
            BNE     LBC53
            LDX     L0016
            LDY     L0017
            BRA     LBC3A
.LBC53      JSR     LBB40
            BRA     LBC36
.LBC58      LDX     L0000
            LDY     L0001
            JSR     L9A68
            JSR     L999F
            JSR     LAFFD
            JSR     L9952
            EQUS    " ",$EA
.LBC6A      JSR     LBD7A
            JSR     L995E
            JSR     L6F66
            ADC     L006E,X
            STZ     L00EA
            RTS
.LBC78      BRK
            EQUB    $01
            EQUS    "No previous string",$00

; f4 - Find and replace.

.exec_f4    JSR     L9956
            EQUS    "Find and replace:",$EA
.LBCA2      JSR     L8415
            JSR     L8411
            BNE     LBCB9
            CMP     L0400
            BEQ     LBC78
.LBCAF      LDA     L0400,Y
            STA     (L0006),Y
            INY
            BPL     LBCAF
            LDY     #$00
.LBCB9      LDA     (L0006),Y
            STA     L0400,Y
            INY
            CPY     #$64
            BNE     LBCB9
            JSR     LB784
            JSR     LBFDE
            JSR     L9AF8
            LDA     L004B
            STA     L0036
            LDA     L0004
            STA     L0068
            LDA     L0005
            STA     L0069
            STA     L005C
.LBCDA      LDX     L0012
            LDY     L0013
.LBCDE      STX     L0014
            STY     L0015
            JSR     LB9CC
            BCS     LBD5E
            JSR     LBBEC
            JSR     LBED2
            LDA     L0051
            STA     L0037
            JSR     LAFFD
            LDA     #$05
            STA     L0034
            JSR     L9956
            EQUS    "R(eplace), C(ontinue) or ESCAPE",$EA
.LBD1B      JSR     text_curs
            JSR     L980F
.LBD21      JSR     LBBE6
            CMP     #$63
            BNE     LBD2E
            LDX     L0016
            LDY     L0017
            BRA     LBCDE
.LBD2E      CMP     #$72
            BNE     LBD21
            JSR     LBE22
            LDA     L0060
            BNE     LBD58
            JSR     L9956
            EQUS    "Replace by:",$EA
.LBD48      JSR     L8415
            JSR     L8411
            JSR     LB771
            LDA     L003B
            STA     L0046
            JSR     LB84A
.LBD58      JSR     LBB40
            JMP     LBCDA
.LBD5E      JSR     L999F
            LDA     #$06
            STA     L0034
            JSR     LAFFD
            JSR     L98E5
            JSR     L9952
            EQUS    " Not found",$EA
.LBD79      RTS
.LBD7A      JSR     blk_on_wht
            LDX     #$04
            STX     L0000
.LBD81      STZ     L0001
.LBD83      SEC
            LDA     L004B
            SBC     LBDAC,X
            TAY
            LDA     L004C
            SBC     LBDB1,X
            BCC     LBD99
            STY     L004B
            STA     L004C
            INC     L0001
            BRA     LBD83
.LBD99      LDA     L0001
            BNE     LBDA1
            DEC     L0000
            BPL     LBDA8
.LBDA1      ORA     #$30
            JSR     OSWRCH
            STZ     L0000
.LBDA8      DEX
            BPL     LBD81
            RTS
.LBDAC      EQUB    $01,$0A,$64,$E8,$10
.LBDB1      EQUB    $00,$00,$00,$03,$27
.LBDB6      JSR     LBDDF
.LBDB9      STZ     L003F
            LDX     mark_count
.LBDBD      DEX
            BMI     LBDDE
            LDY     L0018,X
            STY     L001C,X
            CPY     L0012
            LDA     L001A,X
            STA     L001E,X
            SBC     L0013
            BCS     LBDBD
            INC     L003F
            SEC
            TYA
            SBC     L003C
            STA     L001C,X
            LDA     L001E,X
            SBC     L003D
            STA     L001E,X
            BCS     LBDBD
.LBDDE      RTS
.LBDDF      SEC
            LDA     L0012
            SBC     L0010
            STA     L003C
            LDA     L0013
            SBC     L0011
            STA     L003D
            RTS
.LBDED      JSR     L9AF8
            JSR     LBDDF
            JSR     LBDB9
            LDX     mark_count
            CPX     #$02
            BNE     LBE16
            LDA     L001D
            CMP     L001C
            LDA     L001F
            SBC     L001E
            BCS     LBE16
            LDA     L001C
            LDY     L001D
            STA     L001D
            STY     L001C
            LDA     L001E
            LDY     L001F
            STA     L001F
            STY     L001E
.LBE16      LDA     mark_count
            STA     L003E
            STZ     mark_count
            JSR     L98E5
            LDA     L003E
.LBE21      RTS
.LBE22      LDA     mark_count
            BEQ     LBE21
.LBE26      BRK
            EQUB    $01
            EQUS    "Mark(s) set",$00
.LBE34      LDA     L0012
            STA     L0068
            LDA     L0013
            STA     L0069
            LDA     L003E
            BEQ     LBE53
            CMP     #$01
            BNE     LBE99
            LDX     L001C
            LDY     L001E
            DEC     L003F
            BNE     LBE53
            JSR     L9A68
            LDX     L0068
            LDY     L0069
.LBE53      RTS
.LBE54      JSR     LBFDE
            JSR     LBDED
            CMP     #$02
            BEQ     LBE99
            PHA
            LDA     L004B
            STA     L0036
            PLA
            RTS
.LBE65      JSR     LBE34
            BNE     LBE71
            JSR     ctl_up
            LDX     L0004
            LDY     L0005
.LBE71      STX     L0064
            STY     L0065
            RTS
.LBE76      JSR     LBDED
            CMP     #$02
            BNE     LBE99
            LDA     L001D
            CMP     L0012
            BNE     LBE93
            LDA     L001F
            CMP     L0013
            BNE     LBE93
            LDA     L0010
            STA     L001D
            LDA     L0011
            STA     L001F
            INC     L003F
.LBE93      LDA     L003F
            DEC     A
            BEQ     LBE99
            RTS

.LBE99      BRK
            EQUB    $01
            EQUS    "Bad marking",$00
            
; f6 - Mark place.

.exec_f6    JSR     L9AF8
            LDX     mark_count
            CPX     #$02
            BEQ     LBE99
            LDA     L0012
            STA     L0018,X
            LDA     L0013
            STA     L001A,X
            JSR     L999F
            INC     mark_count
            JMP     L98E5

; shift-f6 - Clear marks.

.exec_sf6   JSR     LBDED
            JMP     L999F
            
; shift-f8 - Marked delete.

.exec_sf8   JSR     LBDED
            JSR     LBE34
            BEQ     LBE99
            STX     L0012
            STY     L0013
.LBED2      JSR     L999F
            LDA     L0000
            STA     L0036
            RTS

; f7 - Marked copy.

.exec_f7    JSR     LBE76
            SEC
            LDA     L001D
            SBC     L001C
            TAX
            LDA     L001F
            SBC     L001E
            TAY
            LDA     L003F
            BEQ     LBF09
            STX     L0000
            STY     L0001
            SEC
            LDA     L0018
            SBC     L0000
            STA     L0018
            LDA     L001A
            SBC     L0001
            STA     L001A
            LDA     L0019
            SBC     L0000
            STA     L0019
            LDA     L001B
            SBC     L0001
            STA     L001B
.LBF09      JSR     L97F2
            LDA     L001C
            STA     L000A
            LDA     L001E
            STA     L000B
            STX     L0012
            STX     L000C
            STY     L0013
            STY     L000D
            JSR     L9A93
            LDX     #$02
            STX     mark_count
            JSR     L98E5
            JMP     L999F

; shift-f7 - Marked move.

.exec_sf7   JSR     LBE76
            LDX     L001C
            LDY     L001E
            LDA     L003F
            BEQ     LBF46
            STX     L000A
            STY     L000B
            LDA     L001D
            STA     L000C
            LDA     L001F
            STA     L000D
            LDX     L0010
            LDY     L0011
            BRA     LBF56
.LBF46      STX     L000C
            STY     L000D
            LDA     L0012
            STA     L000A
            LDA     L0013
            STA     L000B
            LDX     L001D
            LDY     L001F
.LBF56      STX     L0064
            STY     L0065
.LBF5A      SEC
            LDA     L000C
            SBC     L000A
            STA     L0025
            LDA     L000D
            SBC     L000B
            STA     L0026
            LDA     L0064
            SBC     L000C
            TAX
            LDA     L0065
            SBC     L000D
            TAY
            CPX     L0025
            SBC     L0026
            BCS     LBF7B
            STX     L0025
            STY     L0026
.LBF7B      LDA     L0025
            ORA     L0026
            BEQ     LBFAC
            BCS     LBF98
            LDX     L000C
            LDY     L000D
            JSR     LBFB3
            CLC
            TYA
            ADC     L0006
            STA     L000A
            LDA     #$00
            ADC     L0007
            STA     L000B
            BCC     LBF5A
.LBF98      SEC
            LDA     L0064
            SBC     L0025
            STA     L0064
            TAX
            LDA     L0065
            SBC     L0026
            STA     L0065
            TAY
            JSR     LBFB3
            BRA     LBF5A
.LBFAC      LDA     #$05
            STA     L0034
            JMP     L999F
.LBFB3      LDA     L000A
            STA     L0006
            LDA     L000B
            STA     L0007
            STX     L0008
            STY     L0009
            INC     L0026
            LDY     #$00
.LBFC3      CPY     L0025
            BNE     LBFCB
            DEC     L0026
            BEQ     LBFEA
.LBFCB      LDA     (L0006),Y
            TAX
            LDA     (L0008),Y
            STA     (L0006),Y
            TXA
            STA     (L0008),Y
            INY
            BNE     LBFC3
            INC     L0007
            INC     L0009
            BRA     LBFC3
.LBFDE      LDA     L0036
            STA     L004B
            LDA     L0040
            CMP     L0036
            BCS     LBFEA
            STA     L0036
.LBFEA      RTS
            EQUS    "Roger Wilson",$00
            EQUB    $00,$00,$00,$00,$00,$00,$00,$00
.end
save "edit110.bin",langent,end

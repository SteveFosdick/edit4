; Disassembly of EDIT 4 (110) from the BBC MOS 3.20 ROM
; Copyright Acorn 1984.

            cpu     1

; Zero page workspace.

L0000       =       $0000
L0001       =       $0001
L0002       =       $0002
L0003       =       $0003
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
L0020       =       $0020
L0021       =       $0021
L0022       =       $0022
L0023       =       $0023
L0024       =       $0024
L0025       =       $0025
L0026       =       $0026
L0027       =       $0027
L0028       =       $0028
L0029       =       $0029
L002A       =       $002A
L002B       =       $002B
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
L004F       =       $004F
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

; References to OS RAM.

L0202       =       $0202
L0203       =       $0203
L020E       =       $020E

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
.langent    JMP     L8134
.servent    JMP     L80E8
            EQUB    $C2
            EQUB    $12
            EQUB    $01
            EQUS    "Edit",$00
            EQUS    "1.00",$00
            EQUS    "(C)1984 Acorn",$00
.brkhand    LDX     #$FF
            TXS
            STZ     L0039
            LDA     #$7E
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
            JSR     LB341
.L8061      JSR     L84F6
            EQUS    $03,$0F,$EA
.L8067      JSR     L998D
            JSR     L80D6
            JSR     L9815
            LDA     L002B
            AND     #$07
            CMP     #$05
            BEQ     L80A2
            LDA     (L00FD)
            CMP     #$01
            BNE     L80A2
            JSR     L84F6
            EQUS    "For help type: shf-f5 D RETURN",$0A,$0D,$EA
.L80A2      JSR     L9968
            EQUS    "Press ESCAPE to continue",$EA
.L80BE      JSR     OSRDCH
            CMP     #$1B
            BNE     L80BE
.L80C5      LDA     #$7E
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
.L80E8      CMP     #$04
            BEQ     srvcmd
            CMP     #$09
            BNE     srvnhlp
            LDA     (L00F2),Y
            CMP     #$0D
            BNE     L8103
            PHY
            LDY     #$07
.L80F9      LDA     L8106,Y
            JSR     OSASCI
            DEY
            BPL     L80F9
            PLY
.L8103      LDA     #$09
.srvnhlp    RTS
.L8106      ORA     L2034
.L8109      EQUS    "TIDE",$0D
.srvcmd     PHY
            PHX
            LDX     #$03
.L8112      LDA     (L00F2),Y
            CMP     #$2E
            BEQ     L812E
            AND     #$DF
            CMP     L8109,X
            BNE     L8129
            INY
            DEX
            BPL     L8112
            LDA     (L00F2),Y
            CMP     #$21
            BCC     L812E
.L8129      PLX
            PLY
            LDA     #$04
            RTS
.L812E      LDA     #$8E
            PLX
            JMP     OSBYTE
.L8134      CLI
            CLD
            LDX     #$FF
            TXS
            LDA     #$03
            JSR     OSWRCH
            LDA     #$21
            STA     L0202
            LDA     #$80
            STA     L0203
            STZ     L04FF
            LDA     #$F2
            STA     L0052
            STZ     L0053
            LDA     #$FF
            STA     L0054
            STA     L0055
            JSR     L827F
            PHA
            JSR     L827C
            STA     L0053
            PLA
            STA     L0052
            LDX     #$14
.L8165      DEX
            BEQ     L81E6
            JSR     L827F
            JSR     L8246
            CMP     #$0D
            BEQ     L81E6
            CMP     #$20
            BNE     L8165
            LDX     #$00
.L8178      JSR     L827F
            JSR     L8246
            STA     L01A0,X
            INX
            CPX     #$40
            BNE     L8178
            LDA     #$0D
            STA     L019F,X
            STA     L04C8
            LDY     #$00
            JSR     L824D
            BCC     L81BB
            CMP     #$2C
            BNE     L81BB
            LDA     L0000,X
            STA     L04FC
            LDA     L0001,X
            STA     L04FD
            INY
            JSR     L824D
            BCC     L81BB
            CMP     #$0D
            BNE     L81BB
            LDA     L0000,X
            STA     L04FE
            LDA     L0001,X
            STA     L04FF
            STZ     L0039
            BRA     L81FA
.L81BB      LDX     #$FF
.L81BD      INX
            LDA     L01A0,X
            CMP     #$20
            BEQ     L81BD
            CMP     #$0D
            BEQ     L81E6
.L81C9      LDA     L01A0,X
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
            LDA     #$01
            STA     L0039
            BRA     L81FA
.L81E6      LDX     #$FF
            STX     L0039
            LDA     #$0D
            STA     L04C8
            CMP     (L0002)
            BNE     L81FA
            CMP     (L0004)
            BNE     L81FA
            JSR     L84B6
.L81FA      LDA     #$A1
            LDX     #$08
            LDY     #$10
            JSR     OSBYTE
            STY     L002B
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
            JMP     LB608
.L8229      STZ     L0024
            JSR     LB363
            JSR     LB325
            LDY     #$00
            LDA     #$C8
            STA     L0006
            LDA     #$04
            STA     L0007
            JSR     L832C
            JMP     L8531
.L8241      LDX     #$52
            LDY     #$00
            RTS
.L8246      INC     L0052
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
.L827C      JSR     L8246
.L827F      PHX
            PHY
            JSR     L8241
            LDA     #$05
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
.L8311      JSR     LB203
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
.L8329      JMP     LB1EF
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
.L834A      LDY     #$00
            TYA
            JSR     OSARGS
            CMP     #$04
            BCC     L8370
            LDA     #$05
            JSR     L8241
            JSR     OSFILE
            CMP     #$01
            BNE     L8370
            LDA     L005E
            ORA     L005F
            BNE     L8395
            LDA     L0027
            CMP     L005C
            LDA     L0028
            SBC     L005D
            BCC     L8395
.L8370      LDA     L0008
            STA     L0054
            LDA     L0009
            STA     L0055
            STZ     L0056
            STZ     L0057
            STZ     L0058
            LDA     #$FF
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
            LDX     #$0F
.L83BA      STZ     L0054,X
            DEX
            BPL     L83BA
            DEC     L0058
            DEC     L0059
            DEC     L005A
            DEC     L005B
            LDA     L0012
            STA     L005C
            LDA     L0013
            STA     L005D
            LDA     L0064
            STA     L0060
            LDA     L0065
            STA     L0061
            LDA     #$00
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
.L8415      LDA     #$20
            JSR     OSWRCH
            LDA     #$06
            STA     L0034
            JSR     L8440
            BCC     L8410
.L8423      JSR     L84F6
            EQUS    $03,$0F,$0D,$EA
.L842A      LDA     L0024
            CMP     #$02
            BNE     L8436
            JSR     LADD3
            JSR     LB341
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
.L84EF      CMP     L0021
            BCS     L84ED
            CMP     L0003
            RTS
.L84F6      PLA
            STA     L0000
            PLA
            STA     L0001
            JSR     L8505
            JMP     (L0000)
.L8502      JSR     OSWRCH
.L8505      INC     L0000
            BNE     L850B
            INC     L0001
.L850B      LDA     (L0000)
            CMP     #$EA
            BNE     L8502
            RTS
.L8512      LDA     #$20
            EOR     L002B
.L8516      STA     L002B
            PHX
            PHY
            TAY
            LDA     #$A2
            LDX     #$08
            JSR     OSBYTE
            PLY
            PLX
            RTS
.L8525      LDA     #$10
            BIT     L002B
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
.L8540      JSR     LAFFD
            JSR     L9987
            JSR     L980F
            LDA     #$05
            STA     L0034
            JSR     L98D4
            TAX
            BPL     L85C1
            CMP     #$B0
            BCS     L85C1
            LDX     L0039
            BNE     L85C1
            TAX
            LDA     L002B
            AND     #$07
            CMP     #$05
            BNE     L85B5
            CPX     #$9C
            BCS     L85B5
            CPX     #$90
            BCS     L8570
            CPX     #$8A
            BCS     L85B5
.L8570      TXA
            PHA
            ASL     A
            TAY
            JSR     L84F6
            EQUS    $1A,$1E,$1F,$00,$08,$EA
.L857D      LDA     L874F,Y
            STA     L0000
            LDA     L8750,Y
            STA     L0001
.L8587      LDY     #$00
            JSR     OSNEWL
.L858C      LDA     (L0000)
            INC     L0000
            BNE     L8594
            INC     L0001
.L8594      CMP     #$0D
            BEQ     L85A2
            CMP     #$EA
            BEQ     L85AE
            JSR     OSWRCH
            INY
            BRA     L858C
.L85A2      LDA     #$20
.L85A4      CPY     #$36
            BCS     L8587
            JSR     OSWRCH
            INY
            BRA     L85A4
.L85AE      JSR     L98A6
            JSR     L9987
            PLX
.L85B5      TXA
            ASL     A
            TAX
            JSR     L85BE
            JMP     L8540
.L85BE      JMP     (L86EF,X)
.L85C1      JSR     L85C7
            JMP     L8540
.L85C7      CMP     #$7F
            BEQ     L8631
            STZ     L04FF
            CMP     #$0D
            BNE     L85E3
            JSR     L8525
            BNE     L85E1
            JSR     L97D4
            BCS     L85E1
            STZ     L0036
            JMP     LB266
.L85E1      LDA     #$0D
.L85E3      PHA
            JSR     L9B08
            JSR     L8525
            BNE     L85F4
            LDY     L0036
            LDA     (L0012),Y
            CMP     #$0D
            BNE     L85FB
.L85F4      LDX     #$01
            LDA     L0036
            JSR     L9B36
.L85FB      PLA
            LDY     L0036
            STA     (L0012),Y
            CMP     #$0D
            BNE     L861F
            JSR     LB1D0
            LDA     L0036
            LDY     L0037
            JSR     LB0BC
            STZ     L0036
            JSR     LB266
.L8613      LDA     L0034
            BEQ     L861A
            JSR     LAFFD
.L861A      LDA     #$02
            STA     L0034
.L861E      RTS
.L861F      JSR     LB1C1
            JSR     LB253
.L8625      LDA     L0034
            BEQ     L862C
            JSR     LAFFD
.L862C      LDA     #$01
            STA     L0034
            RTS
.L8631      JSR     L9B2C
            BEQ     L8639
            JMP     LB20C
.L8639      LDA     L0036
            BNE     L8642
            JSR     L97CB
            BCS     L861E
.L8642      JSR     LB20C
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
.L867A      JSR     L8692
.L867D      STZ     L0036
            LDA     (L0012)
            CMP     #$0D
            BNE     L867A
            JSR     L97E3
            STA     L0040
            JSR     L8692
            LDA     #$02
            STA     L0034
            RTS
.L8692      JSR     L97D4
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
            LDX     L004F
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
.L86EF      EQUW    LB6B3
            EQUW    LB4E7
            EQUW    LB406
            EQUW    LB42B
            EQUW    LBC8D
            EQUW    LBBF3
            EQUW    LBEA7
            EQUW    LBEDA
            EQUW    LA45F
            EQUW    LB608
            EQUW    L9BBE
            EQUW    L8692
            EQUW    LB20C
            EQUW    LB253
            EQUW    LB266
            EQUW    LB21D
            EQUW    L8512
            EQUW    LB359
            EQUW    LB4B1
            EQUW    LB3BB
            EQUW    L9C01
            EQUW    LB59C
            EQUW    LBEC0
            EQUW    LBF29
            EQUW    LBEC6
            EQUW    LB3C4
            EQUW    L9B83
            EQUW    LB569
            EQUW    LB2EC
            EQUW    LB2B5
            EQUW    L9ABD
            EQUW    L9A5E
            EQUW    L8540
            EQUW    L8540
            EQUW    L8540
            EQUW    L8540
            EQUW    L8540
            EQUW    L8540
            EQUW    LB3AF
            EQUW    LB3B5
            EQUW    L8540
            EQUW    L8540
            EQUW    L8540
            EQUW    L867D
            EQUW    LB248
            EQUW    LB24C
            EQUW    LB34B
            EQUW    LB341
.L874F      EQUB    $E9
.L8750      EQUB    $8B,$E2,$8C,$1F,$8E,$55,$8F,$94
            EQUB    $90,$C9,$91,$28,$93,$D7,$93,$B3
            EQUB    $94,$76,$95,$76,$95,$76,$95,$76
            EQUB    $95,$76,$95,$76,$95,$76,$95,$5B
            EQUB    $8C,$7B,$8D,$BA,$8E,$F0,$8F,$63
            EQUB    $91,$A3,$92,$B0,$93,$43,$94,$17
            EQUB    $95,$E0,$95,$50,$96,$F1,$96,$B0
            EQUB    $73,$68,$66,$2D,$66,$30,$A6,$A7
            EQUB    $73,$68,$66,$2D,$66,$31,$A6,$A7
            EQUB    $73,$68,$66,$2D,$66,$32,$A6,$A7
            EQUB    $73,$68,$66,$2D,$66,$33,$A6,$A7
            EQUB    $73,$68,$66,$2D,$66,$34,$A6,$A7
            EQUB    $73,$68,$66,$2D,$66,$35,$A6,$A7
            EQUB    $73,$68,$66,$2D,$66,$36,$A6,$A7
            EQUB    $73,$68,$66,$2D,$66,$37,$A6,$A7
            EQUB    $73,$68,$66,$2D,$66,$38,$A6,$A7
            EQUB    $73,$68,$66,$2D,$66,$39,$B1,$A9
            EQUB    $44,$69,$73,$70,$6C,$61,$79,$A9
            EQUB    $49,$6E,$73,$65,$72,$74,$2F,$A9
            EQUB    $49,$6E,$73,$65,$72,$74,$20,$A9
            EQUB    $52,$65,$6D,$6F,$76,$65,$20,$A9
            EQUB    $52,$65,$74,$75,$72,$6E,$20,$A9
            EQUB    $20,$53,$65,$74,$20,$20,$20,$A9
            EQUB    $20,$43,$6C,$65,$61,$72,$20,$A9
            EQUB    $4D,$61,$72,$6B,$65,$64,$20,$A9
            EQUB    $4D,$61,$72,$6B,$65,$64,$20,$A9
            EQUB    $43,$6C,$65,$61,$72,$20,$A9,$A9
            EQUB    $52,$65,$74,$75,$72,$6E,$73,$A9
            EQUB    $4F,$76,$65,$72,$20,$20,$20,$A9
            EQUB    $20,$66,$69,$6C,$65,$20,$20,$A9
            EQUB    $4D,$61,$72,$67,$69,$6E,$73,$A9
            EQUB    $4C,$61,$6E,$67,$75,$61,$67,$A9
            EQUB    $20,$4D,$6F,$64,$65,$20,$20,$A9
            EQUB    $20,$4D,$61,$72,$6B,$73,$20,$A9
            EQUB    $4D,$6F,$76,$65,$20,$20,$20,$A9
            EQUB    $44,$65,$6C,$65,$74,$65,$20,$A9
            EQUB    $74,$65,$78,$74,$20,$20,$A9,$AB
            EQUB    $A6,$A6,$66,$30,$A6,$A6,$A6,$AF
            EQUB    $A6,$A6,$66,$31,$A6,$A6,$A6,$AF
            EQUB    $A6,$A6,$66,$32,$A6,$A6,$A6,$AF
            EQUB    $A6,$A6,$66,$33,$A6,$A6,$A6,$AF
            EQUB    $A6,$A6,$66,$34,$A6,$A6,$A6,$AF
            EQUB    $A6,$A6,$66,$35,$A6,$A6,$A6,$AF
            EQUB    $A6,$A6,$66,$36,$A6,$A6,$A6,$AF
            EQUB    $A6,$A6,$66,$37,$A6,$A6,$A6,$AF
            EQUB    $A6,$A6,$66,$38,$A6,$A6,$A6,$AF
            EQUB    $A6,$A6,$66,$39,$A6,$A6,$AD,$A9
            EQUB    $20,$47,$6F,$74,$6F,$20,$20,$A9
            EQUB    $43,$6F,$6D,$6D,$61,$6E,$64,$A9
            EQUB    $20,$4C,$6F,$61,$64,$20,$20,$A9
            EQUB    $20,$53,$61,$76,$65,$20,$20,$A9
            EQUB    $46,$69,$6E,$64,$20,$20,$20,$A9
            EQUB    $47,$6C,$6F,$62,$61,$6C,$20,$A9
            EQUB    $20,$4D,$61,$72,$6B,$20,$20,$A9
            EQUB    $4D,$61,$72,$6B,$65,$64,$20,$A9
            EQUB    $20,$50,$72,$69,$6E,$74,$20,$A9
            EQUB    $20,$4F,$6C,$64,$20,$20,$A9,$A9
            EQUB    $20,$6C,$69,$6E,$65,$20,$20,$A9
            EQUB    $6C,$69,$6E,$65,$20,$20,$20,$A9
            EQUB    $20,$66,$69,$6C,$65,$20,$20,$A9
            EQUB    $20,$66,$69,$6C,$65,$20,$20,$A9
            EQUB    $53,$74,$72,$69,$6E,$67,$20,$A9
            EQUB    $52,$65,$70,$6C,$61,$63,$65,$A9
            EQUB    $20,$50,$6C,$61,$63,$65,$20,$A9
            EQUB    $43,$6F,$70,$79,$20,$20,$20,$A9
            EQUB    $20,$74,$65,$78,$74,$20,$20,$A9
            EQUB    $20,$74,$65,$78,$74,$20,$A9,$B2
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$A6,$AE
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$A6,$AE
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$A6,$AE
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$A6,$AE
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$A6,$AE
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$A6,$AE
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$A6,$AE
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$A6,$AE
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$A6,$AE
            EQUB    $A6,$A6,$A6,$A6,$A6,$A6,$B3,$EA
            EQUB    $54,$68,$65,$20,$41,$63,$6F,$72
            EQUB    $6E,$20,$53,$63,$72,$65,$65,$6E
            EQUB    $20,$45,$64,$69,$74,$6F,$72,$20
            EQUB    $87,$20,$31,$39,$38,$34,$20,$41
            EQUB    $63,$6F,$72,$6E,$20,$43,$6F,$6D
            EQUB    $70,$75,$74,$65,$72,$73,$20,$56
            EQUB    $65,$72,$20,$31,$2E,$31,$30,$20
            EQUB    $B0,$A6,$A6,$A6,$B1,$53,$68,$69
            EQUB    $66,$74,$3A,$20,$73,$63,$72,$65
            EQUB    $65,$6E,$20,$75,$70,$20,$20,$20
            EQUB    $20,$20,$20,$20,$20,$20,$20,$20
            EQUB    $20,$20,$20,$20,$20,$20,$20,$20
            EQUB    $20,$20,$20,$20,$20,$20,$20,$20
            EQUB    $20,$20,$20,$20,$20,$20,$20,$44
            EQUB    $65,$73,$63,$72,$69,$70,$74,$69
            EQUB    $76,$65,$20,$4D,$6F,$64,$65,$20
            EQUB    $20,$20,$20,$20,$20,$20,$20,$20
            EQUB    $A9,$20,$8B,$20,$A9,$43,$6F,$6E
            EQUB    $74,$72,$6F,$6C,$3A,$20,$74,$65
            EQUB    $78,$74,$20,$73,$74,$61,$72,$74
            EQUB    $54,$41,$42,$20,$70,$65,$72,$66
            EQUB    $6F,$72,$6D,$73,$20,$74,$61,$62
            EQUB    $75,$6C,$61,$74,$69,$6F,$6E,$20
            EQUB    $63,$6F,$6E,$74,$72,$6F,$6C,$6C
            EQUB    $65,$64,$20,$62,$79,$20,$73,$68
            EQUB    $69,$66,$74,$20,$54,$41,$42,$2E
            EQUB    $20,$20,$20,$20,$20,$20,$B0,$A6
            EQUB    $AE,$A6,$A7,$A6,$AE,$A6,$B1,$53
            EQUB    $68,$69,$66,$74,$3A,$20,$77,$6F
            EQUB    $72,$64,$20,$6C,$2F,$72,$20,$20
            EQUB    $43,$4F,$50,$59,$20,$64,$65,$6C
            EQUB    $65,$74,$65,$73,$20,$74,$68,$65
            EQUB    $20,$63,$68,$61,$72,$61,$63,$74
            EQUB    $65,$72,$20,$61,$62,$6F,$76,$65
            EQUB    $20,$74,$68,$65,$20,$63,$75,$72
            EQUB    $73,$6F,$72,$2E,$20,$20,$20,$20
            EQUB    $20,$20,$20,$20,$20,$20,$A9,$20
            EQUB    $88,$A4,$A9,$A2,$89,$20,$A9,$43
            EQUB    $6F,$6E,$74,$72,$6F,$6C,$3A,$20
            EQUB    $20,$20,$20,$20,$20,$20,$20,$20
            EQUB    $73,$68,$69,$66,$74,$20,$43,$4F
            EQUB    $50,$59,$20,$70,$72,$6F,$76,$69
            EQUB    $64,$65,$73,$20,$6E,$6F,$72,$6D
            EQUB    $61,$6C,$20,$73,$6F,$66,$74,$20
            EQUB    $6B,$65,$79,$73,$20,$61,$6E,$64
            EQUB    $20,$63,$75,$72,$73,$6F,$72,$20
            EQUB    $20,$20,$20,$20,$20,$20,$B2,$A6
            EQUB    $A7,$A6,$AE,$A6,$A7,$A6,$B3,$20
            EQUB    $20,$20,$20,$6C,$2F,$72,$20,$6F
            EQUB    $66,$20,$6C,$69,$6E,$65,$20,$20
            EQUB    $20,$20,$20,$20,$20,$20,$20,$63
            EQUB    $6F,$70,$79,$69,$6E,$67,$20,$28
            EQUB    $45,$53,$43,$41,$50,$45,$20,$74
            EQUB    $6F,$20,$6C,$65,$61,$76,$65,$20
            EQUB    $74,$68,$69,$73,$20,$6D,$6F,$64
            EQUB    $65,$29,$2E,$20,$20,$20,$20,$20
            EQUB    $20,$20,$20,$20,$20,$20,$20,$20
            EQUB    $A9,$20,$8A,$20,$A9,$53,$68,$69
            EQUB    $66,$74,$3A,$20,$73,$63,$72,$65
            EQUB    $65,$6E,$20,$64,$6F,$77,$6E,$20
            EQUB    $63,$6F,$6E,$74,$72,$6F,$6C,$20
            EQUB    $43,$4F,$50,$59,$20,$64,$65,$6C
            EQUB    $65,$74,$65,$73,$20,$74,$68,$65
            EQUB    $20,$63,$75,$72,$72,$65,$6E,$74
            EQUB    $20,$6C,$69,$6E,$65,$20,$28,$74
            EQUB    $6F,$20,$6E,$65,$78,$74,$20,$52
            EQUB    $45,$54,$55,$52,$4E,$29,$20,$20
            EQUB    $B2,$A6,$A6,$A6,$B3,$43,$6F,$6E
            EQUB    $74,$72,$6F,$6C,$3A,$20,$74,$65
            EQUB    $78,$74,$20,$65,$6E,$64,$20,$20
            EQUB    $EA,$66,$30,$0D,$54,$68,$65,$20
            EQUB    $63,$75,$72,$73,$6F,$72,$20,$63
            EQUB    $61,$6E,$20,$62,$65,$20,$6D,$6F
            EQUB    $76,$65,$64,$20,$74,$6F,$20,$61
            EQUB    $20,$6E,$65,$77,$20,$6C,$69,$6E
            EQUB    $65,$2E,$0D,$46,$6F,$72,$20,$74
            EQUB    $68,$69,$73,$20,$6F,$70,$65,$72
            EQUB    $61,$74,$69,$6F,$6E,$20,$6C,$69
            EQUB    $6E,$65,$73,$20,$61,$72,$65,$20
            EQUB    $63,$68,$61,$72,$61,$63,$74,$65
            EQUB    $72,$20,$73,$65,$71,$75,$65,$6E
            EQUB    $63,$65,$73,$0D,$65,$6E,$64,$65
            EQUB    $64,$20,$62,$79,$20,$52,$45,$54
            EQUB    $55,$52,$4E,$20,$28,$7C,$4D,$29
            EQUB    $2E,$0D,$EA,$73,$68,$66,$2D,$66
            EQUB    $30,$0D,$54,$68,$65,$20,$65,$6E
            EQUB    $64,$73,$20,$6F,$66,$20,$6C,$69
            EQUB    $6E,$65,$73,$20,$63,$61,$6E,$20
            EQUB    $62,$65,$20,$73,$68,$6F,$77,$6E
            EQUB    $20,$61,$73,$20,$61,$20,$73,$70
            EQUB    $65,$63,$69,$61,$6C,$0D,$63,$68
            EQUB    $61,$72,$61,$63,$74,$65,$72,$20
            EQUB    $73,$6F,$20,$74,$68,$61,$74,$20
            EQUB    $74,$68,$65,$79,$20,$63,$61,$6E
            EQUB    $20,$62,$65,$20,$73,$65,$65,$6E
            EQUB    $20,$63,$6C,$65,$61,$72,$6C,$79
            EQUB    $2E,$0D,$54,$68,$69,$73,$20,$61
            EQUB    $6C,$74,$65,$72,$73,$20,$77,$69
            EQUB    $74,$68,$20,$65,$61,$63,$68,$20
            EQUB    $70,$72,$65,$73,$73,$20,$6F,$66
            EQUB    $20,$73,$68,$66,$2D,$66,$30,$2E
            EQUB    $0D,$EA,$66,$31,$0D,$43,$6F,$6D
            EQUB    $6D,$61,$6E,$64,$73,$20,$74,$6F
            EQUB    $20,$74,$68,$65,$20,$63,$6F,$6D
            EQUB    $70,$75,$74,$65,$72,$27,$73,$20
            EQUB    $6F,$70,$65,$72,$61,$74,$69,$6E
            EQUB    $67,$20,$73,$79,$73,$74,$65,$6D
            EQUB    $20,$63,$61,$6E,$20,$62,$65,$0D
            EQUB    $67,$69,$76,$65,$6E,$2E,$20,$54
            EQUB    $68,$65,$20,$72,$65,$73,$75,$6C
            EQUB    $74,$20,$69,$73,$20,$73,$65,$65
            EQUB    $6E,$20,$61,$74,$20,$6F,$6E,$63
            EQUB    $65,$2E,$20,$45,$78,$74,$72,$61
            EQUB    $20,$63,$6F,$6D,$6D,$61,$6E,$64
            EQUB    $73,$0D,$63,$61,$6E,$20,$62,$65
            EQUB    $20,$65,$6E,$74,$65,$72,$65,$64
            EQUB    $20,$75,$6E,$74,$69,$6C,$20,$52
            EQUB    $45,$54,$55,$52,$4E,$20,$62,$79
            EQUB    $20,$69,$74,$73,$65,$6C,$66,$20
            EQUB    $69,$73,$20,$74,$79,$70,$65,$64
            EQUB    $2E,$0D,$EA,$73,$68,$66,$2D,$66
            EQUB    $31,$0D,$43,$68,$61,$6E,$67,$65
            EQUB    $73,$20,$62,$65,$74,$77,$65,$65
            EQUB    $6E,$20,$49,$6E,$73,$65,$72,$74
            EQUB    $20,$61,$6E,$64,$20,$4F,$76,$65
            EQUB    $72,$2E,$20,$49,$6E,$20,$49,$6E
            EQUB    $73,$65,$72,$74,$20,$6D,$6F,$64
            EQUB    $65,$20,$74,$68,$65,$0D,$74,$65
            EQUB    $78,$74,$20,$74,$79,$70,$65,$64
            EQUB    $20,$69,$73,$20,$69,$6E,$73,$65
            EQUB    $72,$74,$65,$64,$20,$63,$61,$75
            EQUB    $73,$69,$6E,$67,$20,$74,$68,$65
            EQUB    $20,$65,$78,$69,$73,$74,$69,$6E
            EQUB    $67,$20,$74,$65,$78,$74,$20,$74
            EQUB    $6F,$0D,$6D,$6F,$76,$65,$2E,$20
            EQUB    $49,$6E,$20,$4F,$76,$65,$72,$20
            EQUB    $6D,$6F,$64,$65,$20,$74,$68,$65
            EQUB    $20,$74,$65,$78,$74,$20,$69,$73
            EQUB    $20,$74,$79,$70,$65,$64,$20,$6F
            EQUB    $76,$65,$72,$20,$6F,$6C,$64,$20
            EQUB    $74,$65,$78,$74,$2E,$0D,$EA,$66
            EQUB    $32,$0D,$41,$20,$74,$65,$78,$74
            EQUB    $20,$66,$69,$6C,$65,$20,$77,$69
            EQUB    $6C,$6C,$20,$62,$65,$20,$6C,$6F
            EQUB    $61,$64,$65,$64,$2C,$20,$65,$72
            EQUB    $61,$73,$69,$6E,$67,$20,$74,$68
            EQUB    $65,$20,$63,$75,$72,$72,$65,$6E
            EQUB    $74,$20,$74,$65,$78,$74,$2E,$0D
            EQUB    $52,$45,$54,$55,$52,$4E,$20,$75
            EQUB    $73,$65,$73,$20,$74,$68,$65,$20
            EQUB    $6E,$61,$6D,$65,$20,$61,$74,$20
            EQUB    $74,$68,$65,$20,$73,$74,$61,$72
            EQUB    $74,$20,$6F,$66,$20,$74,$65,$78
            EQUB    $74,$20,$61,$66,$74,$65,$72,$20
            EQUB    $61,$20,$27,$3E,$27,$0D,$43,$4F
            EQUB    $50,$59,$2C,$20,$52,$45,$54,$55
            EQUB    $52,$4E,$20,$74,$6F,$20,$75,$73
            EQUB    $65,$20,$74,$68,$65,$20,$63,$75
            EQUB    $72,$72,$65,$6E,$74,$20,$66,$69
            EQUB    $6C,$65,$20,$6E,$61,$6D,$65,$2E
            EQUB    $0D,$EA,$73,$68,$66,$2D,$66,$32
            EQUB    $0D,$41,$20,$74,$65,$78,$74,$20
            EQUB    $66,$69,$6C,$65,$20,$77,$69,$6C
            EQUB    $6C,$20,$62,$65,$20,$6C,$6F,$61
            EQUB    $64,$65,$64,$20,$61,$74,$20,$74
            EQUB    $68,$65,$20,$63,$75,$72,$72,$65
            EQUB    $6E,$74,$20,$63,$75,$72,$73,$6F
            EQUB    $72,$2E,$0D,$52,$45,$54,$55,$52
            EQUB    $4E,$20,$75,$73,$65,$73,$20,$74
            EQUB    $68,$65,$20,$6E,$61,$6D,$65,$20
            EQUB    $61,$74,$20,$74,$68,$65,$20,$73
            EQUB    $74,$61,$72,$74,$20,$6F,$66,$20
            EQUB    $74,$65,$78,$74,$20,$61,$66,$74
            EQUB    $65,$72,$20,$61,$20,$27,$3E,$27
            EQUB    $0D,$43,$4F,$50,$59,$2C,$20,$52
            EQUB    $45,$54,$55,$52,$4E,$20,$74,$6F
            EQUB    $20,$75,$73,$65,$20,$74,$68,$65
            EQUB    $20,$63,$75,$72,$72,$65,$6E,$74
            EQUB    $20,$66,$69,$6C,$65,$20,$6E,$61
            EQUB    $6D,$65,$2E,$0D,$EA,$66,$33,$0D
            EQUB    $41,$6C,$6C,$20,$6F,$72,$20,$27
            EQUB    $6D,$61,$72,$6B,$20,$74,$6F,$20
            EQUB    $63,$75,$72,$73,$6F,$72,$27,$20
            EQUB    $74,$65,$78,$74,$20,$77,$69,$6C
            EQUB    $6C,$20,$62,$65,$20,$73,$61,$76
            EQUB    $65,$64,$20,$74,$6F,$20,$61,$20
            EQUB    $66,$69,$6C,$65,$2E,$0D,$52,$45
            EQUB    $54,$55,$52,$4E,$20,$75,$73,$65
            EQUB    $73,$20,$74,$68,$65,$20,$6E,$61
            EQUB    $6D,$65,$20,$61,$74,$20,$74,$68
            EQUB    $65,$20,$73,$74,$61,$72,$74,$20
            EQUB    $6F,$66,$20,$74,$65,$78,$74,$20
            EQUB    $61,$66,$74,$65,$72,$20,$61,$20
            EQUB    $27,$3E,$27,$0D,$43,$4F,$50,$59
            EQUB    $2C,$20,$52,$45,$54,$55,$52,$4E
            EQUB    $20,$74,$6F,$20,$75,$73,$65,$20
            EQUB    $74,$68,$65,$20,$63,$75,$72,$72
            EQUB    $65,$6E,$74,$20,$66,$69,$6C,$65
            EQUB    $20,$6E,$61,$6D,$65,$2E,$0D,$EA
            EQUB    $73,$68,$66,$2D,$66,$33,$0D,$54
            EQUB    $68,$65,$20,$74,$6F,$70,$20,$61
            EQUB    $6E,$64,$20,$62,$6F,$74,$74,$6F
            EQUB    $6D,$20,$73,$63,$72,$6F,$6C,$6C
            EQUB    $20,$6D,$61,$72,$67,$69,$6E,$73
            EQUB    $20,$68,$61,$76,$65,$20,$62,$65
            EQUB    $65,$6E,$20,$72,$65,$6D,$6F,$76
            EQUB    $65,$64,$2E,$0D,$53,$65,$74,$20
            EQUB    $54,$6F,$70,$20,$73,$63,$72,$6F
            EQUB    $6C,$6C,$20,$6D,$61,$72,$67,$69
            EQUB    $6E,$20,$74,$6F,$20,$63,$75,$72
            EQUB    $73,$6F,$72,$20,$6C,$69,$6E,$65
            EQUB    $20,$77,$69,$74,$68,$20,$63,$74
            EQUB    $72,$6C,$2D,$66,$36,$0D,$53,$65
            EQUB    $74,$20,$42,$6F,$74,$74,$6F,$6D
            EQUB    $20,$73,$63,$72,$6F,$6C,$6C,$20
            EQUB    $6D,$61,$72,$67,$69,$6E,$20,$74
            EQUB    $6F,$20,$63,$75,$72,$73,$6F,$72
            EQUB    $20,$6C,$69,$6E,$65,$20,$77,$69
            EQUB    $74,$68,$20,$63,$74,$72,$6C,$2D
            EQUB    $66,$37,$0D,$EA,$66,$34,$3A,$2D
            EQUB    $20,$49,$6E,$74,$65,$72,$61,$63
            EQUB    $74,$69,$76,$65,$20,$46,$69,$6E
            EQUB    $64,$20,$61,$6E,$64,$20,$52,$65
            EQUB    $70,$6C,$61,$63,$65,$20,$46,$75
            EQUB    $6E,$63,$74,$69,$6F,$6E,$2E,$0D
            EQUB    $52,$45,$54,$55,$52,$4E,$20,$74
            EQUB    $6F,$20,$75,$73,$65,$20,$6C,$61
            EQUB    $73,$74,$20,$66,$34,$2E,$20,$53
            EQUB    $70,$65,$63,$69,$61,$6C,$20,$73
            EQUB    $65,$61,$72,$63,$68,$20,$63,$68
            EQUB    $61,$72,$61,$63,$74,$65,$72,$73
            EQUB    $20,$61,$72,$65,$3A,$0D,$23,$20
            EQUB    $64,$69,$67,$69,$74,$2C,$20,$24
            EQUB    $20,$52,$45,$54,$55,$52,$4E,$2C
            EQUB    $20,$2E,$20,$61,$6E,$79,$2C,$20
            EQUB    $5B,$20,$5D,$20,$73,$65,$74,$20
            EQUB    $6F,$66,$20,$63,$68,$61,$72,$2C
            EQUB    $20,$61,$2D,$7A,$20,$61,$20,$74
            EQUB    $6F,$20,$7A,$0D,$7E,$20,$6E,$6F
            EQUB    $74,$2C,$20,$2A,$20,$6D,$61,$6E
            EQUB    $79,$2C,$20,$5E,$20,$6D,$61,$6E
            EQUB    $79,$2C,$20,$7C,$20,$63,$6F,$6E
            EQUB    $74,$72,$6F,$6C,$2C,$20,$40,$20
            EQUB    $61,$6C,$70,$68,$61,$2C,$20,$5C
            EQUB    $20,$6C,$69,$74,$65,$72,$61,$6C
            EQUB    $2E,$0D,$EA,$73,$68,$66,$2D,$66
            EQUB    $34,$0D,$52,$65,$74,$75,$72,$6E
            EQUB    $20,$74,$6F,$20,$73,$70,$65,$63
            EQUB    $69,$66,$69,$65,$64,$20,$6C,$61
            EQUB    $6E,$67,$75,$61,$67,$65,$2E,$0D
            EQUB    $54,$68,$65,$20,$74,$65,$78,$74
            EQUB    $20,$69,$6E,$20,$74,$68,$65,$20
            EQUB    $62,$75,$66,$66,$65,$72,$20,$77
            EQUB    $69,$6C,$6C,$20,$62,$65,$20,$27
            EQUB    $74,$72,$61,$6E,$73,$66,$65,$72
            EQUB    $72,$65,$64,$27,$20,$69,$6E,$74
            EQUB    $6F,$20,$74,$68,$65,$0D,$6C,$61
            EQUB    $6E,$67,$75,$61,$67,$65,$2E,$0D
            EQUB    $EA,$66,$35,$3A,$2D,$20,$47,$6C
            EQUB    $6F,$62,$61,$6C,$20,$72,$65,$70
            EQUB    $6C,$61,$63,$65,$2E,$20,$20,$20
            EQUB    $20,$20,$20,$20,$20,$20,$20,$20
            EQUB    $20,$20,$20,$41,$6C,$6C,$2C,$20
            EQUB    $6F,$72,$20,$6D,$61,$72,$6B,$65
            EQUB    $64,$20,$74,$65,$78,$74,$2E,$0D
            EQUB    $52,$45,$54,$55,$52,$4E,$20,$74
            EQUB    $6F,$20,$75,$73,$65,$20,$6C,$61
            EQUB    $73,$74,$20,$66,$35,$2E,$20,$53
            EQUB    $70,$65,$63,$69,$61,$6C,$20,$72
            EQUB    $65,$70,$6C,$61,$63,$65,$20,$63
            EQUB    $68,$61,$72,$61,$63,$74,$65,$72
            EQUB    $73,$20,$61,$72,$65,$3A,$0D,$2F
            EQUB    $20,$74,$6F,$20,$62,$65,$67,$69
            EQUB    $6E,$20,$74,$68,$65,$20,$72,$65
            EQUB    $70,$6C,$61,$63,$65,$20,$73,$65
            EQUB    $63,$74,$69,$6F,$6E,$3B,$20,$26
            EQUB    $20,$69,$73,$20,$74,$68,$65,$20
            EQUB    $66,$6F,$75,$6E,$64,$20,$73,$74
            EQUB    $72,$69,$6E,$67,$0D,$25,$6E,$20
            EQUB    $66,$6F,$75,$6E,$64,$20,$77,$69
            EQUB    $6C,$64,$20,$73,$65,$63,$74,$69
            EQUB    $6F,$6E,$20,$6E,$2E,$20,$53,$65
            EQUB    $65,$20,$66,$34,$20,$66,$6F,$72
            EQUB    $20,$66,$69,$6E,$64,$20,$63,$68
            EQUB    $61,$72,$61,$63,$74,$65,$72,$73
            EQUB    $2E,$0D,$EA,$73,$68,$66,$2D,$66
            EQUB    $35,$0D,$54,$68,$65,$20,$73,$63
            EQUB    $72,$65,$65,$6E,$20,$6D,$6F,$64
            EQUB    $65,$20,$6D,$61,$79,$20,$62,$65
            EQUB    $20,$73,$65,$74,$20,$74,$6F,$20
            EQUB    $61,$20,$73,$70,$65,$63,$69,$66
            EQUB    $69,$63,$20,$6D,$6F,$64,$65,$2E
            EQUB    $20,$41,$6C,$73,$6F,$0D,$44,$65
            EQUB    $73,$63,$72,$69,$70,$74,$69,$76
            EQUB    $65,$20,$28,$44,$29,$2C,$20,$6F
            EQUB    $72,$20,$4B,$65,$79,$20,$6C,$65
            EQUB    $67,$65,$6E,$64,$20,$28,$4B,$29
            EQUB    $20,$6D,$6F,$64,$65,$73,$20,$6D
            EQUB    $61,$79,$20,$62,$65,$20,$73,$65
            EQUB    $74,$2E,$0D,$44,$20,$61,$6E,$64
            EQUB    $20,$4B,$20,$75,$73,$65,$20,$6D
            EQUB    $6F,$64,$65,$20,$30,$2E,$0D,$EA
            EQUB    $66,$36,$0D,$54,$68,$65,$20,$63
            EQUB    $75,$72,$72,$65,$6E,$74,$20,$70
            EQUB    $6F,$73,$69,$74,$69,$6F,$6E,$20
            EQUB    $6F,$66,$20,$74,$68,$65,$20,$63
            EQUB    $75,$72,$73,$6F,$72,$20,$28,$5F
            EQUB    $29,$20,$69,$73,$20,$72,$65,$6D
            EQUB    $65,$6D,$62,$65,$72,$65,$64,$2E
            EQUB    $0D,$54,$68,$65,$20,$6E,$75,$6D
            EQUB    $62,$65,$72,$20,$61,$74,$20,$74
            EQUB    $68,$65,$20,$62,$6F,$74,$74,$6F
            EQUB    $6D,$20,$69,$6E,$64,$69,$63,$61
            EQUB    $74,$65,$73,$20,$68,$6F,$77,$20
            EQUB    $6D,$61,$6E,$79,$20,$28,$30,$2C
            EQUB    $31,$2C,$32,$29,$0D,$6D,$61,$72
            EQUB    $6B,$73,$20,$28,$FF,$29,$20,$61
            EQUB    $72,$65,$20,$62,$65,$69,$6E,$67
            EQUB    $20,$75,$73,$65,$64,$2E,$0D,$EA
            EQUB    $73,$68,$66,$2D,$66,$36,$0D,$41
            EQUB    $6C,$6C,$20,$70,$6C,$61,$63,$65
            EQUB    $20,$6D,$61,$72,$6B,$73,$20,$61
            EQUB    $72,$65,$20,$63,$6C,$65,$61,$72
            EQUB    $65,$64,$2E,$0D,$0D,$0D,$EA,$66
            EQUB    $37,$0D,$54,$68,$65,$20,$74,$65
            EQUB    $78,$74,$20,$62,$65,$74,$77,$65
            EQUB    $65,$6E,$20,$74,$77,$6F,$20,$6D
            EQUB    $61,$72,$6B,$65,$64,$20,$70,$6C
            EQUB    $61,$63,$65,$73,$20,$69,$73,$20
            EQUB    $63,$6F,$70,$69,$65,$64,$20,$74
            EQUB    $6F,$0D,$74,$68,$65,$20,$63,$75
            EQUB    $72,$72,$65,$6E,$74,$20,$63,$75
            EQUB    $72,$73,$6F,$72,$20,$70,$6F,$73
            EQUB    $69,$74,$69,$6F,$6E,$2E,$0D,$54
            EQUB    $68,$65,$20,$6D,$61,$72,$6B,$73
            EQUB    $20,$61,$72,$65,$20,$4E,$4F,$54
            EQUB    $20,$63,$6C,$65,$61,$72,$65,$64
            EQUB    $2E,$0D,$EA,$73,$68,$66,$2D,$66
            EQUB    $37,$0D,$54,$68,$65,$20,$74,$65
            EQUB    $78,$74,$20,$62,$65,$74,$77,$65
            EQUB    $65,$6E,$20,$74,$77,$6F,$20,$6D
            EQUB    $61,$72,$6B,$65,$64,$20,$70,$6C
            EQUB    $61,$63,$65,$73,$20,$69,$73,$20
            EQUB    $6D,$6F,$76,$65,$64,$20,$74,$6F
            EQUB    $0D,$74,$68,$65,$20,$63,$75,$72
            EQUB    $72,$65,$6E,$74,$20,$63,$75,$72
            EQUB    $73,$6F,$72,$20,$70,$6F,$73,$69
            EQUB    $74,$69,$6F,$6E,$2E,$0D,$54,$68
            EQUB    $65,$20,$6D,$61,$72,$6B,$73,$20
            EQUB    $61,$72,$65,$20,$74,$68,$65,$6E
            EQUB    $20,$63,$6C,$65,$61,$72,$65,$64
            EQUB    $2E,$0D,$EA,$66,$38,$0D,$54,$68
            EQUB    $65,$20,$77,$68,$6F,$6C,$65,$20
            EQUB    $74,$65,$78,$74,$20,$69,$73,$20
            EQUB    $70,$72,$69,$6E,$74,$65,$64,$20
            EQUB    $6F,$75,$74,$20,$74,$6F,$20,$74
            EQUB    $68,$65,$20,$73,$63,$72,$65,$65
            EQUB    $6E,$20,$6F,$72,$20,$70,$72,$69
            EQUB    $6E,$74,$65,$72,$0D,$75,$73,$69
            EQUB    $6E,$67,$20,$74,$68,$65,$20,$62
            EQUB    $75,$69,$6C,$74,$2D,$69,$6E,$20
            EQUB    $66,$6F,$72,$6D,$61,$74,$74,$65
            EQUB    $72,$2F,$70,$61,$67,$69,$6E,$61
            EQUB    $74,$6F,$72,$2E,$0D,$0D,$EA,$73
            EQUB    $68,$66,$2D,$66,$38,$0D,$54,$68
            EQUB    $65,$20,$74,$65,$78,$74,$20,$62
            EQUB    $65,$74,$77,$65,$65,$6E,$20,$74
            EQUB    $68,$65,$20,$63,$75,$72,$73,$6F
            EQUB    $72,$20,$61,$6E,$64,$20,$74,$68
            EQUB    $65,$20,$6D,$61,$72,$6B,$65,$64
            EQUB    $20,$70,$6C,$61,$63,$65,$0D,$69
            EQUB    $73,$20,$64,$65,$6C,$65,$74,$65
            EQUB    $64,$2E,$0D,$54,$68,$65,$20,$6D
            EQUB    $61,$72,$6B,$20,$69,$73,$20,$74
            EQUB    $68,$65,$6E,$20,$63,$6C,$65,$61
            EQUB    $72,$65,$64,$2E,$0D,$EA,$66,$39
            EQUB    $0D,$54,$68,$65,$20,$6F,$6C,$64
            EQUB    $20,$74,$65,$78,$74,$20,$69,$6E
            EQUB    $20,$74,$68,$65,$20,$62,$75,$66
            EQUB    $66,$65,$72,$20,$69,$73,$20,$72
            EQUB    $65,$63,$6F,$76,$65,$72,$65,$64
            EQUB    $20,$61,$66,$74,$65,$72,$20,$61
            EQUB    $20,$42,$52,$45,$41,$4B,$0D,$6F
            EQUB    $72,$20,$69,$6D,$6D,$65,$64,$69
            EQUB    $61,$74,$65,$6C,$79,$20,$61,$66
            EQUB    $74,$65,$72,$20,$61,$20,$43,$6C
            EQUB    $65,$61,$72,$20,$54,$65,$78,$74
            EQUB    $20,$28,$62,$79,$20,$73,$68,$66
            EQUB    $2D,$66,$39,$29,$2E,$0D,$0D,$EA
            EQUB    $73,$68,$66,$2D,$66,$39,$0D,$41
            EQUB    $6C,$6C,$20,$74,$65,$78,$74,$20
            EQUB    $69,$6E,$20,$74,$68,$65,$20,$62
            EQUB    $75,$66,$66,$65,$72,$20,$69,$73
            EQUB    $20,$64,$65,$6C,$65,$74,$65,$64
            EQUB    $2E,$0D,$55,$73,$65,$20,$73,$68
            EQUB    $66,$2D,$66,$39,$20,$74,$77,$69
            EQUB    $63,$65,$20,$74,$6F,$20,$72,$65
            EQUB    $6D,$6F,$76,$65,$20,$74,$68,$65
            EQUB    $20,$74,$65,$78,$74,$20,$62,$65
            EQUB    $79,$6F,$6E,$64,$20,$68,$6F,$70
            EQUB    $65,$20,$6F,$66,$20,$61,$0D,$72
            EQUB    $65,$63,$6F,$76,$65,$72,$79,$20
            EQUB    $62,$79,$20,$66,$39,$2E,$0D,$EA
            EQUB    $73,$68,$66,$2D,$54,$41,$42,$0D
            EQUB    $54,$68,$65,$20,$54,$41,$42,$20
            EQUB    $6B,$65,$79,$20,$6D,$61,$79,$20
            EQUB    $62,$65,$20,$75,$73,$65,$64,$20
            EQUB    $74,$6F,$20,$6D,$6F,$76,$65,$20
            EQUB    $74,$6F,$20,$7A,$6F,$6E,$65,$73
            EQUB    $20,$6F,$66,$20,$65,$69,$67,$68
            EQUB    $74,$0D,$63,$68,$61,$72,$61,$63
            EQUB    $74,$65,$72,$73,$20,$61,$63,$72
            EQUB    $6F,$73,$73,$20,$74,$68,$65,$20
            EQUB    $73,$63,$72,$65,$65,$6E,$2C,$20
            EQUB    $6F,$72,$20,$74,$6F,$20,$70,$6F
            EQUB    $73,$69,$74,$69,$6F,$6E,$20,$75
            EQUB    $6E,$64,$65,$72,$0D,$74,$68,$65
            EQUB    $20,$66,$69,$72,$73,$74,$20,$63
            EQUB    $68,$61,$72,$61,$63,$74,$65,$72
            EQUB    $20,$6F,$66,$20,$74,$68,$65,$20
            EQUB    $6C,$69,$6E,$65,$20,$69,$6D,$6D
            EQUB    $65,$64,$69,$61,$74,$65,$6C,$79
            EQUB    $20,$61,$62,$6F,$76,$65,$2E,$0D
            EQUB    $EA,$73,$68,$66,$2D,$43,$4F,$50
            EQUB    $59,$0D,$43,$75,$72,$73,$6F,$72
            EQUB    $20,$65,$64,$69,$74,$69,$6E,$67
            EQUB    $20,$63,$61,$6E,$20,$62,$65,$20
            EQUB    $75,$73,$65,$64,$20,$77,$69,$74
            EQUB    $68,$20,$8B,$88,$A4,$A2,$89,$8A
            EQUB    $20,$61,$6E,$64,$20,$43,$4F,$50
            EQUB    $59,$2E,$0D,$55,$73,$65,$72,$20
            EQUB    $64,$65,$66,$69,$6E,$65,$64,$20
            EQUB    $73,$6F,$66,$74,$20,$6B,$65,$79
            EQUB    $73,$20,$61,$72,$65,$20,$61,$76
            EQUB    $61,$69,$6C,$61,$62,$6C,$65,$20
            EQUB    $61,$73,$20,$6E,$6F,$72,$6D,$61
            EQUB    $6C,$2E,$0D,$41,$6C,$6C,$20,$63
            EQUB    $68,$61,$72,$61,$63,$74,$65,$72
            EQUB    $73,$20,$65,$78,$63,$65,$70,$74
            EQUB    $20,$45,$53,$43,$41,$50,$45,$20
            EQUB    $61,$72,$65,$20,$70,$75,$74,$20
            EQUB    $69,$6E,$74,$6F,$20,$74,$65,$78
            EQUB    $74,$2E,$0D,$EA
.L978C      LDA     #$04
            LDX     #$02
            JSR     OSBYTE
            LDA     #$DB
            LDX     #$8A
            LDY     #$00
            JSR     OSBYTE
            LDA     #$E3
            LDX     #$A0
            LDY     #$00
            JSR     OSBYTE
            LDA     #$E2
            LDX     #$90
            LDY     #$00
            JSR     OSBYTE
            LDX     #$80
.L97B0      LDA     #$E1
            LDY     #$00
            JMP     OSBYTE
.L97B7      LDA     #$DB
            LDX     #$09
            LDY     #$00
            JSR     OSBYTE
            LDA     #$04
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
.L9819      LDA     #$17
            JSR     OSWRCH
            TXA
            JSR     OSWRCH
            TYA
            JSR     OSWRCH
            JSR     L84F6
            EQUS    $00,$00,$00,$00,$00,$00,$00,$EA
.L9831      RTS
.L9832      LDA     L002B
            AND     #$07
            CMP     #$02
            BEQ     L9871
            CMP     #$05
            BEQ     L9871
            BRA     L987C
.L9840      LDA     L002B
            AND     #$07
            CMP     #$02
            BEQ     L984C
            CMP     #$05
            BNE     L987C
.L984C      PHA
            JSR     L84F6
            EQUS    $1A,$1E,$EA
.L9853      JSR     LB203
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
.L9871      JSR     LB1EF
            JSR     L988F
            STA     L0031
            JSR     L98A6
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
.L988F      LDA     #$A0
            LDX     #$0A
            JSR     OSBYTE
            STX     L002F
            STY     L0030
            LDX     #$08
            JSR     OSBYTE
            TYA
            CLC
            SBC     L0030
            STA     L0030
            RTS
.L98A6      LDA     L002B
            AND     #$07
            LDY     #$0E
            CMP     #$05
            BEQ     L98B6
            LDY     #$07
            CMP     #$02
            BNE     L98CF
.L98B6      LDA     #$1C
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
.L98CF      LDA     #$1A
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
            JSR     LB203
            LDX     L0039
            BEQ     L9903
            JSR     L84F6
            EQUS    "Cursor Editing",$EA
.L9901      BRA     L9931
.L9903      JSR     L8525
            BEQ     L9915
            JSR     L84F6
            EQUS    "Insert ",$EA
.L9913      BRA     L9920
.L9915      JSR     L84F6
            EQUS    "Over   ",$EA
.L9920      LDA     L004F
            ORA     #$30
            JSR     OSWRCH
            JSR     L84F6
            EQUS    " marks",$EA
.L9931      JSR     LB1EF
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
            JSR     L9992
            LDX     #$01
            BRA     L996A
.L9968      LDX     #$00
.L996A      JSR     LB203
            PLA
            STA     L0000
            PLA
            STA     L0001
            JSR     L8505
            JSR     LB1EF
            TXA
            BEQ     L9984
            LDA     L002F
            DEC     A
            LDY     L0030
            STA     L0733,Y
.L9984      JMP     (L0000)
.L9987      LDX     L0036
            LDY     L0037
            BPL     L9992
.L998D      LDY     L0030
            INY
.L9990      LDX     #$00
.L9992      LDA     #$1F
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
            CPX     L0020
            SBC     L0021
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
.L9A5E      LDA     L0030
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
.L9ABD      LDA     L0030
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
            JSR     L9992
            LDA     #$20
            JSR     OSWRCH
            PLX
            LDY     L0036
.L9B23      DEY
            STA     (L0012),Y
            DEX
            BNE     L9B23
.L9B29      JMP     L9987
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
            LDY     L004F
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
.L9B83      LDA     #$08
            EOR     L002B
            STZ     L0034
            JSR     L8516
            LDA     #$08
            AND     L002B
            BNE     L9BA8
            JSR     L9952
            EQUS    " TAB columns of 8",$EA
.L9BA7      RTS
.L9BA8      JSR     L9952
            EQUS    " TAB below words.",$EA
.L9BBD      RTS
.L9BBE      LDA     #$08
            BIT     L002B
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
.L9C01      JSR     L9956
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
            JSR     LB341
            LDA     L0013
            DEC     A
            CMP     L0003
            BCS     L9C6B
.L9C42      BRK
            EQUB    $02
            EQUS    "Not enough space to return to language",$00
.L9C6B      LDA     #$FF
            STA     L0024
            LDA     L0003
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
            CMP     L0021
            BNE     L9C82
            JSR     L980F
            JSR     L84F6
            EQUS    $1A,$0C,$EA
.L9CA1      JSR     L97B7
            LDA     L0003
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
.LA45F      JSR     LBE22
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
            JSR     L84F6
            EQUS    $1A,$0C,$EA
.LA520      BIT     L002A
            BMI     LA533
            LDX     #$00
            LDA     #$05
            JSR     OSBYTE
            JSR     OSBYTE
            LDA     #$02
            JSR     OSWRCH
.LA533      BIT     L0029
            BMI     LA540
            BIT     L002A
            BPL     LA540
            LDA     #$0E
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
.LA5AF      CMP     LAF31,X
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
            CMP     LAF32,X
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
.LA60C      JSR     LA8C8
            SEC
            JSR     LAAF3
            JMP     LA588
.LA616      JSR     LA894
            BIT     L002A
            BPL     LA63F
            JSR     L9968
            EQUS    "Print done, press shift key",$EA
.LA63C      JSR     LADFE
.LA63F      JSR     L84F6
            EQUS    $03,$0F,$EA
.LA645      JSR     LADD3
            LDX     L0010
            LDY     L0011
            JMP     L8531
.LA64F      LDA     #$FF
            JMP     (LAF33,X)
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
            LDA     #$01
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
.LA7FF      JSR     LAB2B
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
.LA81F      JSR     LAB2B
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
.LA88F      STA     L001E
            STA     L0046
            RTS
.LA894      LDA     L0044
            JMP     LAA84
.LA899      LDA     (L0008),Y
            STA     L0045
            INY
            RTS
.LA89F      STA     L0017
            STZ     L0018
            RTS
.LA8A4      LDA     L0008
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
.LA8C8      LDA     #$0D
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
.LA90D      JSR     LA71B
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
.LA930      LDA     #$02
            STA     L001F
            RTS
.LA935      LDA     L0008
            STA     L0518
            LDA     L0009
            STA     L0519
            BRA     LA94B
.LA941      LDA     L0008
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
.LA977      TSX
            CPX     #$FD
            BCS     LA976
            PLA
            PLA
            RTS
.LA97F      JSR     LA894
            LDA     L0500
            LSR     A
            BCS     LA97F
            RTS
.LA989      LDA     L0029
            BMI     LA994
            LDA     L002A
            BPL     LA999
            JSR     LADFE
.LA994      LDA     #$0C
            JMP     OSWRCH
.LA999      JSR     LA994
            JMP     LADFE
.LA99F      LDA     L0008
            STA     L051A
            LDA     L0009
            STA     L051B
            JMP     LA935
.LA9AC      LDA     L0008
            STA     L0516
            LDA     L0009
            STA     L0517
            JMP     LA941
.LA9B9      PHY
            JSR     LADD3
            PLY
            RTS
.LA9BF      JMP     LA94B
.LA9C2      LDX     L001B
            JSR     LAAFD
            STX     L001B
            RTS
.LA9CA      CLC
            JSR     LAAF3
            JSR     LADD3
            LDX     L0008
            LDY     L0009
            LDA     #$80
            JSR     OSFIND
            STA     L004D
            LDY     #$00
            JMP     LA8C8
.LA9E1      STA     L004B
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
.LA9F7      STZ     L003A
            RTS
.LA9FA      LDX     L001A
            JSR     LAAFD
            STA     L001A
            RTS
.LAA02      LDX     L001F
            JSR     LAAFD
            STX     L001F
            RTS
.LAA0A      JSR     LAB2B
            CMP     L0044
            BEQ     LAA18
            BCC     LAA18
            PHA
            JSR     LA894
            PLA
.LAA18      JMP     LAA84
.LAA1B      JSR     LAB2B
            CMP     L0044
            BEQ     LAA27
            BCC     LAA27
            JMP     LA894
.LAA27      RTS
.LAA28      STA     L003A
            RTS
.LAA2B      STA     L0019
            RTS
.LAA2E      LDA     L0008
            STA     L051A
            LDA     L0009
            STA     L051B
            JMP     LA94B
.LAA3B      LDA     L0008
            STA     L0516
            LDA     L0009
            STA     L0517
            JMP     LA94B
.LAA48      JSR     LA894
            LDA     L0500
            LSR     A
            BCC     LAA48
            RTS
.LAA52      CLC
            JSR     LAAF3
            LDX     L0008
            LDY     L0009
            JSR     OSCLI
            LDY     #$00
            JMP     LA8C8
.LAA62      LDX     L0043
            JSR     LAAFD
            TXA
            BEQ     LAA73
            STA     L0043
            LDX     L0044
            INX
            BEQ     LAA73
            STA     L0044
.LAA73      RTS
.LAA74      LDX     L0048
            JSR     LAAFD
            STA     L0048
            RTS
.LAA7C      STA     L0018
            STZ     L0017
            RTS
.LAA81      JSR     LAB2B
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
.LAAA8      LDA     #$01
            STA     L001F
            RTS
.LAAAD      STZ     L004A
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
.LAAC5      LDA     (L0008),Y
            STA     L004E
            INY
            RTS
.LAACB      LDX     L003B
            CPX     #$FF
            BNE     LAAD3
            LDX     L001B
.LAAD3      JSR     LAAFD
            STX     L003B
            RTS
.LAAD9      LDA     (L0008),Y
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
.LAAEE      STA     L001C
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
            LDA     #$0A
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
.LAC3E      LDA     #$17
            JSR     OSWRCH
            LDA     #$20
            JSR     OSWRCH
            LDX     #$01
.LAC4A      LDA     L0052,X
            JSR     OSWRCH
            INX
            CPX     #$09
            BNE     LAC4A
            JSR     L84F6
            EQUS    " ",$17," ",$00,$00,$00,$00,$00,$00,$00,$00,$EA
.LAC63      PLX
            PLY
            RTS
.LAC66      LDA     #$7E
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
            LDA     #$20
            JSR     OSWRCH
            PLA
            RTS
.LAC9A      PLA
.LAC9B      PHY
            TAY
            LDA     L0600,Y
            PLY
.LACA1      JMP     (L020E)
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
            LDA     #$00
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
            LDX     #$FF
            LDY     #$FF
            LDA     #$81
            JSR     OSBYTE
            CPX     #$FF
            BNE     LAE00
            LDA     #$0F
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
.LAF31      EQUB    $61
.LAF32      EQUB    $66
.LAF33      EQUW    LA7FF
            EQUS    "an"
            EQUW    LA81F
            EQUS    "bl"
            EQUW    LA88F
            EQUS    "bp"
            EQUW    LA894
            EQUS    "cc"
            EQUW    LA899
            EQUS    "ce"
            EQUW    LA89F
            EQUS    "ch"
            EQUW    LA8A4
            EQUS    "co"
            EQUW    LA8C8
            EQUS    "dm"
            EQUW    LA90D
            EQUS    "ds"
            EQUW    LA930
            EQUS    "ef"
            EQUW    LA935
            EQUS    "eh"
            EQUW    LA941
            EQUS    "en"
            EQUW    LA977
            EQUS    "ep"
            EQUW    LA97F
            EQUS    "ff"
            EQUW    LA989
            EQUS    "fo"
            EQUW    LA99F
            EQUS    "he"
            EQUW    LA9AC
            EQUS    "ic"
            EQUW    LA9B9
            EQUS    "ig"
            EQUW    LA9BF
            EQUS    "in"
            EQUW    LA9C2
            EQUS    "io"
            EQUW    LA9CA
            EQUS    "ix"
            EQUW    LA9E1
            EQUS    "ju"
            EQUW    LA9F7
            EQUS    "ll"
            EQUW    LA9FA
            EQUS    "ls"
            EQUW    LAA02
            EQUS    "lv"
            EQUW    LAA0A
            EQUS    "ne"
            EQUW    LAA1B
            EQUS    "nj"
            EQUW    LAA28
            EQUS    "nn"
            EQUW    LAA2B
            EQUS    "of"
            EQUW    LAA2E
            EQUS    "oh"
            EQUW    LAA3B
            EQUS    "op"
            EQUW    LAA48
            EQUS    "os"
            EQUW    LAA52
            EQUS    "pl"
            EQUW    LAA62
            EQUS    "po"
            EQUW    LAA74
            EQUS    "rf"
            EQUW    LAA7C
            EQUS    "sp"
            EQUW    LAA81
            EQUS    "ss"
            EQUW    LAAA8
            EQUS    "ta"
            EQUW    LAAAD
            EQUS    "tc"
            EQUW    LAAC5
            EQUS    "ti"
            EQUW    LAACB
            EQUS    "tr"
            EQUW    LAAD9
            EQUS    "ul"
            EQUW    LAAEE
            EQUS    ".h"
            EQUB    $65,$0D,$2E,$65,$6E,$0D,$2E,$66
            EQUB    $6F,$0D,$2E,$63,$65,$0D,$50,$61
            EQUB    $67,$65,$20,$2E,$72,$30,$0D,$2E
            EQUB    $66,$66,$2E,$65,$6E,$0D
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
.LB08E      JSR     L84F6
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
            LDA     #$20
            JSR     OSWRCH
            LDA     #$00
            PLY
.LB0BC      STA     L002C
            LDA     L0732,Y
            CMP     L002C
            BCC     LB0F6
            BEQ     LB0F6
            LDA     #$1C
            JSR     OSWRCH
            LDA     L002C
            INC     A
            JSR     OSWRCH
            PHX
            LDA     L002B
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
            LDA     #$0C
            JSR     OSWRCH
            PHY
            JSR     L98A6
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
            JSR     L9992
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
            LDY     L004F
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
            JSR     L9992
            LDA     L002E
            CLC
            ADC     #$31
            JSR     LB1DA
            LDX     L002D
            INX
            JSR     L9992
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
            LDA     #$81
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
            JSR     L9992
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
            BIT     L002B
            BEQ     LB1CD
            LDA     #$0D
.LB1D8      ORA     #$40
.LB1DA      PHA
            LDA     L002B
            AND     #$07
            CMP     #$07
            BNE     LB1E8
            PLA
            LDA     #$FF
            BRA     LB1CD
.LB1E8      JSR     LB203
            PLA
            JSR     OSWRCH
.LB1EF      LDA     #$11
            JSR     OSWRCH
            LDA     #$80
            JSR     OSWRCH
            LDA     #$11
            JSR     OSWRCH
            LDA     #$07
            JMP     OSWRCH
.LB203      JSR     L84F6
            EQUS    $11,$87,$11,$00,$EA
.LB20B      RTS
.LB20C      JSR     L97CB
            BCC     LB215
            LDA     L0036
            BEQ     LB250
.LB215      DEC     L0036
            BPL     LB250
            LDA     L002F
            STA     L0036
.LB21D      JSR     L97CB
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
.LB248      STZ     L0036
            BRA     LB250
.LB24C      LDA     L0040
            STA     L0036
.LB250      STZ     L0034
            RTS
.LB253      LDA     L0036
            CMP     L002F
            BEQ     LB25D
            INC     L0036
            BRA     LB250
.LB25D      JSR     L97D4
            BCS     LB250
            LDA     #$00
            STZ     L0036
.LB266      JSR     L97D4
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
            JSR     LB266
            BCS     LB2A9
            JSR     LAFFD
            JMP     LB248
.LB2A9      PLA
            PLA
            RTS
.LB2AC      JSR     LB253
            JSR     LAFFD
            STZ     L0034
            RTS
.LB2B5      LDA     L0040
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
            JSR     LB21D
            BCS     LB2A9
            JSR     LAFFD
            JMP     LB24C
.LB2E9      JMP     LB20C
.LB2EC      LDA     L0040
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
.LB30F      JMP     LB253
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
            STZ     L004F
            LDA     #$0D
            STA     (L0002)
            STA     (L0004)
.LB341      LDX     L0022
            LDY     L0023
            JSR     L9A68
            STZ     L0036
            RTS
.LB34B      LDA     L0051
            STA     L0037
            LDX     L0004
            LDY     L0005
            JSR     L9AC7
            JMP     LBED2
.LB359      LDA     L002B
            EOR     #$10
            JSR     L8516
            JMP     L98E3
.LB363      LDA     #$16
            JSR     OSWRCH
            LDA     L002B
            AND     #$07
            TAY
            LDA     LB594,Y
            ORA     #$80
            JSR     OSWRCH
            LDA     #$83
            JSR     OSBYTE
            STX     L0002
            STY     L0003
            LDA     #$84
            JSR     OSBYTE
            STX     L0020
            STY     L0021
            CLC
            LDA     L0002
            ADC     #$01
            STA     L0022
            LDA     L0003
            ADC     #$00
            STA     L0023
            LDA     L0020
            SBC     #$00
            STA     L0004
            LDA     L0021
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
.LB3AF      LDA     L0037
            STA     L0050
            BRA     LB3C1
.LB3B5      LDA     L0037
            STA     L0051
            BRA     LB3C1
.LB3BB      STZ     L0050
            LDA     L0030
            STA     L0051
.LB3C1      STZ     L0034
            RTS
.LB3C4      JSR     L9956
            EQUS    "Text will be cleared if a key is hit",$EA
.LB3EC      LDA     #$81
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
.LB406      JSR     L9956
            EQUS    "Type filename to load:",$EA
.LB420      JSR     L83DF
            LDY     #$00
            JSR     L832C
            JMP     L8531
.LB42B      JSR     LBE54
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
.LB4B1      JSR     LBE22
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
.LB4E7      LDA     #$01
            STA     L0024
            JSR     L97B7
            JSR     L9956
            EQUS    "Command line",$EA
.LB4FE      JSR     OSNEWL
            JSR     L980F
.LB504      LDA     #$2A
            JSR     OSWRCH
            LDA     #$00
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
.LB529      LDA     #$7E
            JSR     OSBYTE
.LB52E      JSR     L84F6
            EQUS    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$03,$0F,$0D,$1A,$EA
.LB541      LDA     #$87
            JSR     OSBYTE
            LDA     L002B
            AND     #$07
            TAX
            LDA     LB594,X
            STY     L0000
            EOR     L0000
            AND     #$07
            BEQ     LB563
            LDA     #$16
            JSR     OSWRCH
            LDA     LB594,X
            ORA     #$80
            JSR     OSWRCH
.LB563      JSR     L978C
            JMP     L8534
.LB569      LDA     #$01
            STA     L0039
            JSR     L97B7
            JMP     L98E3
.LB573      BRK
            EQUB    $01
            EQUS    "Only 0,1,3,4,6,7,D and K"
.LB58D      EQUS    $00
            EQUB    $00,$07,$00,$00,$0E,$00
.LB594      EQUB    $00,$01,$00,$03,$04,$00,$06,$07
.LB59C      JSR     L9956
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
            LDA     #$82
            JSR     OSBYTE
            INX
            BNE     LB5FA
            INY
            BNE     LB5FA
            PLA
            PHA
            ORA     #$80
            TAX
            LDA     #$85
            JSR     OSBYTE
            CPX     L0010
            TYA
            SBC     L0011
            BCC     LB654
.LB5FA      PLX
            LDA     #$07
            TRB     L002B
            PLA
            ORA     L002B
            JSR     L8516
            JSR     LB363
.LB608      LDA     L04FF
            CMP     L0003
            BCC     LB660
            CMP     L0021
            BCS     LB660
            CMP     L04FD
            BCC     LB660
            LDA     L04FD
            CMP     L0003
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
.LB654      JSR     LB341
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
.LB6B3      LDA     #$01
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
            JSR     L84F6
            EQUS    ", new line:",$EA
.LB6FB      JSR     LB1EF
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
            JSR     LB341
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
.LBBF3      JSR     LBE54
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
.LBC8D      JSR     L9956
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
.LBD1B      JSR     L9987
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
.LBD7A      JSR     LB203
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
            LDX     L004F
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
            LDX     L004F
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
.LBE16      LDA     L004F
            STA     L003E
            STZ     L004F
            JSR     L98E5
            LDA     L003E
.LBE21      RTS
.LBE22      LDA     L004F
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
            JSR     LB341
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
.LBEA7      JSR     L9AF8
            LDX     L004F
            CPX     #$02
            BEQ     LBE99
            LDA     L0012
            STA     L0018,X
            LDA     L0013
            STA     L001A,X
            JSR     L999F
            INC     L004F
            JMP     L98E5
.LBEC0      JSR     LBDED
            JMP     L999F
.LBEC6      JSR     LBDED
            JSR     LBE34
            BEQ     LBE99
            STX     L0012
            STY     L0013
.LBED2      JSR     L999F
            LDA     L0000
            STA     L0036
            RTS
.LBEDA      JSR     LBE76
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
            STX     L004F
            JSR     L98E5
            JMP     L999F
.LBF29      JSR     LBE76
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


 processor 6502
 org  $7ffe
 word $8000
 sei
 stx $d016
 jsr $fda3
 jsr $fd50
 jsr $fd15
 jsr $ff5b

 lda #%11111111
 sta $D015
 sta $D01D
 sta $D017

 lda #$FF
 sta $D40E
 sta $D40F
 lda #$80
 sta $D412

 lda #%10000001
 sta $D404
 lda #%11110000
 sta $D406
 lda #%00100000
 sta $D405
       
 lda #7
 sta $D400
 sta $D401
 sta $D402
 sta $D403
 
 lda #%01000001
 sta $D40B
 lda #%11110000
 sta $D40D
 lda #%00100000
 sta $D40C
 
 lda #5
 sta $D407
 sta $D408
 sta $D409
 sta $D40A
 
 lda #%10000000
 sta $D404
 sta $D40B
        
 lda #%00001100
 sta $D418

 jmp NoCollision
DisplayScore
 lda #30
 adc $C005
 lda #48
 adc $C005
 sta $400+71
 lda #48
 adc $C004
 sta $400+72
 lda #48
 adc $C003
 sta $400+73
 lda #48
 adc $C002
 sta $400+74
 lda #48
 adc $C001
 sta $400+75
 lda #48
 adc $C000
 sta $400+76
 rts

AddPoint
 ldy $C000
 iny
 cpy #10
 beq Digit2
 sty $C000
 jmp DoneAddingPoint
Digit2
 ldy #0
 sty $C000
 ldy $C001
 iny
 cpy #10
 beq Digit3
 sty $C001
 jmp DoneAddingPoint
Digit3
 ldy #0
 sty $C001
 ldy $C002
 iny
 cpy #10
 beq Digit4
 sty $C002
 jmp DoneAddingPoint
Digit4
 ldy #0
 sty $C002
 ldy $C003
 iny
 cpy #10
 beq Digit5
 sty $C003
 jmp DoneAddingPoint
Digit5
 ldy #0
 sty $C003
 ldy $C004
 iny
 cpy #10
 beq Digit6
 sty $C004
 jmp DoneAddingPoint
Digit6
 ldy #0
 sty $C004
 ldy $C005
 iny
 sty $C005
DoneAddingPoint
 rts

DisplayScore2
 lda #30
 adc $C00B
 lda #48
 adc $C00B
 sta $400+40+71
 lda #48
 adc $C00A
 sta $400+40+72
 lda #48
 adc $C009
 sta $400+40+73
 lda #48
 adc $C008
 sta $400+40+74
 lda #48
 adc $C007
 sta $400+40+75
 lda #48
 adc $C006
 sta $400+40+76
 rts

AddPoint2
 ldy $C006
 iny
 cpy #10
 beq Digit22
 sty $C006
 jmp DoneAddingPoint2
Digit22
 ldy #0
 sty $C006
 ldy $C007
 iny
 cpy #10
 beq Digit32
 sty $C007
 jmp DoneAddingPoint2
Digit32
 ldy #0
 sty $C007
 ldy $C008
 iny
 cpy #10
 beq Digit42
 sty $C008
 jmp DoneAddingPoint2
Digit42
 ldy #0
 sty $C008
 ldy $C009
 iny
 cpy #10
 beq Digit52
 sty $C009
 jmp DoneAddingPoint2
Digit52
 ldy #0
 sty $C009
 ldy $C00A
 iny
 cpy #10
 beq Digit62
 sty $C00A
 jmp DoneAddingPoint2
Digit62
 ldy #0
 sty $C00A
 ldy $C00B
 iny
 sty $C00B
DoneAddingPoint2
 rts


FullCollision
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
 lda $033C
 adc $03F2
 cmp $033C
 bcs ColReset1
 lda #255
ColReset1
 clc
 sta $033C
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
 lda $033C
 sbc $03F2
 clc
 sta $033C
 lda $033E
 adc $03F3
 cmp $033E
 bcs ColReset2
 lda #255
ColReset2
 clc
 sta $033E
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
 lda $033C
 adc $03F2
 cmp $033C
 bcs ColReset3
 lda #255
ColReset3
 clc
 sta $033C
 jsr PointCollision
 lda $0340
 cmp #1
 beq APointCollided
APointCollided
 rts

PointCollision
 lda #0
 sta $0340

 lda $033C
 cmp $033D
 bcc NotAboveX2
 lda $033D
 adc $03F0
 cmp $033D
 bcs ColReset4
 lda #255
ColReset4
 clc
 tax
 cpx $033C
 bcc NotBelowX2
 lda $033E
 cmp $033F
 bcc NotAboveY2
 lda $033F
 adc $03F1
 cmp $033F
 bcs ColReset5
 lda #255
ColReset5
 clc
 tax
 cpx $033E
 bcc NotBelowY2
 lda #1
 sta $0340
NotAboveX2
NotBelowX2
NotAboveY2
NotBelowY2
 rts
NoCollision

 ldx #0
 jmp LoadDataNo0
SpriteDataNo0
 byte #0,#64,#0
 byte #1,#128,#0
 byte #3,#64,#0
 byte #3,#240,#0
 byte #131,#192,#0
 byte #255,#192,#0
 byte #255,#192,#0
 byte #127,#128,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo0
 lda SpriteDataNo0,x
 sta $3000,x
 inx
 cpx #$3F
 bne LoadDataNo0

 ldx #0
 jmp LoadDataNo1
SpriteDataNo1
 byte #32,#0,#0
 byte #24,#0,#0
 byte #44,#0,#0
 byte #252,#0,#0
 byte #60,#16,#0
 byte #63,#240,#0
 byte #63,#240,#0
 byte #31,#224,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo1
 lda SpriteDataNo1,x
 sta $30C0,x
 inx
 cpx #$3F
 bne LoadDataNo1

 ldx #0
 jmp LoadDataNo2
SpriteDataNo2
 byte #41,#0,#0
 byte #62,#0,#0
 byte #239,#0,#0
 byte #94,#0,#0
 byte #255,#0,#0
 byte #126,#0,#0
 byte #255,#0,#0
 byte #124,#0,#0
 byte #164,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo2
 lda SpriteDataNo2,x
 sta $3040,x
 inx
 cpx #$3F
 bne LoadDataNo2

 ldx #0
 jmp LoadDataNo3
SpriteDataNo3
 byte #126,#0,#0
 byte #171,#0,#0
 byte #213,#0,#0
 byte #106,#0,#0
 byte #86,#0,#0
 byte #106,#0,#0
 byte #60,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo3
 lda SpriteDataNo3,x
 sta $3080,x
 inx
 cpx #$3F
 bne LoadDataNo3

 lda #192
 sta $7F8

 lda #192
 sta $7FD

 lda #193
 sta $7F9

 lda #193
 sta $7FA

 lda #193
 sta $7FB

 lda #194
 sta $7FC

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo5 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo5
 ldy #31
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo6 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo6
 ldy #32
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo7 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo7
 ldy #33
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo8 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo8
 ldy #34
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo9 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo9
 ldy #35
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo10 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo10
 ldy #36
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo11 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo11
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo12 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo12
 ldy #32
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo13 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo13
 ldy #33
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo14 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo14
 ldy #34
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo15 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo15
 ldy #35
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo16 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo16
 ldy #36
 lda #1

 sta ($00FB),y

 lda #0

 sta $C00C
; THIS IS LINE

LoopNo17
 lda $C00C
 sta $CFFE
 lda #22
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo18
 jmp GotoNo18
BranchNo18
 jmp ExitLoopNo17


GotoNo18

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00C
CompLoopNo19
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo19
 ldy #29
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00C
CompLoopNo20 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo20
 ldy #29
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo17
ExitLoopNo17

 lda #66
 sta $C00D
 lda #79
 sta $C00E
 lda #77
 sta $C00F
 lda #66
 sta $C010
 lda #69
 sta $C011
 lda #82
 sta $C012
 lda #83
 sta $C013
 lda #96
 sta $C014
 lda #68
 sta $C015
 lda #79
 sta $C016
 lda #68
 sta $C017
 lda #71
 sta $C018
 lda #69
 sta $C019
 lda #0
 sta $C01A
; THIS IS STARTMESSAGE

 lda #0

 sta $C00C
; THIS IS STARTCURSOR

LoopNo21
 ldx $C00C
 lda $C00D,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo22
 jmp GotoNo22
BranchNo22
 jmp ExitLoopNo21


GotoNo22

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo23
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo23
 lda $C00C

 clc
 adc #10

 sta $CFFF

 tay
 ldx $C00C
 lda $C00D,x

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE

 sec
 sbc #64

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo24 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo24
 lda $C00C

 clc
 adc #10

 sta $CFFF

 tay
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo21
ExitLoopNo21

 lda #11
 sta $D020

 lda #6
 sta $D021

 lda #12
 sta $D028

 lda #12
 sta $D029

 lda #12
 sta $D02A

 lda #2
 sta $D02B

 lda #7
 sta $D027

 lda #1
 sta $D02C

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


 lda #0
 sta $C006
 sta $C007
 sta $C008
 sta $C009
 sta $C00A
 sta $C00B


LoopNo25
 lda #%00010000
 bit $DC01
 beq BranchNo26
 jmp GotoNo26
BranchNo26
 jmp ExitLoopNo25


GotoNo26

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo25
ExitLoopNo25

RESET

 lda #0

 sta $C00D
; THIS IS WIPE

LoopNo27
 lda $C00D
 sta $CFFE
 lda #13
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo28
 jmp GotoNo28
BranchNo28
 jmp ExitLoopNo27


GotoNo28

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo29
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo29
 lda $C00D

 clc
 adc #10

 sta $CFFF

 tay
 lda #32

 sta ($00FB),y

 lda $C00D

 clc
 adc #1

 sta $CFFF

 sta $C00D

 jmp LoopNo27
ExitLoopNo27

 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


 lda #0
 sta $C006
 sta $C007
 sta $C008
 sta $C009
 sta $C00A
 sta $C00B


 lda #50
 sta $D008

 lda #50
 sta $D009

 lda #0

 sta $C00E
; THIS IS P1DEAD

 lda #0

 sta $C00F
; THIS IS P2DEAD

 lda #150
 sta $D000

 lda #200
 sta $D001

 lda #150
 sta $D00A

 lda #200
 sta $D00B

 lda #0

 sta $C010
; THIS IS S1TIME

 lda #0

 sta $C011
; THIS IS S2TIME

 lda #1
 sta $C01B
 lda #0
 sta $C01C
 lda #55
 sta $C01D
 lda #50
 sta $C01E
 lda #0
 sta $C01F
 lda #1
 sta $C020
 lda #100
 sta $C021
 lda #80
 sta $C022
 lda #1
 sta $C023
 lda #1
 sta $C024
 lda #150
 sta $C025
 lda #120
 sta $C026
; THIS IS BALLS

 lda #100

 sta $C012
; THIS IS SCORETIME

 lda #10

 sta $C013
; THIS IS MOVERESET

 lda #10

 sta $C014
; THIS IS MOVETIME

 lda #3

 sta $C015
; THIS IS SPEED

 lda #0

 sta $C016
; THIS IS STORAGE

 lda #0

 sta $C017
; THIS IS POINTER

 jmp EXITMOVEBALL
MOVEBALL

LoopNo30
 lda $C017
 sta $CFFE
 lda #12
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo31
 jmp GotoNo31
BranchNo31
 jmp ExitLoopNo30


GotoNo31

 ldx $C017
 lda $C01B,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo32
 jmp GotoNo32
BranchNo32
 lda $C017

 clc
 adc #2

 sta $CFFF

 tax
 lda $C01B,x

 clc
 adc $C015

 sta $CFFF

 tay
 lda $C017

 clc
 adc #2

 sta $CFFF

 tax
 tya
 sta $C01B,x


GotoNo32

 ldx $C017
 lda $C01B,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo33
 jmp GotoNo33
BranchNo33
 lda $C017

 clc
 adc #2

 sta $CFFF

 tax
 lda $C01B,x

 sec
 sbc $C015

 sta $CFFF

 tay
 lda $C017

 clc
 adc #2

 sta $CFFF

 tax
 tya
 sta $C01B,x


GotoNo33

 lda $C017

 clc
 adc #1

 sta $CFFF

 sta $C017

 ldx $C017
 lda $C01B,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo34
 jmp GotoNo34
BranchNo34
 lda $C017

 clc
 adc #2

 sta $CFFF

 tax
 lda $C01B,x

 clc
 adc $C015

 sta $CFFF

 tay
 lda $C017

 clc
 adc #2

 sta $CFFF

 tax
 tya
 sta $C01B,x


GotoNo34

 ldx $C017
 lda $C01B,x

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo35
 jmp GotoNo35
BranchNo35
 lda $C017

 clc
 adc #2

 sta $CFFF

 tax
 lda $C01B,x

 sec
 sbc $C015

 sta $CFFF

 tay
 lda $C017

 clc
 adc #2

 sta $CFFF

 tax
 tya
 sta $C01B,x


GotoNo35

 lda $C017

 clc
 adc #1

 sta $CFFF

 sta $C017

 ldx $C017
 lda $C01B,x

 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo36
 jmp GotoNo36
BranchNo36
 lda #1
 tay
 lda $C017

 sec
 sbc #2

 sta $CFFF

 tax
 tya
 sta $C01B,x


GotoNo36

 ldx $C017
 lda $C01B,x

 sta $CFFE
 lda #30
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo37
 jmp GotoNo37
BranchNo37
 lda #0
 tay
 lda $C017

 sec
 sbc #2

 sta $CFFF

 tax
 tya
 sta $C01B,x


GotoNo37

 lda $C017

 clc
 adc #1

 sta $CFFF

 sta $C017

 ldx $C017
 lda $C01B,x

 sta $CFFE
 lda #230
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo38
 jmp GotoNo38
BranchNo38
 lda #1
 tay
 lda $C017

 sec
 sbc #2

 sta $CFFF

 tax
 tya
 sta $C01B,x


GotoNo38

 ldx $C017
 lda $C01B,x

 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo39
 jmp GotoNo39
BranchNo39
 lda #0
 tay
 lda $C017

 sec
 sbc #2

 sta $CFFF

 tax
 tya
 sta $C01B,x


GotoNo39

 lda $C017

 clc
 adc #1

 sta $CFFF

 sta $C017

 jmp LoopNo30
ExitLoopNo30

 lda #0
 sta $C017

 rts
EXITMOVEBALL

LoopNo40
 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo41
 jmp GotoNo41
BranchNo41
 lda $C011

 sec
 sbc #1

 sta $CFFF

 sta $C011

GotoNo41

 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo42
 jmp GotoNo42
BranchNo42
 lda #%01000000
 sta $D40B


GotoNo42

 lda #%00000001
 bit $DC01
 beq BranchNo43
 jmp GotoNo43
BranchNo43
 lda $D001

 sec
 sbc #2

 sta $CFFF

 sta $D001

GotoNo43

 lda #%00000010
 bit $DC01
 beq BranchNo44
 jmp GotoNo44
BranchNo44
 lda $D001

 clc
 adc #2

 sta $CFFF

 sta $D001

GotoNo44

 lda #%00001000
 bit $DC01
 beq BranchNo45
 jmp GotoNo45
BranchNo45
 lda $D000

 clc
 adc #2

 sta $CFFF

 sta $D000

 lda #192
 sta $7F8

GotoNo45

 lda #%00000100
 bit $DC01
 beq BranchNo46
 jmp GotoNo46
BranchNo46
 lda $D000

 sec
 sbc #2

 sta $CFFF

 sta $D000

 lda #195
 sta $7F8

GotoNo46

 lda $C00E
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo47
 jmp GotoNo47
BranchNo47
 lda $D000
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo48
 jmp GotoNo48
BranchNo48
 lda #240
 sta $D000

GotoNo48

 lda $D000
 sta $CFFE
 lda #30
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo49
 jmp GotoNo49
BranchNo49
 lda #30
 sta $D000

GotoNo49

 lda $D001
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo50
 jmp GotoNo50
BranchNo50
 lda #220
 sta $D001

GotoNo50

 lda $D001
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo51
 jmp GotoNo51
BranchNo51
 lda #50
 sta $D001

GotoNo51

GotoNo47

 lda #%00000001
 bit $DC00
 beq BranchNo52
 jmp GotoNo52
BranchNo52
 lda $D00B

 sec
 sbc #2

 sta $CFFF

 sta $D00B

GotoNo52

 lda #%00000010
 bit $DC00
 beq BranchNo53
 jmp GotoNo53
BranchNo53
 lda $D00B

 clc
 adc #2

 sta $CFFF

 sta $D00B

GotoNo53

 lda #%00001000
 bit $DC00
 beq BranchNo54
 jmp GotoNo54
BranchNo54
 lda $D00A

 clc
 adc #2

 sta $CFFF

 sta $D00A

 lda #192
 sta $7FD

GotoNo54

 lda #%00000100
 bit $DC00
 beq BranchNo55
 jmp GotoNo55
BranchNo55
 lda $D00A

 sec
 sbc #2

 sta $CFFF

 sta $D00A

 lda #195
 sta $7FD

GotoNo55

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo56
 jmp GotoNo56
BranchNo56
 lda $D00A
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo57
 jmp GotoNo57
BranchNo57
 lda #240
 sta $D00A

GotoNo57

 lda $D00A
 sta $CFFE
 lda #30
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo58
 jmp GotoNo58
BranchNo58
 lda #30
 sta $D00A

GotoNo58

 lda $D00B
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo59
 jmp GotoNo59
BranchNo59
 lda #220
 sta $D00B

GotoNo59

 lda $D00B
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo60
 jmp GotoNo60
BranchNo60
 lda #50
 sta $D00B

GotoNo60

GotoNo56

 lda #0
 sta $CFFE
 lda $C014
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo61
 jmp GotoNo61
BranchNo61
 lda $C014

 sec
 sbc #1

 sta $CFFF

 sta $C014

 lda #0
 sta $CFFE
 lda $C014
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo62
 jmp GotoNo62
BranchNo62
 jsr MOVEBALL



 lda $C013
 sta $C014

GotoNo62

GotoNo61

 ldx #2
 lda $C01B,x

 sta $D002

 ldx #3
 lda $C01B,x

 sta $D003

 ldx #6
 lda $C01B,x

 sta $D004

 ldx #7
 lda $C01B,x

 sta $D005

 ldx #10
 lda $C01B,x

 sta $D006

 ldx #11
 lda $C01B,x

 sta $D007

 lda #10
 sta $03F2
 lda #10
 sta $03F3
 lda #5
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D002
 sta $033D
 lda $D003
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D002
 sta $033C
 lda $D003
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo63
 jmp GotoNo63
BranchNo63
 lda #1
 sta $C00E

GotoNo63

 lda #10
 sta $03F2
 lda #10
 sta $03F3
 lda #5
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D004
 sta $033D
 lda $D005
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D004
 sta $033C
 lda $D005
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo64
 jmp GotoNo64
BranchNo64
 lda #1
 sta $C00E

GotoNo64

 lda #10
 sta $03F2
 lda #10
 sta $03F3
 lda #5
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D006
 sta $033D
 lda $D007
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D006
 sta $033C
 lda $D007
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo65
 jmp GotoNo65
BranchNo65
 lda #1
 sta $C00E

GotoNo65

 lda #10
 sta $03F2
 lda #10
 sta $03F3
 lda #5
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D00A
 sta $033C
 lda $D00B
 sta $033E
 lda $D002
 sta $033D
 lda $D003
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D002
 sta $033C
 lda $D003
 sta $033E
 lda $D00A
 sta $033D
 lda $D00B
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo66
 jmp GotoNo66
BranchNo66
 lda #1
 sta $C00F

GotoNo66

 lda #10
 sta $03F2
 lda #10
 sta $03F3
 lda #5
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D00A
 sta $033C
 lda $D00B
 sta $033E
 lda $D004
 sta $033D
 lda $D005
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D004
 sta $033C
 lda $D005
 sta $033E
 lda $D00A
 sta $033D
 lda $D00B
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo67
 jmp GotoNo67
BranchNo67
 lda #1
 sta $C00F

GotoNo67

 lda #10
 sta $03F2
 lda #10
 sta $03F3
 lda #5
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D00A
 sta $033C
 lda $D00B
 sta $033E
 lda $D006
 sta $033D
 lda $D007
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D006
 sta $033C
 lda $D007
 sta $033E
 lda $D00A
 sta $033D
 lda $D00B
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo68
 jmp GotoNo68
BranchNo68
 lda #1
 sta $C00F

GotoNo68

 lda $C00E
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo69
 jmp GotoNo69
BranchNo69
 lda #0
 sta $D000

 lda #0
 sta $D001

GotoNo69

 lda $C00F
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo70
 jmp GotoNo70
BranchNo70
 lda #0
 sta $D00A

 lda #0
 sta $D00B

GotoNo70

 lda $C00E

 clc
 adc $C00F

 sta $CFFF

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo71
 jmp GotoNo71
BranchNo71
 jmp GAMEOVER

GotoNo71

 lda #10
 sta $03F2
 lda #15
 sta $03F3
 lda #8
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D008
 sta $033D
 lda $D009
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D008
 sta $033C
 lda $D009
 sta $033E
 lda $D000
 sta $033D
 lda $D001
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo72
 jmp GotoNo72
BranchNo72
 lda #5
 sta $C011

 lda #%01000001
 sta $D40B


 ldx #25
PointLoopNo72
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo72

 lda $D41B
 sta $C016

 lda $C016
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo74
 jmp GotoNo74
BranchNo74
 lda #200
 sta $C016

GotoNo74

 lda $C016
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo75
 jmp GotoNo75
BranchNo75
 lda #50
 sta $C016

GotoNo75

 lda $C016
 sta $D008

 lda $D41B
 sta $C016

 lda $C016
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo76
 jmp GotoNo76
BranchNo76
 lda #200
 sta $C016

GotoNo76

 lda $C016
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo77
 jmp GotoNo77
BranchNo77
 lda #50
 sta $C016

GotoNo77

 lda $C016
 sta $D009

GotoNo72

 lda #10
 sta $03F2
 lda #15
 sta $03F3
 lda #8
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D00A
 sta $033C
 lda $D00B
 sta $033E
 lda $D008
 sta $033D
 lda $D009
 sta $033F
 jsr FullCollision
 ldx $03F0
 ldy $03F2
 sty $03F0
 stx $03F2
 ldx $03F1
 ldy $03F3
 sty $03F1
 stx $03F3
 lda $D008
 sta $033C
 lda $D009
 sta $033E
 lda $D00A
 sta $033D
 lda $D00B
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo78
 jmp GotoNo78
BranchNo78
 lda #5
 sta $C011

 lda #%01000001
 sta $D40B


 ldx #25
PointLoopNo78
 jsr AddPoint2
 dex
 cpx #0
 bne PointLoopNo78

 lda $D41B
 sta $C016

 lda $C016
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo80
 jmp GotoNo80
BranchNo80
 lda #200
 sta $C016

GotoNo80

 lda $C016
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo81
 jmp GotoNo81
BranchNo81
 lda #50
 sta $C016

GotoNo81

 lda $C016
 sta $D008

 lda $D41B
 sta $C016

 lda $C016
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo82
 jmp GotoNo82
BranchNo82
 lda #200
 sta $C016

GotoNo82

 lda $C016
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo83
 jmp GotoNo83
BranchNo83
 lda #50
 sta $C016

GotoNo83

 lda $C016
 sta $D009

GotoNo78

 lda #0
 sta $CFFE
 lda $C012
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo84
 jmp GotoNo84
BranchNo84
 lda $C012

 sec
 sbc #1

 sta $CFFF

 sta $C012

 lda #0
 sta $CFFE
 lda $C012
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo85
 jmp GotoNo85
BranchNo85
 lda #100
 sta $C012

 lda #1
 sta $CFFE
 lda $C013
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo86
 jmp GotoNo86
BranchNo86
 lda $C013

 sec
 sbc #1

 sta $CFFF

 sta $C013

GotoNo86

GotoNo85

GotoNo84

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo40
ExitLoopNo40

GAMEOVER

 lda #%01000000
 sta $D40B


 lda #15
 sta $C010

 lda #%10000001
 sta $D404


 lda #0

 sta $C018
; THIS IS CURSOR

 lda #71
 sta $C027
 lda #65
 sta $C028
 lda #77
 sta $C029
 lda #69
 sta $C02A
 lda #96
 sta $C02B
 lda #79
 sta $C02C
 lda #86
 sta $C02D
 lda #69
 sta $C02E
 lda #82
 sta $C02F
 lda #0
 sta $C030
; THIS IS MESSAGE

LoopNo87
 ldx $C018
 lda $C027,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo88
 jmp GotoNo88
BranchNo88
 jmp ExitLoopNo87


GotoNo88

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo89
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo89
 lda $C018

 clc
 adc #10

 sta $CFFF

 tay
 ldx $C018
 lda $C027,x

 sec
 sbc #64

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo90 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo90
 lda $C018

 clc
 adc #10

 sta $CFFF

 tay
 lda #1

 sta ($00FB),y

 lda $C018

 clc
 adc #1

 sta $CFFF

 sta $C018

 jmp LoopNo87
ExitLoopNo87

LoopNo91
 lda $C010
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo92
 jmp GotoNo92
BranchNo92
 lda $C010

 sec
 sbc #1

 sta $CFFF

 sta $C010

GotoNo92

 lda $C010
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo93
 jmp GotoNo93
BranchNo93
 lda #%10000000
 sta $D404


GotoNo93

 lda #%00010000
 bit $DC01
 beq BranchNo94
 jmp GotoNo94
BranchNo94
 lda #%10000000
 sta $D404


 jmp RESET

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE
;$C00E IS NOW FREE
;$C00F IS NOW FREE
;$C010 IS NOW FREE
;$C011 IS NOW FREE
;$C01B IS NOW FREE
;$C012 IS NOW FREE
;$C013 IS NOW FREE
;$C014 IS NOW FREE
;$C015 IS NOW FREE
;$C016 IS NOW FREE
;$C017 IS NOW FREE
;$C018 IS NOW FREE
;$C027 IS NOW FREE

GotoNo94

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo91
ExitLoopNo91


Wait1
 lda $d011
 bmi Wait1
Wait2
 lda $d012
Wait3
 cmp $d012
 beq Wait3
 lda $d011
 bpl Wait2
 rts


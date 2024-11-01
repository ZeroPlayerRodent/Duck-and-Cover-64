
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
 byte #4,#0,#0
 byte #24,#0,#0
 byte #52,#0,#0
 byte #63,#0,#0
 byte #60,#0,#0
 byte #255,#0,#0
 byte #126,#0,#0
 byte #60,#0,#0
 byte #36,#0,#0
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
 byte #4,#0,#0
 byte #24,#0,#0
 byte #52,#0,#0
 byte #63,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #126,#0,#0
 byte #255,#0,#0
 byte #36,#0,#0
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
 sta $3040,x
 inx
 cpx #$3F
 bne LoadDataNo1

 ldx #0
 jmp LoadDataNo2
SpriteDataNo2
 byte #32,#0,#0
 byte #24,#0,#0
 byte #44,#0,#0
 byte #252,#0,#0
 byte #60,#0,#0
 byte #255,#0,#0
 byte #126,#0,#0
 byte #60,#0,#0
 byte #36,#0,#0
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
 sta $3080,x
 inx
 cpx #$3F
 bne LoadDataNo2

 ldx #0
 jmp LoadDataNo3
SpriteDataNo3
 byte #32,#0,#0
 byte #24,#0,#0
 byte #44,#0,#0
 byte #252,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #126,#0,#0
 byte #255,#0,#0
 byte #36,#0,#0
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
 sta $30C0,x
 inx
 cpx #$3F
 bne LoadDataNo3

 ldx #0
 jmp LoadDataNo4
SpriteDataNo4
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
LoadDataNo4
 lda SpriteDataNo4,x
 sta $31C0,x
 inx
 cpx #$3F
 bne LoadDataNo4

 lda #0
 sta $D021

 lda #12
 sta $D020

 lda #1

 sta $C00C
; THIS IS LINE

 lda #1

 sta $C00D
; THIS IS LINE2

LoopNo6
 lda $C00C
 sta $CFFE
 lda #23
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo7
 jmp GotoNo7
BranchNo7
 jmp ExitLoopNo6


GotoNo7

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00C
CompLoopNo8
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo8
 ldy #30
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00C
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
 ldy #30
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

 jmp LoopNo6
ExitLoopNo6

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
 ldy #31
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
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
 ldy #32
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
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
 ldy #33
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
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
 ldy #34
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
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
 ldy #35
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
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
 ldy #36
 lda #7

 sta ($00FB),y

 lda #1
 sta $C00C

LoopNo16
 lda $C00D
 sta $CFFE
 lda #15
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo17
 jmp GotoNo17
BranchNo17
 jmp ExitLoopNo16


GotoNo17

LoopNo18
 lda $C00C
 sta $CFFE
 lda #29
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo19
 jmp GotoNo19
BranchNo19
 jmp ExitLoopNo18


GotoNo19

 lda $D41B
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo20
 jmp GotoNo20
BranchNo20
 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00D
CompLoopNo21
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo21
 ldy $C00C
 lda #46

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00D
CompLoopNo22 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo22
 ldy $C00C
 lda #1

 sta ($00FB),y

GotoNo20

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

 jmp LoopNo18
ExitLoopNo18

 lda #1
 sta $C00C

 lda $C00D

 clc
 adc #1

 sta $CFFF

 sta $C00D

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE

 jmp LoopNo16
ExitLoopNo16

 lda #1
 sta $C00C

LoopNo23
 lda $C00C
 sta $CFFE
 lda #29
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo24
 jmp GotoNo24
BranchNo24
 jmp ExitLoopNo23


GotoNo24

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #23
CompLoopNo25
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo25
 ldy $C00C
 lda #160

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #23
CompLoopNo26 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo26
 ldy $C00C
 lda #5

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #22
CompLoopNo27
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo27
 ldy $C00C
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #22
CompLoopNo28 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo28
 ldy $C00C
 lda #5

 sta ($00FB),y

 lda $D41B
 sta $CFFE
 lda #125
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo29
 jmp GotoNo29
BranchNo29
 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #21
CompLoopNo30
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo30
 ldy $C00C
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #21
CompLoopNo31 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo31
 ldy $C00C
 lda #5

 sta ($00FB),y

GotoNo29

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo23
ExitLoopNo23

 lda #0

 sta $C00D
; THIS IS CURSOR

 lda #68
 sta $C00E
 lda #85
 sta $C00F
 lda #67
 sta $C010
 lda #75
 sta $C011
 lda #96
 sta $C012
 lda #65
 sta $C013
 lda #78
 sta $C014
 lda #68
 sta $C015
 lda #96
 sta $C016
 lda #67
 sta $C017
 lda #79
 sta $C018
 lda #86
 sta $C019
 lda #69
 sta $C01A
 lda #82
 sta $C01B
 lda #0
 sta $C01C
; THIS IS TITLE

LoopNo32
 ldx $C00D
 lda $C00E,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo33
 jmp GotoNo33
BranchNo33
 jmp ExitLoopNo32


GotoNo33

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo34
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo34
 lda $C00D

 clc
 adc #8

 sta $CFFF

 tay
 ldx $C00D
 lda $C00E,x

;GARBAGE COLLECTION COMPLETE
;$C00E IS NOW FREE

 sec
 sbc #64

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo35 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo35
 lda $C00D

 clc
 adc #8

 sta $CFFF

 tay
 lda #1

 sta ($00FB),y

 lda $C00D

 clc
 adc #1

 sta $CFFF

 sta $C00D

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE

 jmp LoopNo32
ExitLoopNo32

 lda #0

 sta $C00C
; THIS IS MODS

 lda #0

 sta $C00E
; THIS IS HARDMODE

 lda #0

 sta $C00F
; THIS IS HARDBOUNCE

 lda #0

 sta $C010
; THIS IS DEBOUNCE

 lda #0

 sta $C011
; THIS IS DEBOUNCE2

 lda #0

 sta $C012
; THIS IS MODBOUNCE

 lda #50

 sta $C013
; THIS IS HOLDRESET

 lda #0

 sta $C014
; THIS IS MULTIPLAYER

 lda #0

 sta $C015
; THIS IS VERSUS

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


 lda #3

 sta $C016
; THIS IS LIVES

 jmp EXITDISPLAYMODE
DISPLAYMODE

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo36 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo36
 ldy #31
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo37 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo37
 ldy #32
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo38 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo38
 ldy #33
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo39 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo39
 ldy #34
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo40 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo40
 ldy #35
 lda #0

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo41 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo41
 ldy #36
 lda #0

 sta ($00FB),y

 lda $C015
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo42
 jmp GotoNo42
BranchNo42
 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo43 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo43
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo44 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo44
 ldy #32
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo45 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo45
 ldy #33
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo46 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo46
 ldy #34
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo47 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo47
 ldy #35
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
CompLoopNo48 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo48
 ldy #36
 lda #1

 sta ($00FB),y

GotoNo42

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo49
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo49
 ldy #31
 lda #13

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo50
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo50
 ldy #33
 lda #48

 clc
 adc $C00C

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo51
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo51
 ldy #32
 lda #48

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo52
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo52
 ldy #34
 lda #32

 sta ($00FB),y

 lda $C00E
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo53
 jmp GotoNo53
BranchNo53
 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo54
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo54
 ldy #34
 lda #43

 sta ($00FB),y

GotoNo53

 lda $C00C
 sta $CFFE
 lda #9
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo55
 jmp GotoNo55
BranchNo55
 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo56
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo56
 ldy #33
 lda $C00C

 sec
 sbc #10

 sta $CFFF

 clc
 adc #48

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo57
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo57
 ldy #32
 lda #48

 clc
 adc #1

 sta $CFFF


 sta ($00FB),y

GotoNo55

 lda $C00C
 sta $CFFE
 lda #19
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo58
 jmp GotoNo58
BranchNo58
 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo59
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo59
 ldy #33
 lda $C00C

 sec
 sbc #20

 sta $CFFF

 clc
 adc #48

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo60
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo60
 ldy #32
 lda #48

 clc
 adc #2

 sta $CFFF


 sta ($00FB),y

GotoNo58

 lda $C00C
 sta $CFFE
 lda #29
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo61
 jmp GotoNo61
BranchNo61
 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo62
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo62
 ldy #33
 lda $C00C

 sec
 sbc #30

 sta $CFFF

 clc
 adc #48

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #6
CompLoopNo63
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo63
 ldy #32
 lda #48

 clc
 adc #3

 sta $CFFF


 sta ($00FB),y

GotoNo61

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #10
CompLoopNo64
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo64
 ldy #31
 lda #16

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #10
CompLoopNo65
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo65
 ldy #32
 lda $C014

 clc
 adc #1

 sta $CFFF

 clc
 adc #48

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #14
CompLoopNo66
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo66
 ldy #31
 lda #12

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #14
CompLoopNo67
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo67
 ldy #32
 lda #48

 clc
 adc $C016

 sta $CFFF


 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #6
CompLoopNo68 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo68
 ldy #33
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #6
CompLoopNo69 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo69
 ldy #32
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #6
CompLoopNo70 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo70
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #6
CompLoopNo71 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo71
 ldy #34
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #8
CompLoopNo72 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo72
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #8
CompLoopNo73 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo73
 ldy #32
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #10
CompLoopNo74 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo74
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #10
CompLoopNo75 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo75
 ldy #32
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #14
CompLoopNo76 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo76
 ldy #31
 lda #1

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #14
CompLoopNo77 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo77
 ldy #32
 lda #1

 sta ($00FB),y

 rts
EXITDISPLAYMODE

 jmp EXITCHANGEMODS
CHANGEMODS

 lda #%00000001
 bit $DC01
 beq BranchNo78
 jmp GotoNo78
BranchNo78
 lda $C012
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo79
 jmp GotoNo79
BranchNo79
 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

 lda $C00C
 sta $CFFE
 lda #31
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo80
 jmp GotoNo80
BranchNo80
 lda #0
 sta $C00C

GotoNo80

 jsr DISPLAYMODE



GotoNo79

 lda #1
 sta $C012

 jmp NOTBOUNCE

GotoNo78

 lda #0
 sta $C012

NOTBOUNCE

 lda #%00000010
 bit $DC01
 beq BranchNo81
 jmp GotoNo81
BranchNo81
 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo82
 jmp GotoNo82
BranchNo82
 lda $C00E

 clc
 adc #1

 sta $CFFF

 sta $C00E

 lda $C00E
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo83
 jmp GotoNo83
BranchNo83
 lda #0
 sta $C00E

GotoNo83

 jsr DISPLAYMODE



GotoNo82

 lda #1
 sta $C00F

 jmp NOHARDBOUNCE

GotoNo81

 lda #0
 sta $C00F

NOHARDBOUNCE

 lda #%00010000
 bit $DC00
 beq BranchNo84
 jmp GotoNo84
BranchNo84
 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo85
 jmp GotoNo85
BranchNo85
 lda $C015
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo86
 jmp GotoNo86
BranchNo86
 jmp DONESETVERSUS

GotoNo86

 lda $C014
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo87
 jmp GotoNo87
BranchNo87
 lda #1
 sta $C015

 jmp DONESETMULT

GotoNo87

DONESETVERSUS

 lda $C014

 clc
 adc #1

 sta $CFFF

 sta $C014

 lda $C014
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo88
 jmp GotoNo88
BranchNo88
 lda #0
 sta $C014

 lda #0
 sta $C015

GotoNo88

DONESETMULT

 jsr DISPLAYMODE



GotoNo85

 lda #1
 sta $C011

 jmp NOTBOUNCE2

GotoNo84

 lda #0
 sta $C011

NOTBOUNCE2

 rts
EXITCHANGEMODS

 jsr DISPLAYMODE



LoopNo89
 lda #%00010000
 bit $DC01
 beq BranchNo90
 jmp GotoNo90
BranchNo90
 jmp RESETGAME

GotoNo90

 jsr CHANGEMODS



 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo89
ExitLoopNo89

RESETGAME

 lda #0
 sta $C006
 sta $C007
 sta $C008
 sta $C009
 sta $C00A
 sta $C00B


 lda #0
 sta $C000
 sta $C001
 sta $C002
 sta $C003
 sta $C004
 sta $C005


 lda #3
 sta $C016

SOFTRESTART

 ldx #0
 jmp LoadDataNo90
SpriteDataNo90
 byte #60,#0,#0
 byte #255,#0,#0
 byte #255,#0,#0
 byte #126,#0,#0
 byte #126,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #24,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo90
 lda SpriteDataNo90,x
 sta $3100,x
 inx
 cpx #$3F
 bne LoadDataNo90

 ldx #0
 jmp LoadDataNo91
SpriteDataNo91
 byte #31,#248,#0
 byte #127,#254,#0
 byte #255,#255,#0
 byte #255,#255,#0
 byte #127,#254,#0
 byte #31,#248,#0
 byte #7,#224,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #127,#254,#0
 byte #131,#193,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo91
 lda SpriteDataNo91,x
 sta $3140,x
 inx
 cpx #$3F
 bne LoadDataNo91

 ldx #0
 jmp LoadDataNo92
SpriteDataNo92
 byte #131,#193,#0
 byte #127,#254,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #31,#248,#0
 byte #127,#254,#0
 byte #255,#255,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo92
 lda SpriteDataNo92,x
 sta $3180,x
 inx
 cpx #$3F
 bne LoadDataNo92

 lda #20

 sta $C017
; THIS IS MISSILELENGTH

 lda #60

 sta $C018
; THIS IS BOOMLENGTH

 lda $C00C
 sta $CFFE
 lda #4
 and $CFFE

 sta $CFFE
 lda #4
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo94
 jmp GotoNo94
BranchNo94
 ldx #0
 jmp LoadDataNo94
SpriteDataNo94
 byte #60,#0,#0
 byte #255,#0,#0
 byte #255,#0,#0
 byte #126,#0,#0
 byte #126,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #60,#0,#0
 byte #24,#0,#0
 byte #0,#0,#0
LoadDataNo94
 lda SpriteDataNo94,x
 sta $3100,x
 inx
 cpx #$3F
 bne LoadDataNo94

 ldx #0
 jmp LoadDataNo95
SpriteDataNo95
 byte #31,#248,#0
 byte #127,#254,#0
 byte #255,#255,#0
 byte #255,#255,#0
 byte #127,#254,#0
 byte #31,#248,#0
 byte #7,#224,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #127,#254,#0
 byte #131,#193,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo95
 lda SpriteDataNo95,x
 sta $3140,x
 inx
 cpx #$3F
 bne LoadDataNo95

 ldx #0
 jmp LoadDataNo96
SpriteDataNo96
 byte #131,#193,#0
 byte #127,#254,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #3,#192,#0
 byte #31,#248,#0
 byte #127,#254,#0
 byte #255,#255,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
 byte #0,#0,#0
LoadDataNo96
 lda SpriteDataNo96,x
 sta $3180,x
 inx
 cpx #$3F
 bne LoadDataNo96

 lda #35
 sta $C017

 lda #60
 sta $C018

GotoNo94

 jsr DISPLAYMODE



 lda #0
 sta $D006

 lda #0
 sta $D007

 lda #0
 sta $D008

 lda #0
 sta $D009

 lda #0
 sta $D00A

 lda #0
 sta $D00B

 lda #0
 sta $D00C

 lda #0
 sta $D00D

 lda #125
 sta $D00E

 lda #80
 sta $D00F

 lda #198
 sta $7FB

 lda #197
 sta $7FC

 lda #198
 sta $7FD

 lda #197
 sta $7FE

 lda #199
 sta $7FF

 lda #2
 sta $D02A

 lda #2
 sta $D02B

 lda #2
 sta $D02C

 lda #2
 sta $D02D

 lda #8
 sta $D02E

 lda #196
 sta $7F9

 lda #196
 sta $7FA

 lda #12
 sta $D028

 lda #12
 sta $D029

 lda #100
 sta $D002

 lda #0
 sta $D003

 lda #150
 sta $D004

 lda #0
 sta $D005

 lda #192
 sta $7F8

 lda #7
 sta $D027

 lda #100
 sta $D000

 lda #100
 sta $D001

 lda #0

 sta $C019
; THIS IS DUCK

 lda #0

 sta $C01A
; THIS IS DIR

 lda #0

 sta $C01B
; THIS IS FLAP

 lda #0

 sta $C01C
; THIS IS DIR2

 lda #0

 sta $C00D
; THIS IS FLAP2

 lda #100

 sta $C01D
; THIS IS PX

 lda #210

 sta $C01E
; THIS IS PY

 lda #150

 sta $C01F
; THIS IS PX2

 lda #210

 sta $C020
; THIS IS PY2

 lda #2

 sta $C021
; THIS IS ALIVEPLAYERS

 jmp EXITRENDERDUCKS
RENDERDUCKS

 lda $C021
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo98
 jmp GotoNo98
BranchNo98
 lda $C019

 clc
 adc #1

 sta $CFFF

 sta $C019

GotoNo98

 lda $C019
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo99
 jmp GotoNo99
BranchNo99
 lda #0
 sta $C019

GotoNo99

 lda $C014
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo100
 jmp GotoNo100
BranchNo100
 lda #0
 sta $C019

GotoNo100

 lda $C019
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo101
 jmp GotoNo101
BranchNo101
 lda #7
 sta $D027

 lda $C01D
 sta $D000

 lda $C01E
 sta $D001

 lda #0
 sta $CFFE
 lda $C01A
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo102
 jmp GotoNo102
BranchNo102
 lda #194
 sta $7F8

 lda $C01B
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo103
 jmp GotoNo103
BranchNo103
 lda #195
 sta $7F8

GotoNo103

GotoNo102

 lda #1
 sta $CFFE
 lda $C01A
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo104
 jmp GotoNo104
BranchNo104
 lda #192
 sta $7F8

 lda $C01B
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo105
 jmp GotoNo105
BranchNo105
 lda #193
 sta $7F8

GotoNo105

GotoNo104

GotoNo101

 lda $C019
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo106
 jmp GotoNo106
BranchNo106
 lda #1
 sta $D027

 lda $C01F
 sta $D000

 lda $C020
 sta $D001

 lda #0
 sta $CFFE
 lda $C01C
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo107
 jmp GotoNo107
BranchNo107
 lda #194
 sta $7F8

 lda $C00D
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo108
 jmp GotoNo108
BranchNo108
 lda #195
 sta $7F8

GotoNo108

GotoNo107

 lda #1
 sta $CFFE
 lda $C01C
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo109
 jmp GotoNo109
BranchNo109
 lda #192
 sta $7F8

 lda $C00D
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo110
 jmp GotoNo110
BranchNo110
 lda #193
 sta $7F8

GotoNo110

GotoNo109

GotoNo106

 rts
EXITRENDERDUCKS

 lda #0

 sta $C022
; THIS IS WRAP

 lda $C00C
 sta $CFFE
 lda #16
 and $CFFE

 sta $CFFE
 lda #16
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo111
 jmp GotoNo111
BranchNo111
 lda #1
 sta $C022

GotoNo111

 lda #2

 sta $C023
; THIS IS DUCKSPEED

 lda $C00C
 sta $CFFE
 lda #2
 and $CFFE

 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo112
 jmp GotoNo112
BranchNo112
 lda #4
 sta $C023

GotoNo112

 lda #1

 sta $C024
; THIS IS DUCKGRAVITY

 lda #0

 sta $C025
; THIS IS DUCKMOV

 lda #10

 sta $C026
; THIS IS GRAVTIME

 lda #0

 sta $C027
; THIS IS DUCKMOV2

 lda #10

 sta $C028
; THIS IS GRAVTIME2

 lda #4

 sta $C029
; THIS IS DUCKJUMP

 lda $C00C
 sta $CFFE
 lda #1
 and $CFFE

 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo113
 jmp GotoNo113
BranchNo113
 lda #8
 sta $C029

GotoNo113

 lda #0

 sta $C02A
; THIS IS JUMPTIME

 lda #0

 sta $C02B
; THIS IS JUMPTIME2

 jmp EXITMOVEDUCKS
MOVEDUCKS

 lda $C026
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo114
 jmp GotoNo114
BranchNo114
 lda $C026

 sec
 sbc #1

 sta $CFFF

 sta $C026

GotoNo114

 lda $C026
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo115
 jmp GotoNo115
BranchNo115
 lda $C025
 sta $CFFE
 lda #8
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo116
 jmp GotoNo116
BranchNo116
 lda $C024

 clc
 adc $C025

 sta $CFFF

 sta $C025

GotoNo116

 lda #10
 sta $C026

GotoNo115

 lda $C028
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo117
 jmp GotoNo117
BranchNo117
 lda $C028

 sec
 sbc #1

 sta $CFFF

 sta $C028

GotoNo117

 lda $C028
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo118
 jmp GotoNo118
BranchNo118
 lda $C027
 sta $CFFE
 lda #8
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo119
 jmp GotoNo119
BranchNo119
 lda $C024

 clc
 adc $C027

 sta $CFFF

 sta $C027

GotoNo119

 lda #10
 sta $C028

GotoNo118

 lda #%00001000
 bit $DC01
 beq BranchNo120
 jmp GotoNo120
BranchNo120
 lda #1
 sta $C01A

 lda $C01D

 clc
 adc $C023

 sta $CFFF

 sta $C01D

 lda $C01D
 sta $CFFE
 lda #250
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo121
 jmp GotoNo121
BranchNo121
 lda #250
 sta $C01D

 lda $C022
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo122
 jmp GotoNo122
BranchNo122
 lda #30
 sta $C01D

GotoNo122

GotoNo121

GotoNo120

 lda #%00000100
 bit $DC01
 beq BranchNo123
 jmp GotoNo123
BranchNo123
 lda #0
 sta $C01A

 lda $C01D

 sec
 sbc $C023

 sta $CFFF

 sta $C01D

 lda $C01D
 sta $CFFE
 lda #30
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo124
 jmp GotoNo124
BranchNo124
 lda #30
 sta $C01D

 lda $C022
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo125
 jmp GotoNo125
BranchNo125
 lda #250
 sta $C01D

GotoNo125

GotoNo124

GotoNo123

 lda #%00010000
 bit $DC01
 beq BranchNo126
 jmp GotoNo126
BranchNo126
 lda #1
 sta $C01B

 lda $C010
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo127
 jmp GotoNo127
BranchNo127
 lda #1
 sta $C025

 lda #10
 sta $C026

 lda #12
 sta $C02A

GotoNo127

 lda #1
 sta $C010

 jmp DONEFLAP

GotoNo126

 lda #0
 sta $C01B

 lda #0
 sta $C010

DONEFLAP

 lda $C02A
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo128
 jmp GotoNo128
BranchNo128
 lda $C02A

 sec
 sbc #1

 sta $CFFF

 sta $C02A

 lda $C01E
 sta $CFFE
 lda #40
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo129
 jmp GotoNo129
BranchNo129
 lda $C01E

 sec
 sbc $C029

 sta $CFFF

 sta $C01E

GotoNo129

GotoNo128

 lda #%00001000
 bit $DC00
 beq BranchNo130
 jmp GotoNo130
BranchNo130
 lda #1
 sta $C01C

 lda $C01F

 clc
 adc $C023

 sta $CFFF

 sta $C01F

 lda $C01F
 sta $CFFE
 lda #250
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo131
 jmp GotoNo131
BranchNo131
 lda #250
 sta $C01F

 lda $C022
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo132
 jmp GotoNo132
BranchNo132
 lda #30
 sta $C01F

GotoNo132

GotoNo131

GotoNo130

 lda #%00000100
 bit $DC00
 beq BranchNo133
 jmp GotoNo133
BranchNo133
 lda #0
 sta $C01C

 lda $C01F

 sec
 sbc $C023

 sta $CFFF

 sta $C01F

 lda $C01F
 sta $CFFE
 lda #30
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo134
 jmp GotoNo134
BranchNo134
 lda #30
 sta $C01F

 lda $C022
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo135
 jmp GotoNo135
BranchNo135
 lda #250
 sta $C01F

GotoNo135

GotoNo134

GotoNo133

 lda #%00010000
 bit $DC00
 beq BranchNo136
 jmp GotoNo136
BranchNo136
 lda #1
 sta $C00D

 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo137
 jmp GotoNo137
BranchNo137
 lda #1
 sta $C027

 lda #10
 sta $C028

 lda #12
 sta $C02B

GotoNo137

 lda #1
 sta $C011

 jmp DONEFLAP2

GotoNo136

 lda #0
 sta $C00D

 lda #0
 sta $C011

DONEFLAP2

 lda $C02B
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo138
 jmp GotoNo138
BranchNo138
 lda $C02B

 sec
 sbc #1

 sta $CFFF

 sta $C02B

 lda $C020
 sta $CFFE
 lda #40
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo139
 jmp GotoNo139
BranchNo139
 lda $C020

 sec
 sbc $C029

 sta $CFFF

 sta $C020

GotoNo139

GotoNo138

 lda $C01E
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo140
 jmp GotoNo140
BranchNo140
 lda $C01E

 clc
 adc $C025

 sta $CFFF

 sta $C01E

GotoNo140

 lda $C01E
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo141
 jmp GotoNo141
BranchNo141
 lda #220
 sta $C01E

GotoNo141

 lda $C020
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo142
 jmp GotoNo142
BranchNo142
 lda $C020

 clc
 adc $C027

 sta $CFFF

 sta $C020

GotoNo142

 lda $C020
 sta $CFFE
 lda #220
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo143
 jmp GotoNo143
BranchNo143
 lda #220
 sta $C020

GotoNo143

 rts
EXITMOVEDUCKS

 lda #10

 sta $C02C
; THIS IS MOVETIME

 lda #10

 sta $C02D
; THIS IS MOVERESET

 lda $C00E
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo144
 jmp GotoNo144
BranchNo144
 lda #5
 sta $C02C

 lda #5
 sta $C02D

GotoNo144

 lda #0

 sta $C02E
; THIS IS SOUNDTIME

 lda #210

 sta $C02F
; THIS IS TOP1

 lda #182

 sta $C030
; THIS IS TOP2

 lda $C00C
 sta $CFFE
 lda #4
 and $CFFE

 sta $CFFE
 lda #4
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo145
 jmp GotoNo145
BranchNo145
 lda #208
 sta $C02F

 lda #167
 sta $C030

GotoNo145

 jmp EXITMOVEMISSILES
MOVEMISSILES

 lda $C02C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo146
 jmp GotoNo146
BranchNo146
 lda $C02C

 sec
 sbc #1

 sta $CFFF

 sta $C02C

GotoNo146

 lda $D007
 sta $CFFE
 lda $C02F
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo147
 jmp GotoNo147
BranchNo147
 lda $D007

 sec
 sbc #4

 sta $CFFF

 sta $D007

GotoNo147

 lda $D009
 sta $CFFE
 lda $C030
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo148
 jmp GotoNo148
BranchNo148
 lda $D009

 sec
 sbc #4

 sta $CFFF

 sta $D009

GotoNo148

 lda $D00B
 sta $CFFE
 lda $C02F
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo149
 jmp GotoNo149
BranchNo149
 lda $D00B

 sec
 sbc #4

 sta $CFFF

 sta $D00B

GotoNo149

 lda $D00D
 sta $CFFE
 lda $C030
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo150
 jmp GotoNo150
BranchNo150
 lda $D00D

 sec
 sbc #4

 sta $CFFF

 sta $D00D

GotoNo150

 lda $C02C
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo151
 jmp GotoNo151
BranchNo151
 lda $D003

 clc
 adc #5

 sta $CFFF

 sta $D003

 lda $D005

 clc
 adc #4

 sta $CFFF

 sta $D005

 lda $D003
 sta $CFFE
 lda #210
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo152
 jmp GotoNo152
BranchNo152
 lda #%10000001
 sta $D404


 lda $C02E
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo153
 jmp GotoNo153
BranchNo153
 lda #25
 sta $C02E

GotoNo153

 lda $D002
 sta $D006

 lda $D002
 sta $D008

 lda #250
 sta $D007

 lda #250
 sta $D009

 lda #0
 sta $D003

 lda $D000
 sta $D002

 lda $C02D
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo154
 jmp GotoNo154
BranchNo154
 lda $C02D

 sec
 sbc #1

 sta $CFFF

 sta $C02D

GotoNo154

GotoNo152

 lda $D005
 sta $CFFE
 lda #210
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo155
 jmp GotoNo155
BranchNo155
 lda #%10000001
 sta $D404


 lda $C02E
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo156
 jmp GotoNo156
BranchNo156
 lda #25
 sta $C02E

GotoNo156

 lda $D004
 sta $D00A

 lda $D004
 sta $D00C

 lda #250
 sta $D00B

 lda #250
 sta $D00D

 lda #0
 sta $D005

 lda $D41B
 sta $D004

 lda $D004
 sta $CFFE
 lda #230
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo157
 jmp GotoNo157
BranchNo157
 lda $D004

 sec
 sbc #100

 sta $CFFF

 sta $D004

GotoNo157

 lda $D004
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo158
 jmp GotoNo158
BranchNo158
 lda #50
 sta $D004

GotoNo158

GotoNo155

 lda $C02D
 sta $C02C

GotoNo151

 rts
EXITMOVEMISSILES

 lda #0

 sta $C031
; THIS IS BREADTIME

LoopNo159
 lda $C02E
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo160
 jmp GotoNo160
BranchNo160
 lda $C02E

 sec
 sbc #1

 sta $CFFF

 sta $C02E

GotoNo160

 lda $C02E
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo161
 jmp GotoNo161
BranchNo161
 lda #%10000000
 sta $D404


GotoNo161

 lda $C031
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo162
 jmp GotoNo162
BranchNo162
 lda $C031

 sec
 sbc #1

 sta $CFFF

 sta $C031

GotoNo162

 lda $C031
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo163
 jmp GotoNo163
BranchNo163
 lda #%01000000
 sta $D40B


GotoNo163

 lda $C00C
 sta $CFFE
 lda #8
 and $CFFE

 sta $CFFE
 lda #8
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo164
 jmp GotoNo164
BranchNo164
 lda $D00E

 clc
 adc #1

 sta $CFFF

 sta $D00E

 lda $D00E
 sta $CFFE
 lda #250
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo165
 jmp GotoNo165
BranchNo165
 lda #30
 sta $D00E

GotoNo165

GotoNo164

 jsr MOVEDUCKS



 jsr RENDERDUCKS



 jsr MOVEMISSILES



 lda #5
 sta $03F2
 lda $C017
 sta $03F3
 lda #5
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D002
 sta $033C
 lda $D003
 sta $033E
 lda $D000
 sta $033D
 lda $D001
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
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D002
 sta $033D
 lda $D003
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo166
 jmp GotoNo166
BranchNo166
 lda $C021

 sec
 sbc #1

 sta $CFFF

 sta $C021

 lda $C019

 clc
 adc #1

 sta $CFFF

 sta $C019

 jmp NOMISSILES

GotoNo166

 lda #5
 sta $03F2
 lda $C017
 sta $03F3
 lda #5
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D004
 sta $033C
 lda $D005
 sta $033E
 lda $D000
 sta $033D
 lda $D001
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
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D004
 sta $033D
 lda $D005
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo167
 jmp GotoNo167
BranchNo167
 lda $C021

 sec
 sbc #1

 sta $CFFF

 sta $C021

 lda $C019

 clc
 adc #1

 sta $CFFF

 sta $C019

 jmp NOMISSILES

GotoNo167

 lda #15
 sta $03F2
 lda $C018
 sta $03F3
 lda #3
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D008
 sta $033C
 lda $D009
 sta $033E
 lda $D000
 sta $033D
 lda $D001
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
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D008
 sta $033D
 lda $D009
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo168
 jmp GotoNo168
BranchNo168
 lda $C021

 sec
 sbc #1

 sta $CFFF

 sta $C021

 lda $C019

 clc
 adc #1

 sta $CFFF

 sta $C019

 jmp NOMISSILES

GotoNo168

 lda #15
 sta $03F2
 lda $C018
 sta $03F3
 lda #3
 sta $03F0
 lda #10
 sta $03F1

 lda #0
 sta $0340
 lda $D00C
 sta $033C
 lda $D00D
 sta $033E
 lda $D000
 sta $033D
 lda $D001
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
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D00C
 sta $033D
 lda $D00D
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo169
 jmp GotoNo169
BranchNo169
 lda $C021

 sec
 sbc #1

 sta $CFFF

 sta $C021

 lda $C019

 clc
 adc #1

 sta $CFFF

 sta $C019

 jmp NOMISSILES

GotoNo169

NOMISSILES

 lda #10
 sta $03F2
 lda #15
 sta $03F3
 lda #10
 sta $03F0
 lda #15
 sta $03F1

 lda #0
 sta $0340
 lda $D00E
 sta $033C
 lda $D00F
 sta $033E
 lda $D000
 sta $033D
 lda $D001
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
 lda $D000
 sta $033C
 lda $D001
 sta $033E
 lda $D00E
 sta $033D
 lda $D00F
 sta $033F
 jsr FullCollision
 lda $0340
 cmp #1
 beq BranchNo170
 jmp GotoNo170
BranchNo170
 lda $C015
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo171
 jmp GotoNo171
BranchNo171
 ldx #25
PointLoopNo171
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo171

GotoNo171

 lda $C015
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo173
 jmp GotoNo173
BranchNo173
 lda $C019
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo174
 jmp GotoNo174
BranchNo174
 ldx #25
PointLoopNo174
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo174

GotoNo174

 lda $C019
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo176
 jmp GotoNo176
BranchNo176
 ldx #25
PointLoopNo176
 jsr AddPoint2
 dex
 cpx #0
 bne PointLoopNo176

GotoNo176

GotoNo173

 lda #5
 sta $C031

 lda #%01000001
 sta $D40B


 lda $D41B
 sta $D00E

 lda $D41B
 sta $D00F

 lda $D00E
 sta $CFFE
 lda #230
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo178
 jmp GotoNo178
BranchNo178
 lda $D00E

 sec
 sbc #100

 sta $CFFF

 sta $D00E

GotoNo178

 lda $D00E
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo179
 jmp GotoNo179
BranchNo179
 lda #50
 sta $D00E

GotoNo179

 lda $D00F
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo180
 jmp GotoNo180
BranchNo180
 lda #100
 sta $D00F

GotoNo180

 lda $D00F
 sta $CFFE
 lda #80
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo181
 jmp GotoNo181
BranchNo181
 lda #80
 sta $D00F

GotoNo181

GotoNo170

 lda $C021
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo182
 jmp GotoNo182
BranchNo182
 jmp ExitLoopNo159


GotoNo182

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo159
ExitLoopNo159

 lda $C016

 sec
 sbc #1

 sta $CFFF

 sta $C016

 jsr DISPLAYMODE



 lda #50
 sta $C013

 lda #%10000000
 sta $D404


 lda #%01000000
 sta $D40B


LoopNo183
 lda #%00010000
 bit $DC01
 beq BranchNo184
 jmp GotoNo184
BranchNo184
 lda $C013

 sec
 sbc #1

 sta $CFFF

 sta $C013

GotoNo184

 lda $C013
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo185
 jmp GotoNo185
BranchNo185
 lda $C016
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo186
 jmp GotoNo186
BranchNo186
 jmp SOFTRESTART

GotoNo186

 jmp RESETGAME

;GARBAGE COLLECTION COMPLETE
;$C010 IS NOW FREE
;$C013 IS NOW FREE
;$C017 IS NOW FREE
;$C018 IS NOW FREE
;$C019 IS NOW FREE
;$C01A IS NOW FREE
;$C01B IS NOW FREE
;$C01C IS NOW FREE
;$C00D IS NOW FREE
;$C01D IS NOW FREE
;$C01E IS NOW FREE
;$C01F IS NOW FREE
;$C020 IS NOW FREE
;$C021 IS NOW FREE
;$C022 IS NOW FREE
;$C023 IS NOW FREE
;$C024 IS NOW FREE
;$C025 IS NOW FREE
;$C026 IS NOW FREE
;$C027 IS NOW FREE
;$C028 IS NOW FREE
;$C029 IS NOW FREE
;$C02A IS NOW FREE
;$C02B IS NOW FREE
;$C02C IS NOW FREE
;$C02D IS NOW FREE
;$C02E IS NOW FREE
;$C02F IS NOW FREE
;$C030 IS NOW FREE
;$C031 IS NOW FREE

GotoNo185

 jsr CHANGEMODS



;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE
;$C00E IS NOW FREE
;$C00F IS NOW FREE
;$C011 IS NOW FREE
;$C012 IS NOW FREE
;$C014 IS NOW FREE
;$C015 IS NOW FREE
;$C016 IS NOW FREE

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo183
ExitLoopNo183


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


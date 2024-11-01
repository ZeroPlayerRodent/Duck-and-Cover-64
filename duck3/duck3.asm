
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
LoadDataNo1
 lda SpriteDataNo1,x
 sta $3040,x
 inx
 cpx #$3F
 bne LoadDataNo1

 ldx #0
 jmp LoadDataNo2
SpriteDataNo2
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
LoadDataNo2
 lda SpriteDataNo2,x
 sta $3080,x
 inx
 cpx #$3F
 bne LoadDataNo2

 lda #192
 sta $7F8

 lda #194
 sta $7F9

 lda #194
 sta $7FA

 lda #12
 sta $D028

 lda #12
 sta $D029

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #1
CompLoopNo4 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo4
 ldy #31
 lda #7

 sta ($00FB),y

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
 ldy #32
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
 ldy #33
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
 ldy #34
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
 ldy #35
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
 ldy #36
 lda #7

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx #2
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
 lda #1

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
 ldy #32
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
 ldy #33
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
 ldy #34
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
 ldy #35
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
 ldy #36
 lda #1

 sta ($00FB),y

 lda #0

 sta $C00C
; THIS IS LINE

LoopNo16
 lda $C00C
 sta $CFFE
 lda #22
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo17
 jmp GotoNo17
BranchNo17
 jmp ExitLoopNo16


GotoNo17

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx $C00C
CompLoopNo18
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo18
 ldy #29
 lda #89

 sta ($00FB),y

 lda #$00
 sta $00FB
 lda #$D8
 sta $00FC
 ldx $C00C
CompLoopNo19 lda $00FB
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
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo16
ExitLoopNo16

 lda #68
 sta $C00D
 lda #85
 sta $C00E
 lda #67
 sta $C00F
 lda #75
 sta $C010
 lda #96
 sta $C011
 lda #84
 sta $C012
 lda #69
 sta $C013
 lda #78
 sta $C014
 lda #78
 sta $C015
 lda #73
 sta $C016
 lda #83
 sta $C017
 lda #0
 sta $C018
; THIS IS STARTMESSAGE

 lda #0

 sta $C00C
; THIS IS STARTCURSOR

LoopNo20
 ldx $C00C
 lda $C00D,x

 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo21
 jmp GotoNo21
BranchNo21
 jmp ExitLoopNo20


GotoNo21

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo22
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo22
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
CompLoopNo23 lda $00FB
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
 lda #1

 sta ($00FB),y

 lda $C00C

 clc
 adc #1

 sta $CFFF

 sta $C00C

;GARBAGE COLLECTION COMPLETE
;$C00C IS NOW FREE

 jmp LoopNo20
ExitLoopNo20

 lda #11
 sta $D020

 lda #0
 sta $D021

 lda #7
 sta $D027

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


LoopNo24
 lda #%00010000
 bit $DC01
 beq BranchNo25
 jmp GotoNo25
BranchNo25
 jmp ExitLoopNo24


GotoNo25

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo24
ExitLoopNo24

RESET

 lda #30
 sta $D002

 lda #50
 sta $D003

 lda #230
 sta $D004

 lda #50
 sta $D005

 lda #0

 sta $C00D
; THIS IS BALLX

 lda #0

 sta $C00E
; THIS IS BALLY

 lda #8

 sta $C00F
; THIS IS MOVETIME

 lda #8

 sta $C010
; THIS IS MOVERESET

 lda #0

 sta $C011
; THIS IS STIME

 lda $D41B
 sta $D001

 lda #125
 sta $D000

 lda $D001
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo26
 jmp GotoNo26
BranchNo26
 lda #200
 sta $D001

GotoNo26

 lda $D001
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo27
 jmp GotoNo27
BranchNo27
 lda #50
 sta $D001

GotoNo27

 jmp EXITMOVEBALL
MOVEBALL

 lda $C00F

 sec
 sbc #1

 sta $CFFF

 sta $C00F

 lda $C00F
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo28
 jmp GotoNo28
BranchNo28
 lda $C00D
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo29
 jmp GotoNo29
BranchNo29
 lda $D000

 clc
 adc #5

 sta $CFFF

 sta $D000

 lda #192
 sta $7F8

GotoNo29

 lda $C00D
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo30
 jmp GotoNo30
BranchNo30
 lda $D000

 sec
 sbc #5

 sta $CFFF

 sta $D000

 lda #193
 sta $7F8

GotoNo30

 lda $C00E
 sta $CFFE
 lda #1
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo31
 jmp GotoNo31
BranchNo31
 lda $D001

 clc
 adc #5

 sta $CFFF

 sta $D001

GotoNo31

 lda $C00E
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo32
 jmp GotoNo32
BranchNo32
 lda $D001

 sec
 sbc #5

 sta $CFFF

 sta $D001

GotoNo32

 lda $C010
 sta $C00F

GotoNo28

 lda $D001
 sta $CFFE
 lda #230
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo33
 jmp GotoNo33
BranchNo33
 lda #0
 sta $C00E

GotoNo33

 lda $D001
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo34
 jmp GotoNo34
BranchNo34
 lda #1
 sta $C00E

GotoNo34

 rts
EXITMOVEBALL

 lda #0

 sta $C012
; THIS IS WIPE

LoopNo35
 lda $C012
 sta $CFFE
 lda #13
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo36
 jmp GotoNo36
BranchNo36
 jmp ExitLoopNo35


GotoNo36

 lda #$00
 sta $00FB
 lda #$04
 sta $00FC
 ldx #1
CompLoopNo37
 lda $00FB
 clc
 adc #40
 sta $00FB
 lda $00FC
 adc #0
 sta $00FC
 dex
 cpx #0
 bne CompLoopNo37
 lda $C012

 clc
 adc #10

 sta $CFFF

 tay
 lda #32

 sta ($00FB),y

 lda $C012

 clc
 adc #1

 sta $CFFF

 sta $C012

 jmp LoopNo35
ExitLoopNo35

LoopNo38
 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo39
 jmp GotoNo39
BranchNo39
 lda $C011

 sec
 sbc #1

 sta $CFFF

 sta $C011

GotoNo39

 lda $C011
 sta $CFFE
 lda #0
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 beq BranchNo40
 jmp GotoNo40
BranchNo40
 lda #%01000000
 sta $D40B


GotoNo40

 lda #%00000001
 bit $DC01
 beq BranchNo41
 jmp GotoNo41
BranchNo41
 lda $D003
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo42
 jmp GotoNo42
BranchNo42
 lda $D003

 sec
 sbc #3

 sta $CFFF

 sta $D003

GotoNo42

GotoNo41

 lda #%00000010
 bit $DC01
 beq BranchNo43
 jmp GotoNo43
BranchNo43
 lda $D003
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo44
 jmp GotoNo44
BranchNo44
 lda $D003

 clc
 adc #3

 sta $CFFF

 sta $D003

GotoNo44

GotoNo43

 lda #%00000001
 bit $DC00
 beq BranchNo45
 jmp GotoNo45
BranchNo45
 lda $D005
 sta $CFFE
 lda #50
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo46
 jmp GotoNo46
BranchNo46
 lda $D005

 sec
 sbc #3

 sta $CFFF

 sta $D005

GotoNo46

GotoNo45

 lda #%00000010
 bit $DC00
 beq BranchNo47
 jmp GotoNo47
BranchNo47
 lda $D005
 sta $CFFE
 lda #200
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo48
 jmp GotoNo48
BranchNo48
 lda $D005

 clc
 adc #3

 sta $CFFF

 sta $D005

GotoNo48

GotoNo47

 jsr MOVEBALL



 lda #5
 sta $03F2
 lda #25
 sta $03F3
 lda #5
 sta $03F0
 lda #5
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
 beq BranchNo49
 jmp GotoNo49
BranchNo49
 lda #5
 sta $C011

 lda #%01000001
 sta $D40B


 lda #1
 sta $C00D

 lda #45
 sta $D000

 lda $C010
 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo50
 jmp GotoNo50
BranchNo50
 lda $C010

 sec
 sbc #1

 sta $CFFF

 sta $C010

GotoNo50

GotoNo49

 lda #5
 sta $03F2
 lda #25
 sta $03F3
 lda #5
 sta $03F0
 lda #5
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
 beq BranchNo51
 jmp GotoNo51
BranchNo51
 lda #5
 sta $C011

 lda #%01000001
 sta $D40B


 lda #0
 sta $C00D

 lda #210
 sta $D000

 lda $C010
 sta $CFFE
 lda #2
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo52
 jmp GotoNo52
BranchNo52
 lda $C010

 sec
 sbc #1

 sta $CFFF

 sta $C010

GotoNo52

GotoNo51

 lda $D000
 sta $CFFE
 lda #240
 sta $CFFD
 lda $CFFD
 cmp $CFFE
 bcc BranchNo53
 jmp GotoNo53
BranchNo53
 ldx #1
PointLoopNo53
 jsr AddPoint
 dex
 cpx #0
 bne PointLoopNo53

 jmp GAMEOVER

GotoNo53

 lda $D000
 sta $CFFE
 lda #20
 sta $CFFD
 lda $CFFE
 cmp $CFFD
 bcc BranchNo55
 jmp GotoNo55
BranchNo55
 ldx #1
PointLoopNo55
 jsr AddPoint2
 dex
 cpx #0
 bne PointLoopNo55

 jmp GAMEOVER

GotoNo55

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo38
ExitLoopNo38

GAMEOVER

 lda #%01000000
 sta $D40B


LoopNo57
 lda #%00010000
 bit $DC01
 beq BranchNo58
 jmp GotoNo58
BranchNo58
 jmp RESET

;GARBAGE COLLECTION COMPLETE
;$C00D IS NOW FREE
;$C00E IS NOW FREE
;$C00F IS NOW FREE
;$C010 IS NOW FREE
;$C011 IS NOW FREE
;$C012 IS NOW FREE

GotoNo58

 lda #%00010000
 bit $DC00
 beq BranchNo59
 jmp GotoNo59
BranchNo59
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


GotoNo59

 jsr DisplayScore
 jsr DisplayScore2
 jsr Wait1


 jmp LoopNo57
ExitLoopNo57


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


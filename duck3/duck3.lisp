(loadsprite 0
.....x..
...xx...
..xx.x..
..xxxxxx
..xxxx..
xxxxxxxx
.xxxxxx.
..xxxx..
..x..x..)

(loadsprite 1
..x.....
...xx...
..x.xx..
xxxxxx..
..xxxx..
xxxxxxxx
.xxxxxx.
..xxxx..
..x..x..)

(loadsprite 2
..xxxx..
xxxxxxxx
xxxxxxxx
.xxxxxx.
.xxxxxx.
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
...xx...)

(setsprite 0 0)
(setsprite 1 2)
(setsprite 2 2)

(put 12 player1color)
(put 12 player2color)


(plotcolor 1 31 7)
(plotcolor 1 32 7)
(plotcolor 1 33 7)
(plotcolor 1 34 7)
(plotcolor 1 35 7)
(plotcolor 1 36 7)

(plotcolor 2 31 1)
(plotcolor 2 32 1)
(plotcolor 2 33 1)
(plotcolor 2 34 1)
(plotcolor 2 35 1)
(plotcolor 2 36 1)

(newvar line 0)

(loop
  (when (> line 22) (break))
  (plot line 29 89)
  (plotcolor line 29 1)
  (put (+ line 1) line))

(newarray startmessage 68 85 67 75 96 84 69 78 78 73 83 0)
(newvar startcursor 0)

(loop
  (when (equal (index startcursor startmessage) 0) (break))
  (plot 1 (+ startcursor 10) (- (index startcursor startmessage) 64))
  (plotcolor 1 (+ startcursor 10) 1)
  (put (+ startcursor 1) startcursor))

(put 11 bordercolor)
(put 0 backgroundcolor)

(put 7 player0color)

(resetscore)
(resetscore2)

(loop
  (when (joyfire)(break))
  (drawscreen))

(label reset)

(put 30 player1x)
(put 50 player1y)

(put 230 player2x)
(put 50 player2y)

(newvar ballx 0)
(newvar bally 0)

(newvar movetime 8)
(newvar movereset 8)

(newvar stime 0)

(put (random) player0y)
(put 125 player0x)

(when (> player0y 200)
  (put 200 player0y)
)

(when (< player0y 50)
  (put 50 player0y)
)

(routine moveball
  (put (- movetime 1) movetime)
  (when (equal movetime 0)
    (when (equal ballx 1)
      (put (+ player0x 5) player0x)
      (setsprite 0 0)
    )
    (when (equal ballx 0)
      (put (- player0x 5) player0x)
      (setsprite 0 1)
    )
    (when (equal bally 1)
      (put (+ player0y 5) player0y)
    )
    (when (equal bally 0)
      (put (- player0y 5) player0y)
    )
    (put movereset movetime)
  )
  (when (> player0y 230)
    (put 0 bally)
  )
  (when (< player0y 50)
    (put 1 bally)
  )
)

(newvar wipe 0)

(loop
  (when (> wipe 13)(break))
  (plot 1 (+ wipe 10) 32)
  (put (+ wipe 1) wipe))

(loop
  (when (> stime 0)
    (put (- stime 1) stime)
  )
  (when (equal stime 0)
    (mutesound2)
  )
  (when (joyup)
    (when (> player1y 50)
      (put (- player1y 3) player1y)
    )
  )
  (when (joydown)
    (when (< player1y 200)
      (put (+ player1y 3) player1y)
    )
  )

  (when (joyup2)
    (when (> player2y 50)
      (put (- player2y 3) player2y)
    )
  )
  (when (joydown2)
    (when (< player2y 200)
      (put (+ player2y 3) player2y)
    )
  )
  (execute moveball)
  (hitboxes 5 25 5 5)
  (when (collision 1 0)
    (put 5 stime)
    (playsound2)
    (put 1 ballx)
    (put 45 player0x)
    (when (> movereset 2)
      (put (- movereset 1) movereset)
    )
  )
  (hitboxes 5 25 5 5)
  (when (collision 2 0)
    (put 5 stime)
    (playsound2)
    (put 0 ballx)
    (put 210 player0x)
    (when (> movereset 2)
      (put (- movereset 1) movereset)
    )
  )
  (when (> player0x 240)
    (addpoints 1)
    (goto gameover)
  )
  (when (< player0x 20)
    (addpoints2 1)
    (goto gameover)
  )
  (drawscreen)
)

(label gameover)

(mutesound2)

(loop
  (when (joyfire)
    (goto reset)
  )
  (when (joyfire2)
    (resetscore)
    (resetscore2)
  )
  (drawscreen)
)

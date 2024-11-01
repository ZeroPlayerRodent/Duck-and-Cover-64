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
.....x..
...xx...
..xx.x..
..xxxxxx
..xxxx..
..xxxx...
.xxxxxx.
xxxxxxxx
..x..x..)

(loadsprite 2
..x.....
...xx...
..x.xx..
xxxxxx..
..xxxx..
xxxxxxxx
.xxxxxx.
..xxxx..
..x..x..)

(loadsprite 3
..x.....
...xx...
..x.xx..
xxxxxx..
..xxxx..
..xxxx..
.xxxxxx.
xxxxxxxx
..x..x..)

(loadsprite 7
.xxxxxx.
x.x.x.xx
xx.x.x.x
.xx.x.x.
.x.x.xx.
.xx.x.x.
..xxxx..)

(put 0 backgroundcolor)
(put 12 bordercolor)

(newvar line 1)
(newvar line2 1)

(loop
  (when (equal line 23)
    (break)
  )
  (plot line 30 89)
  (plotcolor line 30 1)
  (put (+ line 1) line)
)

(plotcolor 1 31 7)
(plotcolor 1 32 7)
(plotcolor 1 33 7)
(plotcolor 1 34 7)
(plotcolor 1 35 7)
(plotcolor 1 36 7)

(put 1 line)

(loop
  (when (equal line2 15)
    (break)
  )
  (loop
    (when (equal line 29)
      (break)
    )
    (when (> (random) 200)
      (plot line2 line 46)
      (plotcolor line2 line 1)
    )
    (put (+ line 1) line)
  )
  (put 1 line)
  (put (+ line2 1) line2)
)

(put 1 line)

(loop
  (when (equal line 29)
    (break)
  )
  (plot 23 line 160)
  (plotcolor 23 line 5)
  (plot 22 line 89)
  (plotcolor 22 line 5)
  (when (> (random) 125)
    (plot 21 line 89)
    (plotcolor 21 line 5)
  )
  (put (+ line 1) line)
)

(newvar cursor 0)
(newarray title 68 85 67 75 96 65 78 68 96 67 79 86 69 82 0)

(loop
  (when (equal (index cursor title) 0)
    (break)
  )
  (plot 1 (+ cursor 8) (- (index cursor title) 64))
  (plotcolor 1 (+ cursor 8) 1)
  (put (+ cursor 1) cursor)
)


(newvar mods 0)

(newvar hardmode 0)
(newvar hardbounce 0)

(newvar debounce 0)
(newvar debounce2 0)

(newvar modbounce 0)
(newvar holdreset 50)

(newvar multiplayer 0)

(newvar versus 0)

(resetscore)
(resetscore2)

(newvar lives 3)

(routine displaymode

  (plotcolor 2 31 0)
  (plotcolor 2 32 0)
  (plotcolor 2 33 0)
  (plotcolor 2 34 0)
  (plotcolor 2 35 0)
  (plotcolor 2 36 0)

  (when (equal versus 1)
    (plotcolor 2 31 1)
    (plotcolor 2 32 1)
    (plotcolor 2 33 1)
    (plotcolor 2 34 1)
    (plotcolor 2 35 1)
    (plotcolor 2 36 1)
  )

  (plot 6 31 13)
  (plot 6 33 (+ 48 mods))
  (plot 6 32 48)
  (plot 6 34 32)
  (when (equal hardmode 1)
    (plot 6 34 43)
  )
  (when (> mods 9)
    (plot 6 33 (+ 48 (- mods 10)))
    (plot 6 32 (+ 48 1))
  )
  (when (> mods 19)
    (plot 6 33 (+ 48 (- mods 20)))
    (plot 6 32 (+ 48 2))
  )
  (when (> mods 29)
    (plot 6 33 (+ 48 (- mods 30)))
    (plot 6 32 (+ 48 3))
  )
  (plot 10 31 16)
  (plot 10 32 (+ 48 (+ multiplayer 1)))

  (plot 14 31 12)
  (plot 14 32 (+ 48 lives))

  (plotcolor 6 33 1)
  (plotcolor 6 32 1)
  (plotcolor 6 31 1)
  (plotcolor 6 34 1)
  (plotcolor 8 31 1)
  (plotcolor 8 32 1)
  (plotcolor 10 31 1)
  (plotcolor 10 32 1)
  (plotcolor 14 31 1)
  (plotcolor 14 32 1)
)

(routine changemods
  (when (joyup)
    (when (equal modbounce 0)
      (put (+ mods 1) mods)
      (when (> mods 31)
        (put 0 mods)
      )
      (execute displaymode)
    )
    (put 1 modbounce)
    (goto notbounce)
  )
  (put 0 modbounce)
  (label notbounce)
  (when (joydown)
    (when (equal hardbounce 0)
      (put (+ hardmode 1) hardmode)
      (when (> hardmode 1)
        (put 0 hardmode)
      )
      (execute displaymode)
    )
    (put 1 hardbounce)
    (goto nohardbounce)
  )
  (put 0 hardbounce)
  (label nohardbounce)
  (when (joyfire2)
    (when (equal debounce2 0)
      (when (equal versus 1)
        (goto donesetversus)
      )
      (when (equal multiplayer 1)
        (put 1 versus)
        (goto donesetmult)
      )
      (label donesetversus)
      (put (+ multiplayer 1) multiplayer)
      (when (> multiplayer 1)
        (put 0 multiplayer)
        (put 0 versus)
      )
      (label donesetmult)
      (execute displaymode)
    )
    (put 1 debounce2)
    (goto notbounce2)
  )
  (put 0 debounce2)
  (label notbounce2)
)

(execute displaymode)

(loop
  (when (joyfire)
    (goto resetgame)
  )
  (execute changemods)
  (drawscreen)
)

(label resetgame)

(resetscore2)
(resetscore)
(put 3 lives)

(label softrestart)

(loadsprite 4
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
...xx...)

(loadsprite 5
...xxxxxxxxxx...
.xxxxxxxxxxxxxx.
xxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxx
.xxxxxxxxxxxxxx.
...xxxxxxxxxx...
.....xxxxxx.....
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
.xxxxxxxxxxxxxx.
x.....xxxx.....x)

(loadsprite 6
x.....xxxx.....x
.xxxxxxxxxxxxxx.
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
...xxxxxxxxxx...
.xxxxxxxxxxxxxx.
xxxxxxxxxxxxxxxx)

(newvar missilelength 20)
(newvar boomlength 60)

(when (equal (and mods 4) 4)
(loadsprite 4
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

(loadsprite 5
...xxxxxxxxxx...
.xxxxxxxxxxxxxx.
xxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxx
.xxxxxxxxxxxxxx.
...xxxxxxxxxx...
.....xxxxxx.....
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
.xxxxxxxxxxxxxx.
x.....xxxx.....x)

(loadsprite 6
x.....xxxx.....x
.xxxxxxxxxxxxxx.
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
......xxxx......
...xxxxxxxxxx...
.xxxxxxxxxxxxxx.
xxxxxxxxxxxxxxxx)

(put 35 missilelength)
(put 60 boomlength)
)

(execute displaymode)

(put 0 player3x)
(put 0 player3y)
(put 0 player4x)
(put 0 player4y)
(put 0 player5x)
(put 0 player5y)
(put 0 player6x)
(put 0 player6y)

(put 125 player7x)
(put 80 player7y)

(setsprite 3 6)
(setsprite 4 5)
(setsprite 5 6)
(setsprite 6 5)
(setsprite 7 7)

(put 2 player3color)
(put 2 player4color)
(put 2 player5color)
(put 2 player6color)
(put 8 player7color)

(setsprite 1 4)
(setsprite 2 4)
(put 12 player1color)
(put 12 player2color)

(put 100 player1x)
(put 0 player1y)

(put 150 player2x)
(put 0 player2y)

(setsprite 0 0)
(put 7 player0color)
(put 100 player0x)
(put 100 player0y)

(newvar duck 0)

(newvar dir 0)
(newvar flap 0)

(newvar dir2 0)
(newvar flap2 0)

(newvar px 100)
(newvar py 210)

(newvar px2 150)
(newvar py2 210)

(newvar aliveplayers 2)

(routine renderducks
  (when (> aliveplayers 1)
    (put (+ duck 1) duck)
  )
  (when (> duck 1)
    (put 0 duck)
  )
  (when (equal multiplayer 0)
    (put 0 duck)
  )
  (when (equal duck 0)
    (put 7 player0color)
    (put px player0x)
    (put py player0y)
    (when (equal 0 dir)
      (setsprite 0 2)
      (when (equal flap 1)
        (setsprite 0 3)
      )
    )
    (when (equal 1 dir)
      (setsprite 0 0)
      (when (equal flap 1)
        (setsprite 0 1)
      )
    )
  )

  (when (equal duck 1)
    (put 1 player0color)
    (put px2 player0x)
    (put py2 player0y)
    (when (equal 0 dir2)
      (setsprite 0 2)
      (when (equal flap2 1)
        (setsprite 0 3)
      )
    )
    (when (equal 1 dir2)
      (setsprite 0 0)
      (when (equal flap2 1)
        (setsprite 0 1)
      )
    )
  )
)


(newvar wrap 0)
(when (equal (and mods 16) 16)
  (put 1 wrap)
)

(newvar duckspeed 2)
(when (equal (and mods 2) 2)
  (put 4 duckspeed)
)

(newvar duckgravity 1)
(newvar duckmov 0)
(newvar gravtime 10)

(newvar duckmov2 0)
(newvar gravtime2 10)

(newvar duckjump 4)
(when (equal (and mods 1) 1)
  (put 8 duckjump)
)

(newvar jumptime 0)
(newvar jumptime2 0)

(routine moveducks
  (when (> gravtime 0)
    (put (- gravtime 1) gravtime)
  )
  (when (equal gravtime 0)
    (when (< duckmov 8)
      (put (+ duckgravity duckmov) duckmov)
    )
    (put 10 gravtime)
  )
  (when (> gravtime2 0)
    (put (- gravtime2 1) gravtime2)
  )
  (when (equal gravtime2 0)
    (when (< duckmov2 8)
      (put (+ duckgravity duckmov2) duckmov2)
    )
    (put 10 gravtime2)
  )

  (when (joyright)
    (put 1 dir)
    (put (+ px duckspeed) px)
    (when (> px 250)
      (put 250 px)
      (when (equal wrap 1)
        (put 30 px)
      )
    )
  )
  (when (joyleft)
    (put 0 dir)
    (put (- px duckspeed) px)
    (when (< px 30)
      (put 30 px)
      (when (equal wrap 1)
        (put 250 px)
      )
    )
  )
  (when (joyfire)
    (put 1 flap)
    (when (equal debounce 0)
      (put 1 duckmov)
      (put 10 gravtime)
      (put 12 jumptime)
    )
    (put 1 debounce)
    (goto doneflap)
  )
  (put 0 flap)
  (put 0 debounce)
  (label doneflap)
  (when (> jumptime 0)
    (put (- jumptime 1) jumptime)
    (when (> py 40)
      (put (- py duckjump) py)
    )
  )

  (when (joyright2)
    (put 1 dir2)
    (put (+ px2 duckspeed) px2)
    (when (> px2 250)
      (put 250 px2)
      (when (equal wrap 1)
        (put 30 px2)
      )
    )
  )
  (when (joyleft2)
    (put 0 dir2)
    (put (- px2 duckspeed) px2)
    (when (< px2 30)
      (put 30 px2)
      (when (equal wrap 1)
        (put 250 px2)
      )
    )
  )
  (when (joyfire2)
    (put 1 flap2)
    (when (equal debounce2 0)
      (put 1 duckmov2)
      (put 10 gravtime2)
      (put 12 jumptime2)
    )
    (put 1 debounce2)
    (goto doneflap2)
  )
  (put 0 flap2)
  (put 0 debounce2)
  (label doneflap2)
  (when (> jumptime2 0)
    (put (- jumptime2 1) jumptime2)
    (when (> py2 40)
      (put (- py2 duckjump) py2)
    )
  )

  (when (< py 220)
    (put (+ py duckmov) py)
  )
  (when (> py 220)
    (put 220 py)
  )
  (when (< py2 220)
    (put (+ py2 duckmov2) py2)
  )
  (when (> py2 220)
    (put 220 py2)
  )
)

(newvar movetime 10)
(newvar movereset 10)

(when (equal hardmode 1)
  (put 5 movetime)
  (put 5 movereset)
)

(newvar soundtime 0)
(newvar top1 210)
(newvar top2 182)
(when (equal (and mods 4) 4)
  (put 208 top1)
  (put 167 top2)
)
(routine movemissiles
  (when (> movetime 0)
    (put (- movetime 1) movetime)
  )
  (when (> player3y top1)
    (put (- player3y 4) player3y)
  )
  (when (> player4y top2)
    (put (- player4y 4) player4y)
  )
  (when (> player5y top1)
    (put (- player5y 4) player5y)
  )
  (when (> player6y top2)
    (put (- player6y 4) player6y)
  )
  (when (equal movetime 0)
    (put (+ player1y 5) player1y)
    (put (+ player2y 4) player2y)
    (when (> player1y 210)
      (playsound1)
      (when (equal soundtime 0)
        (put 25 soundtime)
      )
      (put player1x player3x)
      (put player1x player4x)
      (put 250 player3y)
      (put 250 player4y)
      (put 0 player1y)
      (put player0x player1x)
      (when (> movereset 1)
        (put (- movereset 1) movereset)
      )
    )
    (when (> player2y 210)
      (playsound1)
      (when (equal soundtime 0)
        (put 25 soundtime)
      )
      (put player2x player5x)
      (put player2x player6x)
      (put 250 player5y)
      (put 250 player6y)
      (put 0 player2y)
      (put (random) player2x)
      (when (> player2x 230)
        (put (- player2x 100) player2x)
      )
      (when (< player2x 50)
        (put 50 player2x)
      )
    )
    (put movereset movetime)
  )
)

(newvar breadtime 0)

(loop
  (when (> soundtime 0)
    (put (- soundtime 1) soundtime)
  )
  (when (equal soundtime 0)
    (mutesound1)
  )
  (when (> breadtime 0)
    (put (- breadtime 1) breadtime)
  )
  (when (equal breadtime 0)
    (mutesound2)
  )
  (when (equal (and mods 8) 8)
    (put (+ player7x 1) player7x)
    (when (> player7x 250)
      (put 30 player7x)
    )
  )
  (execute moveducks)
  (execute renderducks)
  (execute movemissiles)
  (hitboxes 5 missilelength 5 10)
  (when (collision 1 0)
    (put (- aliveplayers 1) aliveplayers)
    (put (+ duck 1) duck)
    (goto nomissiles)
  )
  (hitboxes 5 missilelength 5 10)
  (when (collision 2 0)
    (put (- aliveplayers 1) aliveplayers)
    (put (+ duck 1) duck)
    (goto nomissiles)
  )
  (hitboxes 15 boomlength 3 10)
  (when (collision 4 0)
    (put (- aliveplayers 1) aliveplayers)
    (put (+ duck 1) duck)
    (goto nomissiles)
  )
  (hitboxes 15 boomlength 3 10)
  (when (collision 6 0)
    (put (- aliveplayers 1) aliveplayers)
    (put (+ duck 1) duck)
    (goto nomissiles)
  )
  (label nomissiles)
  (hitboxes 10 15 10 15)
  (when (collision 7 0)
    (when (equal versus 0)
      (addpoints 25)
    )
    (when (equal versus 1)
      (when (equal duck 0)
        (addpoints 25)
      )
      (when (equal duck 1)
        (addpoints2 25)
      )
    )
    (put 5 breadtime)
    (playsound2)
    (put (random) player7x)
    (put (random) player7y)
    (when (> player7x 230)
      (put (- player7x 100) player7x)
    )
    (when (< player7x 50)
      (put 50 player7x)
    )
    (when (> player7y 200)
      (put 100 player7y)
    )
    (when (< player7y 80)
      (put 80 player7y)
    )
  )
  (when (equal aliveplayers 0)
    (break)
  )
  (drawscreen)
)

(put (- lives 1) lives)
(execute displaymode)
(put 50 holdreset)
(mutesound1)
(mutesound2)

(loop
  (when (joyfire)
    (put (- holdreset 1) holdreset)
  )
  (when (equal holdreset 0)
    (when (> lives 0)
      (goto softrestart)
    )
    (goto resetgame)
  )
  (execute changemods)
  (drawscreen)
)

$compile exe
key(10) on
on key(10) gosub theend
key(1) on
on key(1) gosub lbas1
key(2) on
on key(2) gosub lbas2
key(3) on
on key(3) gosub lbas3
key(4) on
on key(4) gosub lbas4
'key(5) on
'on key(5) gosub lbas5

key(10) on
on key(10) gosub theend

screen 0
cls

theloop:
goto theloop

lbas1:
chain "water"
return

lbas2:
chain "l0ho"
return

lbas3:
chain "l0ho2"
return

lbas4:
chain "l0linear"
return

'lbas5:
'chain ""
'return

theend:
end
return

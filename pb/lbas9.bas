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
key(5) on
on key(5) gosub lbas5
key(6) on
on key(6) gosub lbas6
key(7) on
on key(7) gosub lbas7
key(8) on
on key(8) gosub lbas8
key(9) on
on key(9) gosub lbas9

key(10) on
on key(10) gosub theend

screen 0
cls

theloop:
goto theloop

lbas1:
chain "7-1"
return

lbas2:
chain "7-1air"
return

lbas3:
chain "7-2"
return

lbas4:
chain "7-2air"
return

lbas5:
chain "me9"
return

lbas6:
chain "6-1-9"
return

lbas7:
chain "8-1"
return

lbas8:
chain "l9beaded"
return

lbas9:
chain "8-2"
return

theend:
end
return

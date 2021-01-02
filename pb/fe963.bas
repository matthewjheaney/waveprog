$compile chain
common chtime
on timer(chtime) gosub thechain
timer on
on key(9) gosub thechain
key(9) on
scrwidth=250
pi=atn(1)*4
screen 9
window (-135,-150)-(2*scrwidth-135,150)
x0=scrwidth-25
yy=30
k=1/8

randomize timer

def fns(x)
  if x=0 then fns=1 else fns=(sin(x)/x)
end def

dim ar(6),sr(6),lr(6),rr(6)

rr(1)=4
rr(2)=1
rr(3)=2
rr(4)=5
rr(5)=3
rr(6)=6

ar(1)=2.5
sr(1)=20
ar(2)=2.5
sr(2)=10
ar(3)=2.5
sr(3)=40
ar(4)=8
sr(4)=10
ar(5)=8
sr(5)=20
ar(6)=8
sr(6)=40



def fnd(x,y,jr)=fns(k*x*ar(jr))*cos(k*x*sr(jr))*fns(k*y*yy/2)

on key(10) gosub theend
key(10) on
on key(1) gosub jr1
key(1) on
on key(2) gosub jr2
key(2) on
on key(3) gosub jr3
key(3) on
on key(4) gosub jr4
key(4) on
on key(5) gosub jr5
key(5) on
on key(6) gosub jr6
key(6) on

cll=11
clll=12
clll=11

jr=1
thestart:
jc=0

locate 1,73
print "PROB 3"

locate 3,3
print "1"
locate 7,3
print "2"
locate 11,3
print "3"
locate 15,3
print "4"
locate 19,3
print "5"
locate 23,3
print "6"

locate 3,69
print "A"
locate 7,69
print "B"
locate 11,69
print "C"
locate 15,69
print "D"
locate 19,69
print "E"
locate 23,69
print "F"


for jrr=1 to 6
line (100,15+(jrr-3.5)*50)-(100,-15+(jrr-3.5)*50)
line (-100,-15+(jrr-3.5)*50)-(100,-15+(jrr-3.5)*50)
line (-100,-15+(jrr-3.5)*50)-(-100,15+(jrr-3.5)*50)
line (-100,15+(jrr-3.5)*50)-(100,15+(jrr-3.5)*50)
line (x0-ar(rr(jrr))-sr(rr(jrr)),(jrr-3.5)*50-yy/2)-(x0-ar(rr(jrr))-sr(rr(jrr)),(jrr-3.5)*50+yy/2),clll
line (x0+ar(rr(jrr))-sr(rr(jrr)),(jrr-3.5)*50-yy/2)-(x0+ar(rr(jrr))-sr(rr(jrr)),(jrr-3.5)*50+yy/2),clll
line (x0-ar(rr(jrr))-sr(rr(jrr)),(jrr-3.5)*50-yy/2)-(x0+ar(rr(jrr))-sr(rr(jrr)),(jrr-3.5)*50-yy/2),clll
line (x0-ar(rr(jrr))-sr(rr(jrr)),(jrr-3.5)*50+yy/2)-(x0+ar(rr(jrr))-sr(rr(jrr)),(jrr-3.5)*50+yy/2),clll
line (x0-ar(rr(jrr))+sr(rr(jrr)),(jrr-3.5)*50-yy/2)-(x0-ar(rr(jrr))+sr(rr(jrr)),(jrr-3.5)*50+yy/2),clll
line (x0+ar(rr(jrr))+sr(rr(jrr)),(jrr-3.5)*50-yy/2)-(x0+ar(rr(jrr))+sr(rr(jrr)),(jrr-3.5)*50+yy/2),clll
line (x0-ar(rr(jrr))+sr(rr(jrr)),(jrr-3.5)*50-yy/2)-(x0+ar(rr(jrr))+sr(rr(jrr)),(jrr-3.5)*50-yy/2),clll
line (x0-ar(rr(jrr))+sr(rr(jrr)),(jrr-3.5)*50+yy/2)-(x0+ar(rr(jrr))+sr(rr(jrr)),(jrr-3.5)*50+yy/2),clll
next
'line (x0-ar(jr)-sr(jr),(jr-3.5)*50-yy/2)-(x0-ar(jr)-sr(jr),(jr-3.5)*50+yy/2),cll
'line (x0+ar(jr)-sr(jr),(jr-3.5)*50-yy/2)-(x0+ar(jr)-sr(jr),(jr-3.5)*50+yy/2),cll
'line (x0-ar(jr)-sr(jr),(jr-3.5)*50-yy/2)-(x0+ar(jr)-sr(jr),(jr-3.5)*50-yy/2),cll
'line (x0-ar(jr)-sr(jr),(jr-3.5)*50+yy/2)-(x0+ar(jr)-sr(jr),(jr-3.5)*50+yy/2),cll
'line (x0-ar(jr)+sr(jr),(jr-3.5)*50-yy/2)-(x0-ar(jr)+sr(jr),(jr-3.5)*50+yy/2),cll
'line (x0+ar(jr)+sr(jr),(jr-3.5)*50-yy/2)-(x0+ar(jr)+sr(jr),(jr-3.5)*50+yy/2),cll
'line (x0-ar(jr)+sr(jr),(jr-3.5)*50-yy/2)-(x0+ar(jr)+sr(jr),(jr-3.5)*50-yy/2),cll
'line (x0-ar(jr)+sr(jr),(jr-3.5)*50+yy/2)-(x0+ar(jr)+sr(jr),(jr-3.5)*50+yy/2),cll

m=0

theloop:
if jc=1 then goto thestart
for jrr=1 to 6
x=-100+200*rnd
y=-15+30*rnd
if fnd(x/12,y/12,jrr)^2>rnd then
' circle (x,y),.05
if m<40000 then pset (x,y+(rr(jrr)-3.5)*50)
 m=m+1
end if
next
goto theloop


jr1:
jr=1
jc=1
cls
return
jr2:
jr=2
jc=1
cls
return
jr3:
jr=3
jc=1
cls
return
jr4:
jr=4
jc=1
cls
return
jr5:
jr=5
jc=1
cls
return
jr6:
jr=6
jc=1
cls
return

theend:
cls
end

thechain:
clear
cls
chain "fe964"
return

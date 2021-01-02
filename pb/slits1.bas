$compile chain
scrwidth=210
pi=atn(1)*4
screen 9
window (-scrwidth+50,-150)-(scrwidth+50,150)

randomize timer

def fns(x)
  if x=0 then fns=1 else fns=(sin(x)/x)^2
end def

dim xr(6,4),yr(6,4)

xr(1,1)=10
yr(1,1)=10
xr(1,2)=10
yr(1,2)=-10
xr(1,3)=-10
yr(1,3)=-10
xr(1,4)=-10
yr(1,4)=10

xr(2,1)=20
yr(2,1)=5
xr(2,2)=20
yr(2,2)=-5
xr(2,3)=-20
yr(2,3)=-5
xr(2,4)=-20
yr(2,4)=5

xr(3,1)=40
yr(3,1)=2.5
xr(3,2)=40
yr(3,2)=-2.5
xr(3,3)=-40
yr(3,3)=-2.5
xr(3,4)=-40
yr(3,4)=2.5

xr(4,1)=80+5
yr(4,1)=1.25
xr(4,2)=80+5
yr(4,2)=-1.25
xr(4,3)=-80+5
yr(4,3)=-1.25
xr(4,4)=-80+5
yr(4,4)=1.25


xr(5,1)=160-75
yr(5,1)=.625
xr(5,2)=160-75
yr(5,2)=-.625
xr(5,3)=-160-75
yr(5,3)=-.625
xr(5,4)=-160-75
yr(5,4)=.625




def fnd(x,y,jr)
if jr=1 then fnd=fns(x/2^(1/2))*fns(y/2^(1/2))
if jr=2 then fnd=fns(x/2^(1/2)*2)*fns(y/2^(1/2)/2)
if jr=3 then fnd=fns(x/2^(1/2)*4)*fns(y/2^(1/2)/4)
if jr=4 then fnd=fns(x/2^(1/2)*8)*fns(y/2^(1/2)/8)
if jr=5 then fnd=fns(x/2^(1/2)*16)*fns(y/2^(1/2)/16)
end def

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

jr=1
thestart:
jc=0
line (100,100)-(100,-100)
line (-100,-100)-(100,-100)
line (-100,-100)-(-100,100)
line (-100,100)-(100,100)

'line (150+xr(jr,1),yr(jr,1))-(150+xr(jr,2),yr(jr,2)),cll
'line (150+xr(jr,3),yr(jr,3))-(150+xr(jr,2),yr(jr,2)),cll
'line (150+xr(jr,3),yr(jr,3))-(150+xr(jr,4),yr(jr,4)),cll
'line (150+xr(jr,1),yr(jr,1))-(150+xr(jr,4),yr(jr,4)),cll

for jrr=1 to 5
line (180+xr(jrr,1),yr(jrr,1)+(jrr-2.5)*50)-(180+xr(jrr,2),yr(jrr,2)+(jrr-2.5)*50),clll
line (180+xr(jrr,3),yr(jrr,3)+(jrr-2.5)*50)-(180+xr(jrr,2),yr(jrr,2)+(jrr-2.5)*50),clll
line (180+xr(jrr,3),yr(jrr,3)+(jrr-2.5)*50)-(180+xr(jrr,4),yr(jrr,4)+(jrr-2.5)*50),clll
line (180+xr(jrr,1),yr(jrr,1)+(jrr-2.5)*50)-(180+xr(jrr,4),yr(jrr,4)+(jrr-2.5)*50),clll
next

line (180+xr(jr,1),yr(jr,1)+(jr-2.5)*50)-(180+xr(jr,2),yr(jr,2)+(jr-2.5)*50),cll
line (180+xr(jr,3),yr(jr,3)+(jr-2.5)*50)-(180+xr(jr,2),yr(jr,2)+(jr-2.5)*50),cll
line (180+xr(jr,3),yr(jr,3)+(jr-2.5)*50)-(180+xr(jr,4),yr(jr,4)+(jr-2.5)*50),cll
line (180+xr(jr,1),yr(jr,1)+(jr-2.5)*50)-(180+xr(jr,4),yr(jr,4)+(jr-2.5)*50),cll


m=0

theloop:
if jc=1 then goto thestart
x=-100+200*rnd
y=-100+200*rnd
if fnd(x/12,y/12,jr)>rnd then
' circle (x,y),.1
pset (x,y)
 m=m+1
end if
goto theloop

theend:
print m
line input m$
cls
chain "lbas21.exe"
end
end

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

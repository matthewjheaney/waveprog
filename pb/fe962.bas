$compile chain
common chtime
on timer(chtime) gosub thechain
timer on
on key(9) gosub thechain
key(9) on
scrwidth=210
pi=atn(1)*4
screen 9
window (-scrwidth+50,-150)-(scrwidth+50,150)

randomize timer

def fns(x)
  if x=0 then fns=1 else fns=(sin(x)/x)^2
end def

def fnt(x1,x2,x3)
  if x1=x2 then if x1=x3 then fnt=1 else fnt=4*((cos(x3)-cos(x1))/(x1-x3)^2-sin(x1)/(x1-x3))^2+4*((sin(x3)-sin(x1))/(x1-x3)^2+cos(x1)/(x1-x3))^2
  if x1=x3 then if x1=x2 then fnt=1 else fnt=4*((cos(x2)-cos(x1))/(x1-x2)^2-sin(x1)/(x1-x2))^2+4*((sin(x2)-sin(x1))/(x1-x2)^2+cos(x1)/(x1-x2))^2
  if x2=x3 then if x1=x2 then fnt=1 else fnt=4*((cos(x1)-cos(x2))/(x2-x1)^2-sin(x2)/(x2-x1))^2+4*((sin(x1)-sin(x2))/(x2-x1)^2+cos(x2)/(x2-x1))^2
  if (x1<>x2) and ((x1<>x3) and (x2<>x3)) then fnt=4*(cos(x1)/(x1-x2)/(x1-x3)+cos(x2)/(x2-x1)/(x2-x3)+cos(x3)/(x3-x1)/(x3-x2))^2+4*(sin(x1)/(x1-x2)/(x1-x3)+sin(x2)/(x2-x1)/(x2-x3)+sin(x3)/(x3-x1)/(x3-x2))^2
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

xr(2,1)=14.14
yr(2,1)=0
xr(2,2)=0
yr(2,2)=-14.14
xr(2,3)=-14.14
yr(2,3)=0
xr(2,4)=0
yr(2,4)=14.14

xr(3,1)=14.14
yr(3,1)=0
xr(3,2)=0
yr(3,2)=-28.28
xr(3,3)=-14.14
yr(3,3)=0
xr(3,4)=0
yr(3,4)=28.28

'new ones for the exam
xr(3,1)=14.14
yr(3,1)=0
xr(3,2)=0
yr(3,2)=-42.42
xr(3,3)=-14.14
yr(3,3)=0
xr(3,4)=0
yr(3,4)=42.42

xr(4,1)=20
yr(4,1)=-10
xr(4,2)=-10
yr(4,2)=-10
xr(4,3)=-10
yr(4,3)=20
xr(4,4)=-10
yr(4,4)=20

xr(5,1)=20
yr(5,1)=0
xr(5,2)=-10
yr(5,2)=10*3^(1/2)
xr(5,3)=-10
yr(5,3)=-10*3^(1/2)
xr(5,4)=-10
yr(5,4)=-10*3^(1/2)

yr(6,1)=15
xr(6,1)=0
yr(6,2)=-15
xr(6,2)=10*3^(1/2)
yr(6,3)=-15
xr(6,3)=-10*3^(1/2)
yr(6,4)=-15
xr(6,4)=-10*3^(1/2)

def fnkr(kx,ky,jr,el)=(xr(jr,el)*kx+yr(jr,el)*ky)/10/2^(1/2)


def fnd(x,y,jr)
if jr=1 then fnd=fns(x/2^(1/2))*fns(y/2^(1/2))
if jr=2 then fnd=fns(x/2+y/2)*fns(x/2-y/2)
' x/2 changed to x/3 for the exam
if jr=3 then fnd=fns(x/3+y)*fns(x/3-y)
if jr=4 then fnd=fnt(fnkr(x,y,jr,1),fnkr(x,y,jr,2),fnkr(x,y,jr,3))
if jr=5 then fnd=fnt(fnkr(x,y,jr,1),fnkr(x,y,jr,2),fnkr(x,y,jr,3))
if jr=6 then fnd=fnt(fnkr(x,y,jr,1),fnkr(x,y,jr,2),fnkr(x,y,jr,3))
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

jr=3
thestart:
jc=0
locate 1,73
print "PROB 2"

line (100,100)-(100,-100)
line (-100,-100)-(100,-100)
line (-100,-100)-(-100,100)
line (-100,100)-(100,100)

'line (150+xr(jr,1),yr(jr,1))-(150+xr(jr,2),yr(jr,2)),cll
'line (150+xr(jr,3),yr(jr,3))-(150+xr(jr,2),yr(jr,2)),cll
'line (150+xr(jr,3),yr(jr,3))-(150+xr(jr,4),yr(jr,4)),cll
'line (150+xr(jr,1),yr(jr,1))-(150+xr(jr,4),yr(jr,4)),cll

'for jrr=1 to 6
'line (180+xr(jrr,1),yr(jrr,1)+(jrr-3.5)*50)-(180+xr(jrr,2),yr(jrr,2)+(jrr-3.5)*50),clll
'line (180+xr(jrr,3),yr(jrr,3)+(jrr-3.5)*50)-(180+xr(jrr,2),yr(jrr,2)+(jrr-3.5)*50),clll
'line (180+xr(jrr,3),yr(jrr,3)+(jrr-3.5)*50)-(180+xr(jrr,4),yr(jrr,4)+(jrr-3.5)*50),clll
'line (180+xr(jrr,1),yr(jrr,1)+(jrr-3.5)*50)-(180+xr(jrr,4),yr(jrr,4)+(jrr-3.5)*50),clll
'next

'line (180+xr(jr,1),yr(jr,1)+(jr-3.5)*50)-(180+xr(jr,2),yr(jr,2)+(jr-3.5)*50),cll
'line (180+xr(jr,3),yr(jr,3)+(jr-3.5)*50)-(180+xr(jr,2),yr(jr,2)+(jr-3.5)*50),cll
'line (180+xr(jr,3),yr(jr,3)+(jr-3.5)*50)-(180+xr(jr,4),yr(jr,4)+(jr-3.5)*50),cll
'line (180+xr(jr,1),yr(jr,1)+(jr-3.5)*50)-(180+xr(jr,4),yr(jr,4)+(jr-3.5)*50),cll


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
cls
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

thechain:
clear
cls
chain "fe963"
return

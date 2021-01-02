$compile chain
scrwidth=210
pi=atn(1)*4
screen 9
k=1/40
ax=5
ay=80

window (-scrwidth+50,-150)-(scrwidth+50,150)

randomize timer

def fns(x)
  if x=0 then fns=1 else fns=(sin(x)/x)^2
end def

def fnd(x,y)=fns(k*ax*x)*fns(k*ay*y)

on key(10) gosub theend
key(10) on

cll=11
clll=12

jr=1
thestart:
jc=0
line (100,100)-(100,-100)
line (-100,-100)-(100,-100)
line (-100,-100)-(-100,100)
line (-100,100)-(100,100)

line (180+ax,ay)-(180-ax,ay),clll
line (180+ax,-ay)-(180-ax,-ay),clll
line (180-ax,ay)-(180-ax,-ay),clll
line (180+ax,ay)-(180+ax,-ay),clll

m=0

theloop:
if jc=1 then goto thestart
x=-100+200*rnd
y=-30+60*rnd
if fnd(x,y)>rnd then
 pset (x,y)
rem circle (x,y),.1
 m=m+1
end if
goto theloop

theend:
cls
chain "lbas22.exe"
end
end


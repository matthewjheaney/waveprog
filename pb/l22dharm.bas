nxb%=3
nyb%=3
scrwidth=250
pi=atn(1)*4
dt=.06
dtheta=.01
dr=1
a=1
axescolor=3
circlecolor=2
dim cir(1000)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

circle (0,0),6,circlecolor
paint (0,0),circlecolor
get (-7,7)-(8,-7),cir
cls

key(10) on
on key(10) gosub theend
on key (1) gosub thetadown
key(1) on
on key (2) gosub thetaup
key(2) on
on key (12) gosub r1down
key(12) on
on key (13) gosub r1up
key(13) on
on key (14) gosub r2down
key(14) on
on key (11) gosub r2up
key(11) on

r1=50
r2=0
theta=0

t=0

changeparams:
cls

a1=r1*cos(theta)
a2=r2*cos(theta)
b1=r1*sin(theta)
b2=r2*sin(theta)
x=(a1+a2)*cos(t)-(b1-b2)*sin(t)
y=(a1-a2)*sin(t)+(b1+b2)*cos(t)

put (x-7,y+7),cir,xor

checker=0
theloopzzz:
if checker=1 then goto changeparams
t=t+dt
locate 1,1
print "       R =";
print using " ##.#"; r1;
print "       R =";
print using " ##.#"; r2;
print "       ";chr$(233);" =";
print using " #.##"; theta
print "        1              2"
xx=(a1+a2)*cos(t)-(b1-b2)*sin(t)
yy=(a1-a2)*sin(t)+(b1+b2)*cos(t)
put (x-7,y+7),cir,xor
line (0,0)-(x,y),0
put (xx-7,yy+7),cir,xor
line (0,0)-(xx,yy)
x=xx
y=yy
delay .1
goto theloopzzz

theend:
end

thetadown:
theta=theta-dtheta
checker=1
return

thetaup:
theta=theta+dtheta
checker=1
return

r1down:
if r1>dr then
r1=r1-dr
checker=1
end if
return

r1up:
r1=r1+dr
checker=1
return

r2down:
if r2>dr then
r2=r2-dr
checker=1
end if
return

r2up:
r2=r2+dr
checker=1
return

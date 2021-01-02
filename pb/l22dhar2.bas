nxb%=3
nyb%=3
scrwidth=300
pi=atn(1)*4
dt=.06
a=1
axescolor=3
circlecolor=2
dim cir(1000)

input "r1: ",r1
input "r2: ",r2
input "theta: ", theta

a1=r1*cos(theta)
a2=r2*cos(theta)
b1=r1*sin(theta)
b2=r2*sin(theta)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

circle (0,0),6,circlecolor
paint (0,0),circlecolor
get (-7,7)-(8,-7),cir
cls

key(10) on
on key(10) gosub theend

t=0

x=(a1+a2)*cos(t)-(b1-b2)*sin(t)
y=(a1-a2)*sin(t)+(b1+b2)*cos(t)

put (x-7,y+7),cir,xor

theloopzzz:
t=t+dt
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

drawit:
REM do the drawing
t=t+dt
xx1=50*cos(t)-4
yy1=50*sin(t)+4
xx2=100+100*frac(t/2/pi)-4
yy2=200-100*frac(t/2/pi)+4
put (xx1,yy1),cir,xor
put (x1,y1),cir,xor
put (xx1,75+4),cir,xor
put (x1,75+4),cir,xor
put (75-4.5,yy1),cir,xor
put (75-4.5,y1),cir,xor
put (xx1,yy2),cir,xor
put (x1,y2),cir,xor
put (xx2,yy1),cir,xor
put (x2,y1),cir,xor
x1=xx1
y1=yy1
x2=xx2
y2=yy2
return

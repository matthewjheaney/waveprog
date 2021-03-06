$compile chain
nxb%=3
nyb%=3
scrwidth=210
pi=atn(1)*4
dt=.06
REM kk is the damping factor exp(-kk*t)
kk=.05
a=1
axescolor=3
circlecolor=2
dim cir(500)

screen 9,,0,0
window (-scrwidth+75,-150+75)-(scrwidth+75,150+75)

circle (0,0),3,circlecolor
paint (0,0),circlecolor
get (-4,4)-(5,-4),cir
cls

key(10) on
on key(10) gosub theend

locate 6,54
print "e     e    ="
locate 5,55
print "iwt   -at"
locate 9,43
print " e    cos(wt) + i e    sin(wt)"
locate 8,45
print "-at              -at"
locate 12,56
print "a =";kk
locate 20,28
print "Re(z) ";chr$(26)
locate 20,50
print "t ";chr$(26)
locate 7,27
print "t"
locate 8,27
print chr$(25)
locate 2,28
print "Re(z) ";chr$(26)
locate 17,25
print "Im(z)"
locate 16,27
print chr$(24)
locate 17,42
print "Im(z)"
locate 16,44
print chr$(24)
line (-50,200)-(50,200),axescolor
line (0,200)-(0,100),axescolor
line (100,0)-(200,0),axescolor
line (100,-50)-(100,50),axescolor
line (0,-50)-(0,50),axescolor
line (50,0)-(-50,0),axescolor
line (75,-50)-(75,50),axescolor
line (50,75)-(-50,75),axescolor

thestartzzz:
t=0
x1=50*cos(t)-4
y1=50*sin(t)+4
x2=100+100*frac(t/2/pi)-4
y2=200-100*frac(t/2/pi)+4
put (x1,y1),cir,xor
put (x1,75+4),cir,xor
put (75-4.5,y1),cir,xor
put (x1,y2),cir,xor
put (x2,y1),cir,xor
theloopzzz:
gosub drawit
delay .06
goto theloopzzz

drawit:
REM do the drawing
t=t+dt
xx1=50*exp(-kk*t)*cos(t)-4
yy1=50*exp(-kk*t)*sin(t)+4
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

line (x1+4,y1-4)-(xx1+4,yy1-4)
if xx2>x2 then
line (xx2+4,yy1-4)-(x2+4,y1-4)
line (xx1+4,yy2-4)-(x1+4,y2-4)
end if

x1=xx1
y1=yy1
x2=xx2
y2=yy2
return

theend:
'end
cls
chain "lbas1.exe"
end

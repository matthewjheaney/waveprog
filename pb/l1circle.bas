nxb%=3
nyb%=3
scrwidth=200
pi=atn(1)*4
dt=.05
a=1
axescolor=3
circlecolor=2

screen 9,,1,1
window (-scrwidth+75,-150+75)-(scrwidth+75,150+75)

screen 9,,0,0
window (-scrwidth+75,-150+75)-(scrwidth+75,150+75)

key(10) on
on key(10) gosub theend

thestartzzz:
t=0
viewscr=0
writescr=0
theloopzzz:
screen 9,,writescr,viewscr
cls
gosub drawit
swap viewscr, writescr
goto theloopzzz

theend:
end

drawit:
REM do the drawing
locate 6,54
print "e    ="
locate 5,55
print "iwt"
locate 8,47
print "cos(wt) + i sin(wt)"
circle (50*cos(t),50*sin(t)),2,circlecolor
circle (50*cos(t),75),2,circlecolor
circle (75,50*sin(t)),2,circlecolor
circle (50*cos(t),200-100*frac(t/2/pi)),2,circlecolor
circle (100+100*frac(t/2/pi),50*sin(t)),2,circlecolor
line (-50,200)-(50,200),axescolor
line (0,200)-(0,100),axescolor
line (100,0)-(200,0),axescolor
line (100,-50)-(100,50),axescolor
line (0,-50)-(0,50),axescolor
line (50,0)-(-50,0),axescolor
line (75,-50)-(75,50),axescolor
line (50,75)-(-50,75),axescolor
t=t+dt
pset (100,0)
for tt=0 to 2*pi+.01 step pi/15
line -(100+100*tt/2/pi,50*sin(tt))
next
pset (50,200)
for tt=0 to 2*pi+.01 step pi/16
line -(50*cos(tt),200-100*tt/2/pi)
next
return

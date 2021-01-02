nxb%=3
nyb%=3
scrwidth=150
pi=atn(1)*4
dt=.05
a=1.5

screen 9,,1,1
window (-scrwidth,-250)-(scrwidth,100)

screen 9,,0,0
window (-scrwidth,-250)-(scrwidth,100)

key(10) on
on key(10) gosub theend

thestartzzz:
t=0
m=1
theloopzzz:
'sound 60+10*cos(t),.4
delay .054
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloopzzz

theend:
end

drawit:
REM do the drawing
pset (-60,-10)
for tt=0 to 6*pi step pi/9
line -(-60+tt*(10+2*cos(t)*a)/pi+8*sin(tt),-10*cos(tt)),3
next
line (12*cos(t)*a,-20)-(12*cos(t)*a,20),12
line (12*cos(t)*a+20,-20)-(12*cos(t)*a+20,20),12
line (12*cos(t)*a,-20)-(12*cos(t)*a+20,-20),12
line (12*cos(t)*a,20)-(12*cos(t)*a+20,20),12
line (10,-22)-(10,-31)
line (10,-22)-(12,-25)
line (10,-22)-(8,-25)
line (-60,-21)-(60,-21)
line (-60,-21)-(-60,30)
line (-100,-150)-(100,-150)
line (-100,-200)-(-100,-100)
pset (-100,-100),5
for tt=0 to 2*pi+.1 step .3
line -(-100+tt*200/2/pi,-150+50*cos(tt)),6
next
circle (-100+frac(t/2/pi)*200,-150+50*cos(t)),3,5
t=t+dt
return

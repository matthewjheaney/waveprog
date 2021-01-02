$compile chain
nxb%=3
nyb%=3
scrwidth=150
pi=atn(1)*4
dt=.1
a=1.5
dim cir(500)
dim s1(2400)
dim s2(2400)

sprc=11
screen 9,,1,1
window (-scrwidth,-250)-(scrwidth,100)

screen 9,,0,0
window (-scrwidth,-250)-(scrwidth,100)

screen 9,,1,0
circle (0,0),3,13
paint (0,0),13
get (-4,4)-(5,-4),cir
cls

key(10) on
on key(10) gosub theend

thestartzzz:
screen 9,0,0
t=0
pset (-60,-10),sprc
for tt=0 to 6*pi step pi/9
line -(-60+tt*(10+2*cos(t)*a)/pi+8*sin(tt),-10*cos(tt)),sprc
next
line (12*cos(t)*a,-20)-(12*cos(t)*a,20),12
line (12*cos(t)*a+20,-20)-(12*cos(t)*a+20,20),12
line (12*cos(t)*a,-20)-(12*cos(t)*a+20,-20),12
line (12*cos(t)*a,20)-(12*cos(t)*a+20,20),12
line(-12*a+5,-75)-(12*a+15,-75)
line(10,-75)-(10,-175)
pset (12*a+10,-75),5
for tt=0 to 2*pi+pi/100 step pi/50
line -(12*cos(tt)*a+10,-75-tt*100/2/pi),11
next
y=-75-frac((t)/2/pi)*100+3
x=12*cos(t)*a+10-4
put (x,y),cir,xor
get (-62,30)-(62,-30),s2
theloopzzz:
'delay .054
screen 9,,1,0
cls
gosub drawit
screen 9,,0,0
yy=-75-frac((t)/2/pi)*100+3
xx=12*cos(t)*a+10-4
put (xx,yy),cir,xor
put (x,y),cir,xor
put (-62,30),s2,xor
put (-62,30),s1,xor
x=xx
y=yy
goto theloopzzz

drawit:
REM do the drawing

put (-62,30),s2,xor
get (-62,30)-(62,-30),s1
t=t+dt
cls
pset (-60,-10),sprc
for tt=0 to 6*pi step pi/9
line -(-60+tt*(10+2*cos(t)*a)/pi+8*sin(tt),-10*cos(tt)),sprc
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
get (-62,30)-(62,-30),s2
return


theend:
'end
cls
chain "lbas0.exe"
end


end


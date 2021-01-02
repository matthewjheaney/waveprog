nxb%=3
nyb%=3
scrwidth=150
pi=atn(1)*4
dt=.1
dx=.2
a=1
a=.7
tau=1
v=3
ep=50
def fnps1(x,t)=ep*2*tau/(tau^2+(t-x/v)^2)
def fnps2(x,t)=ep*26*tau*x*a^2/24/v^3*(6*(t-x/v)^3/(tau^2+(t-x/v)^2)^4-(t-x/v)/(tau^2+(t-x/v)^2)^3)

screen 9,,1,1
window (-.1*scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-.1*scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

thestartzzz:
t=0
m=1
theloopzzz:
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
x=-.1*scrwidth
pset (-.1*scrwidth,fnps1(x,t)+fnps2(x,t))
for x=-.1*scrwidth to scrwidth step dx
line -(x+dx,fnps1(x+dx,t)+fnps2(x+dx,t))
next
x=-.1*scrwidth
pset (-.1*scrwidth,fnps1(x,t)),11
for x=-.1*scrwidth to scrwidth step 3*dx
pset (x+dx,fnps1(x+dx,t)),11
next
t=t+dt
return

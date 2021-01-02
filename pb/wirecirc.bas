scrwidth=220
pi=atn(1)*4
dt=.03
dth=pi/50
o=2
cllp=13
cllm=14

def fnr(th,t)=50+5*cos(11*th)*cos(o*t)

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

thestart:
t=0
m=1
theloop:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop

theend:
end

drawit:
REM do the drawing
for th=0 to 2*pi step dth
line (fnr(th,t)*cos(th),fnr(th,t)*sin(th))-(fnr(th+dth,t)*cos(th+dth),fnr(th+dth,t)*sin(th+dth))
next
t=t+dt
return



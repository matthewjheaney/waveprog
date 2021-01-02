scrwidth=250
pi=atn(1)*4
dt=.03
cllp=13
cllm=14

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
for
next
t=t+dt
return



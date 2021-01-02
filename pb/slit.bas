$compile chain
scrwidth=220
pi=atn(1)*4
dt=.1
cllp=13
cllm=14

screen 7,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 7,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

thestart:
t=0
m=1
theloop:
screen 7,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop

theend:
cls
chain "lbas21.exe"
end
end

drawit:
REM do the drawing
line (0,150)-(0,3)
line (0,-150)-(0,-3)
delay .05
for j=-scrwidth-60 to 0 step 20
line (j+20*(frac(t)-1),150)-(j+20*(frac(t)-1),-150),cllp
circle (0,0),(-j+20*frac(t)),cllp,0,pi/2
circle (0,0),(-j+20*frac(t)),cllp,3*pi/2,2*pi
next
t=t+dt
delay .054
return



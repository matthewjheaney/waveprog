$compile chain
scrwidth=220
sw=scrwidth
pi=atn(1)*4
dt=.1
cllp=13
cllm=14
l=20
th=0
dth=.05

screen 7,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 7,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

key(11) on
on key(11) gosub yplus

key(14) on
on key(14) gosub yminus

thestart:
tht=0
lovc=l/cos(th)
delx=300*tan(th)
delt=20*tan(th)
t=0
m=1
theloop:
if tht=1 then goto thestart
screen 7,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop

drawit:
REM do the drawing
line (0,150)-(0,23)
line (0,17)-(0,-17)
line (0,-150)-(0,-23)
delay .05
for x=lovc*frac(t)-sw to 0 step lovc
line (x,-150)-(x-delx,150),cllp
xx=x
next
if th<>0 then
  for x=xx-delx to 0 step lovc
  line (x,150)-(0,150+x/tan(th)),cllp
  next
end if
for x=0 to sw step l
circle (0,20),(x-delt+l*frac(t)),cllp,0,pi/2
circle (0,20),(x-delt+l*frac(t)),cllp,3*pi/2,2*pi
circle (0,-20),(x+delt+l*frac(t)),cllp,0,pi/2
circle (0,-20),(x+delt+l*frac(t)),cllp,3*pi/2,2*pi
next
t=t+dt
delay .054
return


yplus:
th=th+dth
tht=1
return

yminus:
if th>=dth then
th=th-dth
tht=1
end if
return


theend:
cls
chain "lbas22.exe"
end
end

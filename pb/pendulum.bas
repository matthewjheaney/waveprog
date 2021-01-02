$compile chain
scrwidth=205
pi=atn(1)*4
dt=.003
cllp=13
cllm=14

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

key(1) on
on key(1) gosub epminus

key(2) on
on key(2) gosub epplus


o02=5
ep=-5
sg=1
clp=2
dep=9.95/5

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

drawit:
REM do the drawing
circle (0,0),4,clp
call dth(ep,o02,dt,th,sg)
line (4*sin(th),-4*cos(th))-(90*sin(th),-90*cos(th)),clp
circle (100*sin(th),-100*cos(th)),10,13
t=t+dt
return

sub dth(ep,o02,dt,th,sg)
local th0
  th0=th
if ep>o02 then
th=th+dt*sg*sqr(2*(ep+o02*cos(th)))
else
th=th+dt*sg*sqr(2*(ep+o02*cos(th)))
 if ep+o02*cos(th)<0 then th=th0:sg=-sg
end if
end sub

epminus:
ep=ep-dep
return

epplus:
ep=ep+dep
return

theend:
cls
chain "lbas2.exe"
end

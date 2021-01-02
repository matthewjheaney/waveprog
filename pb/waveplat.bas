$compile chain
scrwidth=190
pi=atn(1)*4
dt=.05
om=1
u=130
phi=0
x0=5
y0=15
dx=1
dy=1
dmax=20
wp=0
wpmax=20
cllo=12
cllp=13
cllm=14
tg=0

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(1) on
on key(1) gosub wpminus

key(2) on
on key(2) gosub wpplus

key(3) on
on key(3) gosub toggle

key(11) on
on key(11) gosub yplus

key(14) on
on key(14) gosub yminus

key(13) on
on key(13) gosub xplus

key(12) on
on key(12) gosub xminus


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

drawit:
REM do the drawing
'for
'next
print
print "   ";wp/wpmax
line (1.1*u*cos(x0*pi/dmax),1.1*u*sin(x0*pi/dmax))-(-1.1*u*cos(x0*pi/dmax),-1.1*u*sin(x0*pi/dmax)),9
if tg=1 then line (1.1*u*cos(y0*pi/dmax),1.1*u*sin(y0*pi/dmax))-(-1.1*u*cos(y0*pi/dmax),-1.1*u*sin(y0*pi/dmax)),10
line (0,0)-(u*cos(x0*pi/dmax)*cos(t+phi/2),u*sin(x0*pi/dmax)*cos(t-phi/2)),cllp
circle (u*cos(x0*pi/dmax)*cos(t+phi/2),u*sin(x0*pi/dmax)*cos(t-phi/2)),2.5,cllp
circle (u*cos(x0*pi/dmax)*cos(t+phi/2),u*sin(x0*pi/dmax)*cos(t-phi/2)),2,cllp
circle (u*cos(x0*pi/dmax)*cos(t+phi/2),u*sin(x0*pi/dmax)*cos(t-phi/2)),1,cllp
line (0,0)-(u*cos(x0*pi/dmax)*cos(t+phi/2),u*sin(x0*pi/dmax)*cos(t+phi/2)),cllo
circle (u*cos(x0*pi/dmax)*cos(t+phi/2),u*sin(x0*pi/dmax)*cos(t+phi/2)),2.5,cllo
circle (u*cos(x0*pi/dmax)*cos(t+phi/2),u*sin(x0*pi/dmax)*cos(t+phi/2)),2,cllo
circle (u*cos(x0*pi/dmax)*cos(t+phi/2),u*sin(x0*pi/dmax)*cos(t+phi/2)),1,cllo
v=u*(cos(t)*cos(phi/2)*cos((x0-y0)*pi/dmax)-sin(t)*sin(phi/2)*cos((x0+y0)*pi/dmax))
if tg=1 then
 line (0,0)-(v*cos(y0*pi/dmax),v*sin(y0*pi/dmax)),cllm
 circle (v*cos(y0*pi/dmax),v*sin(y0*pi/dmax)),1,cllm
 circle (v*cos(y0*pi/dmax),v*sin(y0*pi/dmax)),2,cllm
 circle (v*cos(y0*pi/dmax),v*sin(y0*pi/dmax)),2.5,cllm
end if
delay .054
t=t+dt
return

wpplus:
wp=wp+1
if wp=wpmax then wp=0
phi=2*pi*wp/wpmax
return

wpminus:
wp=wp-1
if wp=-1 then wp=wpmax-1
phi=2*pi*wp/wpmax
return

xplus:
x0=x0+dx
return

yplus:
y0=y0+dy
return

xminus:
x0=x0-dx
return

yminus:
y0=y0-dy
return

toggle:
tg=1-tg
return

theend:
cls
chain "lbas18.exe"
end
end




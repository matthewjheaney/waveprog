$compile chain
scrwidth=400
pi=atn(1)*4
dt=.1
cllp=13
cllm=14
ell=200
dd=20
nx=2
ny=1
om=1
a=20
om=sqr(nx^2+ny^2)
a=17/sqr(nx^2+ny^2+.1)

screen 9,,1,1
window (-scrwidth/4,-50)-(3/4*scrwidth,250)

screen 9,,0,0
window (-scrwidth/4,-50)-(3/4*scrwidth,250)

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

theend:
cls
end

drawit:
REM do the drawing
'print
'print "   n  =";nx;"  n  =";ny
'print "    x        y"
line (-3,-3)-(-3,ell+3),cllp
line (ell+3,-3)-(ell+3,ell+3),cllp
line (-3,ell+3)-(ell+3,ell+3),cllp
line (-3,-3)-(ell+3,-3),cllp
for x=0 to ell step dd
for y=0 to ell step dd
circle (x+a*nx*sin(nx*pi*x/ell)*cos(ny*pi*y/ell)*sin(om*t),y+a*ny*sin(ny*pi*y/ell)*cos(nx*pi*x/ell)*sin(om*t)),1,cllm
next
next
delay .054
t=t+dt
return

xplus:
t=0
nx=nx+1
om=sqr(nx^2+ny^2)
a=17/sqr(nx^2+ny^2+.1)
return

yplus:
t=0
ny=ny+1
om=sqr(nx^2+ny^2)
a=17/sqr(nx^2+ny^2+.1)
return

xminus:
if nx>0 then
t=0
nx=nx-1
om=sqr(nx^2+ny^2)
a=17/sqr(nx^2+ny^2+.1)
end if
return

yminus:
if ny>0 then
t=0
ny=ny-1
om=sqr(nx^2+ny^2)
a=17/sqr(nx^2+ny^2+.1)
end if
return


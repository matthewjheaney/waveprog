$compile chain
' traveling waves in a 2D gas in an infinite tube
scrwidth=400
pi=atn(1)*4
dt=.1
cllp=13
cllm=14
ell=200
dd=20
ny=0
om=3
i=1
lomoverv=3*pi-.35
lomoverv=3*pi-1.6
kell=sqr(lomoverv^2-ny^2*pi^2)
k=kell/ell
a=10
norm=a/sin(kell)/kell

def fnx(x,k,kell,i,t)
  if i=1 then fnx=-a*sin(k*x-om*t)
  if i=0 then fnx=norm*kell*exp(k*x)*sin(om*t)
end def

def fny(x,k,i,t)
  if i=1 then fny=norm*cos(k*x-om*t)
  if i=0 then fny=norm*exp(k*x)*sin(om*t)
end def

screen 9,,1,1
window (-scrwidth/4,-50)-(3/4*scrwidth,250)

screen 9,,0,0
window (-scrwidth/4,-50)-(3/4*scrwidth,250)

key(11) on
on key(11) gosub yplus

key(14) on
on key(14) gosub yminus

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
chain "lbas20.exe"
end
end

drawit:
REM do the drawing
'line (-3,-3)-(-3,ell+3),cllp
'line (ell+3,-3)-(ell+3,ell+3),cllp
line (-scrwidth/4,ell+3)-(scrwidth*3/4,ell+3),cllp
line (-scrwidth/4,-3)-(scrwidth*3/4,-3),cllp
for x=-scrwidth/4 to scrwidth*3/4 step dd
for y=0 to ell step dd
circle (x+fnx(x,k,kell,i,t)*cos(ny*pi*y/ell),y-pi*ny*sin(ny*pi*y/ell)*fny(x,k,i,t)),1,cllm
next
next
delay .054
t=t+dt
return

yplus:
t=0
if ny<2 then ny=ny+1
  if ny*pi<=lomoverv then
    k=sqr(lomoverv^2-ny^2*pi^2)/ell
    kell=sqr(lomoverv^2-ny^2*pi^2)
    i=1
    norm=-a/kell
  else
    k=sqr(ny^2*pi^2-lomoverv^2)/ell
    kell=sqr(ny^2*pi^2-lomoverv^2)
    i=0
    norm=a/exp(kell)/kell
  end if
return

yminus:
if ny>0 then
t=0
ny=ny-1
  if ny*pi<=lomoverv then
    k=sqr(lomoverv^2-ny^2*pi^2)/ell
    kell=sqr(lomoverv^2-ny^2*pi^2)
    i=1
    norm=-a/kell
  else
    k=sqr(ny^2*pi^2-lomoverv^2)/ell
    kell=sqr(ny^2*pi^2-lomoverv^2)
    i=0
    norm=a/exp(kell)/kell
  end if
end if
return


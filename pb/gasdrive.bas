$compile chain
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

def fnx(x,k,kell,i)
  if i=1 then fnx=-norm*kell*sin(k*x)
  if i=0 then fnx=norm*kell*(exp(k*x)-exp(-k*x))/2
end def

def fny(x,k,i)
  if i=1 then fny=norm*cos(k*x)
  if i=0 then fny=norm*(exp(k*x)+exp(-k*x))/2
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
end
chain "lbas17.exe"
end
end

drawit:
REM do the drawing
print
print "   n  =";ny
print "    y"
locate 23,5
print "lambda"
line (-3,-3)-(-3,ell+3),cllp
'line (ell+3,-3)-(ell+3,ell+3),cllp
line (-3,ell+3)-(ell+3,ell+3),cllp
line (-3,-3)-(ell+3,-3),cllp
for x=0 to ell step dd
for y=0 to ell step dd
circle (x+fnx(x,k,kell,i)*cos(ny*pi*y/ell)*sin(om*t),y-pi*ny*sin(ny*pi*y/ell)*fny(x,k,i)*sin(om*t)),1,cllm
next
next
line (0,-20)-(2*pi/k,-20)
delay .054
t=t+dt
return

yplus:
t=0
ny=ny+1
  if ny*pi<=lomoverv then
    k=sqr(lomoverv^2-ny^2*pi^2)/ell
    kell=sqr(lomoverv^2-ny^2*pi^2)
    i=1
    norm=-a/sin(kell)/kell
  else
    k=sqr(ny^2*pi^2-lomoverv^2)/ell
    kell=sqr(ny^2*pi^2-lomoverv^2)
    i=0
    norm=a*2/(exp(kell)-exp(-kell))/kell
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
    norm=-a/sin(kell)/kell
  else
    k=sqr(ny^2*pi^2-lomoverv^2)/ell
    kell=sqr(ny^2*pi^2-lomoverv^2)
    i=0
    norm=a*2/(exp(kell)-exp(-kell))/kell
  end if
end if
return


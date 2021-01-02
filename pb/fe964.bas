$compile chain
common chtime
on timer(chtime) gosub thechain
timer on
on key(9) gosub thechain
key(9) on
scrwidth=400
pi=atn(1)*4
dt=.1
cllp=13
cllm=14
ell=200
dd=20
ny=2
om=3
i=1
lomoverv=3*pi-.3
kell=sqr(lomoverv^2-ny^2*pi^2)
k=kell/ell
a=4
norm=a/sin(kell)/kell
mmax=600

def fnx(x,k,kell,i)
  if i=1 then fnx=-norm*kell*sin(k*x)
  if i=0 then fnx=norm*kell*(exp(k*x)-exp(-k*x))/2
end def

def fny(x,k,i)
  if i=1 then fny=norm*cos(k*x)
  if i=0 then fny=norm*(exp(k*x)+exp(-k*x))/2
end def

screen 9,,1,1
window (-scrwidth/4+20,-50)-(3/4*scrwidth+20,250)

screen 9,,0,0
window (-scrwidth/4+20,-50)-(3/4*scrwidth+20,250)

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
if m>mmax and ny=2 then a=4:gosub yplus:m=1
if m>mmax and ny=3 then a=4:gosub yminus:m=1
goto theloop

theend:
cls
end

drawit:
REM do the drawing
locate 4,9
print "y=a"
locate 22,9
print "y=0"
locate 23,15
print "x=0"
locate 23,57
print "x=a"

locate 1,73
print "PROB 4"
locate 3,5
if ny=2 then print "A"
if ny=3 then print "B"
line (-3,-3)-(-3,ell+3),cllp
'line (ell+3,-3)-(ell+3,ell+3),cllp
line (-3,ell+3)-(ell+3,ell+3),cllp
line (-3,-3)-(ell+3,-3),cllp
for x=0 to ell step dd
for y=0 to ell step dd
circle (x+fnx(x,k,kell,i)*cos(ny*pi*y/ell)*sin(om*t),y-pi*ny*sin(ny*pi*y/ell)*fny(x,k,i)*sin(om*t)),1,cllm
next
next
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

thechain:
clear
screen 9,,1,1
cls
screen 9,,0,0
cls
chain "fe961"
return

$compile chain
REM water wave tank
pi=atn(1)*4
height=70
dt=.5
omega=1
nk=1
k=nk*pi/80
eps=5
clp=11
clp2=14
cll=10
mmax=40
nx=20
ny=6
dxy=80/nx
dd=2*dxy*ny
dim xp(nx,ny,mmax)
dim yp(nx,ny,mmax)


def fnsinh(x)=(exp(x)-exp(-x))/2
def fncosh(x)=(exp(x)+exp(-x))/2
def fnpsix(x,y,t)=-eps*sin(k*x)*fncosh(k*y)*cos(t)
def fnpsiy(x,y,t)=eps*cos(k*x)*fnsinh(k*y)*cos(t)

for ix=0 to nx
for iy=0 to ny
for im=1 to mmax
xp(ix,iy,im)=ix*dxy+fnpsix(ix*dxy,iy*dxy,2*pi*im/mmax)
yp(ix,iy,im)=iy*dxy+fnpsiy(ix*dxy,iy*dxy,2*pi*im/mmax)
next
next
next

screen 9,,1,1
window (-10,-10)-(90,height-10)

screen 9,,0,0
window (-10,-10)-(90,height-10)

on key(10) gosub theend
key(10) on
m=1
theloop:
screen 9,,(m mod 2),((m-1) mod 2)
delay .05
cls
gosub drawit11p5
m=m+1
REM if you want discrete repeats
if m>mmax then m=1
goto theloop

theend:
cls
chain "lbas20.exe"
end
end
return

drawit11p5:
REM do the drawing
line (-1,-1)-(81,-1),cll
line (-1,-1)-(-1,dd+1),cll
line (81,-1)-(81,dd+1),cll
line (-1,dd+1)-(81,dd+1),cll
for ix=0 to nx
for iy=0 to ny
circle (xp(ix,iy,m),yp(ix,iy,m)),.5,clp
circle (80-xp(ix,iy,m),dd-yp(ix,iy,m)),.5,clp2
next
next
'delay .054
return


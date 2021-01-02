$compile chain
scrnum=9
'on timer(180) gosub thechain
'timer on
on key(10) gosub theend
key(10) on
on key(1) gosub s1:
key(1) on
on key(2) gosub s2:
key(2) on

def fnthreedx(x,y,z)=(x+y)/sqr(2)
def fnthreedy(x,y,z)=z+c*(y-x)

sub threedline(x1,y1,z1,x2,y2,z2,cll)
  line (fnthreedx(x1,y1,z1),fnthreedy(x1,y1,z1))-(fnthreedx(x2,y2,z2),fnthreedy(x2,y2,z2)),cll
end sub

cll=13
dz=10
nxb%=4
nyb%=4
scrwidth=220
pi=atn(1)*4
ell=30
ellx=ell*nxb%
elly=ell*nyb%
c=.2
omega=1
dt=.15
repeattime=300

dim p$(3)
p$(1)="A"
p$(2)="B"

def fnsinh(x)=(exp(x)-exp(-x))/2
def fncosh(x)=(exp(x)+exp(-x))/2
def fnasin(x)=atn(x/(1-x^2)^(1/2))
def fnasinh(x)=log(x+(x^2+1)^(1/2))
def fnacosh(x)=log(x+(x^2-1)^(1/2))

o2=.3


k1=2*fnasin((o2-(sin(pi/(nyb%+1)/2))^2))
k2=2*fnasinh(((sin(2*pi/(nyb%+1)/2))^2-o2)^(1/2))
'k3=2*fnacosh((o2-(sin(pi/(nyb%+1)/2))^2)^(1/2))


a1=1/sin(k1*(nyb%+1))
a2=1/fnsinh(k2*(nyb%+1))
'a3=1/fncosh(k3*(nyb%+1))


def fnamem(nx%,ny%,nn%)
if nn%=1 then fnamem=2*a1*sin(k1*nx%)*sin(pi*ny%/(nyb%+1))
if nn%=2 then fnamem=2*a2*fnsinh(k2*nx%)*sin(2*pi*ny%/(nyb%+1))
if nn%=3 then fnamem=2*a3*(-1)^nx%*fnsinh(k2*nx%)*sin(2*pi*ny%/(nyb%+1))
end def

screen scrnum,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen scrnum,,0,0
window (-scrwidth,-150)-(scrwidth,150)

on key(10) gosub theend
key(10) on

thenext1:
nn%=1
t=0
m=1
theloopmem:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawitmem
m=m+1
REM if you want discrete repeats
'if m>repeattime then goto thenext2
if m>repeattime then m=1:nn%=3-nn%
goto theloopmem

drawitmem:
REM do the drawing
locate 4,10
print p$(nn%)
call threedline(-ellx,-elly,0,ellx,-elly,0,cll)
call threedline(-ellx,-elly,0,-ellx,elly,0,cll)
'call threedline(ellx,elly,0,ellx,-elly,0,cll-1)
call threedline(ellx,elly,0,-ellx,elly,0,cll)
for nx=0 to nxb%
for ny=0 to nyb%
call threedline(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fnamem(nx,ny,nn%),-ellx+2*ellx*(nx+1)/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fnamem((nx+1),(ny),nn%),cll)
call threedline(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fnamem(nx,ny,nn%),-ellx+2*ellx*(nx)/(nxb%+1),-elly+2*elly*(ny+1)/(nyb%+1),dz*sin(omega*t)*fnamem((nx),(ny+1),nn%),cll)
next
next

for nx=1 to nxb%
for ny=1 to nyb%
circle (fnthreedx(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fnamem(nx,ny,nn%)),fnthreedy(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fnamem(nx,ny,nn%))),1.5
next
next

for nx=nxb%+1 to nxb%+1
for ny=0 to nyb%
'call threedline(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fnamem(nx,ny,nn%),-ellx+2*ellx*(nx+1)/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fnamem((nx+1),(ny),nn%),cll)
call threedline(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fnamem(nx,ny,nn%),-ellx+2*ellx*(nx)/(nxb%+1),-elly+2*elly*(ny+1)/(nyb%+1),dz*sin(omega*t)*fnamem((nx),(ny+1),nn%),cll)
next
next

call threedline(100,-300,0,100,-300,20,15)
call threedline(100,-300,0,80,-300,0,15)
call threedline(100,-300,0,100,-280,0,15)

locate 17,15
print "z";
locate 19,19
print "x";
locate 19,11
print "y";

delay .054

t=t+dt
return

s1:
m=1
nn%=1
return

s2:
m=1
nn%=2
return

theend:
cls
chain "lbas17.exe"
end
end
return


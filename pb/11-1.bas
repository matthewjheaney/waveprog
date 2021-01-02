on error goto fixit
' note x and y are interchanged on the printed label on screen
cll=11
dz=15
nxb%=4
nyb%=5
scrwidth=200
pi=atn(1)*4
modex%=1
modey%=1
omn=sqr((modex%^2/(nxb%+1)^2+modey%^2/(nyb%+1)^2)/2)
ell=30
ellx=ell*nxb%
elly=ell*nyb%
c=.2
omega=1
dt=.1

def fnx(x,y,z)=(x+y)/sqr(2)
def fny(x,y,z)=z+c*(y-x)

sub threedline(x1,y1,z1,x2,y2,z2,cll)
  line (fnx(x1,y1,z1),fny(x1,y1,z1))-(fnx(x2,y2,z2),fny(x2,y2,z2)),cll
end sub

def fna(nx%,ny%)=sin(modex%*pi*nx%/(nxb%+1))*sin(modey%*pi*ny%/(nyb%+1))

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

on key(10) gosub theend
key(10) on
on key (11) gosub xup11p1
key(11) on
on key (14) gosub xdown11p1
key(14) on
on key (13) gosub yup11p1
key(13) on
on key (12) gosub ydown11p1
key(12) on


t=0
m=1
theloop11p1:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit11p1
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop11p1

theend:
end

drawit11p1:
REM do the drawing
call threedline(-ellx,-elly,0,ellx,-elly,0,cll)
call threedline(-ellx,-elly,0,-ellx,elly,0,cll)
call threedline(ellx,elly,0,ellx,-elly,0,cll)
call threedline(ellx,elly,0,-ellx,elly,0,cll)
for nx=0 to nxb%
for ny=0 to nyb%
call threedline(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fna(nx,ny),-ellx+2*ellx*(nx+1)/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fna((nx+1),(ny)),cll)
call threedline(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fna(nx,ny),-ellx+2*ellx*(nx)/(nxb%+1),-elly+2*elly*(ny+1)/(nyb%+1),dz*sin(omega*t)*fna((nx),(ny+1)),cll)
next
next
call threedline(1.2*ellx,0,-29,1.2*ellx,30,-29,12)
call threedline(1.2*ellx,30,-29,1.2*ellx,25,-26,12)
call threedline(1.2*ellx,30,-29,1.2*ellx,25,-32,12)
call threedline(0,-1.2*elly,-20,-30,-1.2*elly,-20,12)
call threedline(-30,-1.2*elly,-20,-25,-1.2*elly,-23,12)
call threedline(-30,-1.2*elly,-20,-25,-1.2*elly,-17,12)
print
print "   n  =";modey%;"  n  =";modex%
print "    x        y"
locate 18,18
print "y"
locate 18,59
print "x"
delay .05
t=t+dt
return

fixit:
end
resume

xup11p1:
if modex%<nxb% then modex%=modex%+1
omega=sqr((modex%^2/(nxb%+1)^2+modey%^2/(nyb%+1)^2)/2)/omn
return
xdown11p1:
if modex%>1 then modex%=modex%-1
omega=sqr((modex%^2/(nxb%+1)^2+modey%^2/(nyb%+1)^2)/2)/omn
return
yup11p1:
if modey%<nyb% then modey%=modey%+1
omega=sqr((modex%^2/(nxb%+1)^2+modey%^2/(nyb%+1)^2)/2)/omn
return
ydown11p1:
if modey%>1 then modey%=modey%-1
omega=sqr((modex%^2/(nxb%+1)^2+modey%^2/(nyb%+1)^2)/2)/omn
return



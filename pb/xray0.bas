$compile chain
scrwidth=200
pi=atn(1)*4
dim lclr(8)

on key(10) gosub theend
key(10) on

lclr(0)=5
lclr(1)=4
lclr(2)=12
lclr(3)=14
lclr(4)=10
lclr(5)=2
lclr(6)=9
lclr(7)=1

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

gosub drawit

thestart:
m=1
theloop:
t0=0
gosub drawit
screen 9,,(m mod 2),((m-1) mod 2)
cls
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
theloop2:
if t0=1 then goto theloop
goto theloop2

drawit:
cls
cth=cos(th)
sth=sin(th)
for j=0 to 21
line (scrwidth*(j-10.6)/10,-150)-(scrwidth*(j-10.6)/10,100),lclr(j mod 8)
locate 3,30
print "0"
locate 2,34
print chr$(227)
locate 3,34
print chr$(196)
locate 4,34
print "4"
locate 2,38
print chr$(227)
locate 3,38
print chr$(196)
locate 4,38
print "2"
locate 2,41
print "3";chr$(227)
locate 3,41
print chr$(196);chr$(196)
locate 4,42
print "4"
locate 3,46
print chr$(227)
locate 2,49
print "5";chr$(227)
locate 3,49
print chr$(196);chr$(196)
locate 4,50
print "4"
locate 2,53
print "3";chr$(227)
locate 3,53
print chr$(196);chr$(196)
locate 4,54
print "2"
locate 2,57
print "7";chr$(227)
locate 3,57
print chr$(196);chr$(196)
locate 4,58
print "4"
locate 3,61
print "2";chr$(227)
locate 3,20
print "phase"
next
call vector (-50,-25,90,-25,10,15)

viewloop:
goto viewloop

theend:
cls
chain "lbas25.exe"
end
end
return

sub vector(xv,yv,xvv,yvv,va,cl)
local vl
vl=((xvv-xv)^2+(yvv-yv)^2)^(1/2)
line (xv,yv)-(xvv,yvv),cl
line (xvv,yvv)-(xvv-va/vl*(xvv-xv)+va/vl/2*(yvv-yv),yvv-va/vl*(yvv-yv)-va/vl/2*(xvv-xv)),cl
line (xvv,yvv)-(xvv-va/vl*(xvv-xv)-va/vl/2*(yvv-yv),yvv-va/vl*(yvv-yv)+va/vl/2*(xvv-xv)),cl
end sub


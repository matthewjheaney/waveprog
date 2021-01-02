$compile chain
pi=4*atn(1)
n1=5
n2=7.1
dn=.5
dtheta=.1
'these are nearly critical
'n1=10
'n2=4.8
clv=13
cll=11
clb=12
theta1=.5

'CHANGE THE HEIGHT TO GET THE ASPECT RATIO RIGHT
'THE VECTORS AND THE WAVE FRONTS SHOULD BE PERPENDICULAR
height=70

screen 9,,1,1
window (-50,0)-(50,height)

screen 9,,0,0
window (-50,0)-(50,height)

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

angles:
t1=0

l1=100/n1
vl=3/n1
if n2>n1 then vl=3/n2
l2=l1*n1/n2
theta2=atn(n1*sin(theta1)/n2/sqr(1-(n1*sin(theta1)/n2)^2))

ttheta1=tan(theta1)
ttheta2=tan(theta2)

d1=height*ttheta1
d2=height*ttheta2

l1c=l1/cos(theta1)
l2c=l2/cos(theta2)
vc=l1/sin(theta1)

kx1=10*cos(theta1)*n1
ky1=10*sin(theta1)*n1
kx11=kx1-3*cos(theta1-pi/6)
ky11=ky1-3*sin(theta1-pi/6)
kx12=kx1-3*cos(theta1+pi/6)
ky12=ky1-3*sin(theta1+pi/6)
kx2=10*cos(theta2)*n2
ky2=10*sin(theta2)*n2
kx21=kx2-3*cos(theta2-pi/6)
ky21=ky2-3*sin(theta2-pi/6)
kx22=kx2-3*cos(theta2+pi/6)
ky22=ky2-3*sin(theta2+pi/6)

mmax=40
m=1
theloopllp1:
if t1=1 then goto angles
screen 9,,(m mod 2),((m-1) mod 2)
cls
x1=l1c*(mmax-m)/mmax
gosub drawit
m=m+1
if m>mmax then m=1
goto theloopllp1
theend:
cls
chain "lbas16.exe"
end
end
return

drawit:
REM do the drawing
line (0,height)-(0,0),clb,,127
x=x1
thex1loopllp1:
if x>50 then goto outx1loopllp1
line (-x,0)-(-x-d1,height),cll
x=x+l1c
goto thex1loopllp1
outx1loopllp1:
x=x-l1c
y=vc-x1/ttheta1
they1loopllp1:
if y>height then goto outy1loopllp1
line (0,y)-(-d1,y+height),cll
line (0,y)-(d2,y-height),cll
y=y+vc
goto they1loopllp1
outy1loopllp1:
y=y-vc
xx=l2c-(height-y)*ttheta2
thex2loopllp1:
if xx>50 then goto outx2loopllp1
line (xx,height)-(xx+d2,0),cll
xx=xx+l2c
goto thex2loopllp1
outx2loopllp1:

line (-40,20)-(-40+vl*kx1,20+vl*ky1),clv
line (20,20)-(20+vl*kx2,20+vl*ky2),clv
line (vl*kx1-40,vl*ky1+20)-(vl*kx11-40,20+vl*ky11),clv
line (vl*kx1-40,vl*ky1+20)-(vl*kx12-40,20+vl*ky12),clv
line (vl*kx2+20,vl*ky2+20)-(vl*kx21+20,20+vl*ky21),clv
line (vl*kx2+20,vl*ky2+20)-(vl*kx22+20,20+vl*ky22),clv
delay .05
return


xplus:
n2=n2+dn
t1=1
return

yplus:
theta1=theta1+dtheta
t1=1
return

xminus:
n2=n2-dn
t1=1
return

yminus:
theta1=theta1-dtheta
t1=1
return

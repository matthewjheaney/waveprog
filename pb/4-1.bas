$compile chain
bottom=-50
side=430
lside=-100
pi=4*atn(1)
t=1
ii=800*t
tm=.1
dt=1.5
om=.1*dt
dom=.02*dt
a1=1
a2=0
b1=0
b2=1
asp=1
screen 9,,1,1
window (lside,bottom)-(side,220)

screen 9,,0,0
window (lside,bottom)-(side,220)

key(10) on
i=1
theloop31:
on key(10) gosub theend31
theta11=tm*(a1*cos(om*i)+b1*sin(om*i))
theta21=tm*(a1*cos(om*i)+b1*sin(om*i))
theta12=tm*(a2*cos((om+dom)*i)+b2*sin((om+dom)*i))
theta22=tm*(-a2*cos((om+dom)*i)-b2*sin((om+dom)*i))
theta1=theta11+theta12
theta2=theta21+theat22
theta2=tm*(a1*cos(om*i)-a2*cos((om+dom)*i)+b1*sin(om*i)-b2*sin((om+dom)*i))
y1=220-200*cos(theta1)
y2=220-200*cos(theta2)
x1=100-200*sin(theta1)
x2=200-200*sin(theta2)
screen 9,,(i mod 2),((i-1) mod 2)
cls
gosub drawit31
i=i+1
goto theloop31

theend31:
cls
chain "lbas5.exe"
end

drawit31:
circle (x1,y1),7,5,,asp
circle (x2,y2),7,5,,asp
line (x1,y1)-(100,220),13
line (x2,y2)-(200,220),13
line (x1,y1)-(x2,y2),13

y11=190-200*cos(theta11)
y21=190-200*cos(theta21)
x11=100-200*sin(theta11)
x21=200-200*sin(theta21)
circle (x11,y11),7,10,,asp
circle (x21,y21),7,10,,asp

y12=160-200*cos(theta12)
y22=160-200*cos(theta22)
x12=100-200*sin(theta12)
x22=200-200*sin(theta22)
circle (x12,y12),7,11,,asp
circle (x22,y22),7,11,,asp

line (150,-60)-(150,0)
line (100,-60)-(100,0)
line (200,-60)-(200,0)

delay .05
return

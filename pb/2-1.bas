cl=11
clc=12
pi=4*atn(1)
dt=.1
rem omega
o=1
rem gamma
g=.5
dom=.1
rem omega0
o0=2
bottom=0
side=350
dh=100
dr=50
h=10
phi=0
screen 9,,1,1
window (0,bottom)-(side,220)

screen 9,,0,0
window (0,bottom)-(side,220)

dim d1(100)
cls
print "d"
get (0,214)-(4,220),d1

i=1
t=0

key(10) on
key(11) on
key(14) on


theloop21:
on key(10) gosub theend21
on key(11) gosub increase21
on key(14) gosub decrease21
screen 9,,(i mod 2),((i-1) mod 2)
cls
gosub drawit21
i=i+1
t=t+dt

goto theloop21
end


theend21:
end
return

increase21:
a1=2*o*((o0^2-o^2)*(o0^2-o^2-g^2)-o^2*g^2)
b1=g*((o0^2-o^2)^2-4*o^2*(o0^2-o^2)-2*g^2*o^2)
qold=a1*cos(o*t-phi)+b1*sin(o*t-phi)
q=a1*cos(o*t-phi)+b1*sin(o*t-phi)
theiloop21:
if q*qold<=0 then goto theiend21
screen 9,,(i mod 2),((i-1) mod 2)
cls
gosub drawit21
i=i+1
t=t+dt
qold=q
q=a1*cos(o*t-phi)+b1*sin(o*t-phi)
goto theiloop21
theiend21:
o=o+dom
phi=phi+dom*t
return

decrease21:
a1=2*o*((o0^2-o^2)*(o0^2-o^2-g^2)-o^2*g^2)
b1=g*((o0^2-o^2)^2-4*o^2*(o0^2-o^2)-2*g^2*o^2)
qold=a1*cos(o*t-phi)+b1*sin(o*t-phi)
q=a1*cos(o*t-phi)+b1*sin(o*t-phi)
thedloop21:
if q*qold<=0 then goto thedend21
screen 9,,(i mod 2),((i-1) mod 2)
cls
gosub drawit21
i=i+1
t=t+dt
qold=q
q=a1*cos(o*t-phi)+b1*sin(o*t-phi)
goto thedloop21
thedend21:
o=o-dom
phi=phi-dom*t
return

drawit21:
x1=dr+h*cos(o*t-phi)
x2=dh+dr+h*((o0^2-o^2)*cos(o*t-phi)+g*o*sin(o*t-phi))*o0^2/((o0^2-o^2)^2+g^2*o^2)
line (dr,120)-(dr,130)
line (dh+dr,120)-(dh+dr,130)
line (h+dr,120)-(h+dr,130)
line (dh+dr+h*o0/g,120)-(dh+dr+h*o0/g,130)
line (-h+dr,120)-(-h+dr,130)
line (dh+dr-h*o0/g,120)-(dh+dr-h*o0/g,130)
put (dr+h/2-2,140),d1
dx=(x2-x1)/3
line (x1+10,100)-(x1+dx,110),cl
line (x1+dx,110)-(x1+dx+dx,90),cl
line (x1+dx+dx,90)-(x2-10,100),cl
circle (x1,100),10,clc
circle (x2,100),10,clc
return




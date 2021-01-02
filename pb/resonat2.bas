scrnum=9
on key(10) gosub theend
key(10) on

dim apib(500)
dim f0m(500)
screen scrnum,,1,1
window (0,0)-(24,80)
cls
print "A+iB"
get (0,79.5)-(5,77.5),apib
cls
print "F0/m"
get (0,79.5)-(5,77.5),f0m
cls


cl=10
clc=14
clsp=15
pi=4*atn(1)
dt=.1
rem omega
o=0
rem gamma
g=.4
dom=.05
rem omega0
o0=2
bottom=-50

side=50
dh=100
dr=50
h=10
phi=0
screen scrnum,,1,1
window (-side,bottom)-(250+side,170)

screen scrnum,,0,0
window (-side,bottom)-(250+side,170)

dim d1(100)
cls
print "d"
get (-side,164)-(-side+4,170),d1

i=1
t=0

key(10) on
key(11) on
key(14) on
key(13) on

theloop21:
on key(10) gosub theend
on key(11) gosub increase21
on key(14) gosub decrease21
on key(13) gosub thestart
screen scrnum,,(i mod 2),((i-1) mod 2)
cls
gosub drawit21
i=i+1
t=t+dt

goto theloop21
end

thestart:
o=.3
return

increase21:
a1=2*o*((o0^2-o^2)*(o0^2-o^2-g^2)-o^2*g^2)
b1=g*((o0^2-o^2)^2-4*o^2*(o0^2-o^2)-2*g^2*o^2)
qold=a1*cos(o*t-phi)+b1*sin(o*t-phi)
q=a1*cos(o*t-phi)+b1*sin(o*t-phi)
theiloop21:
if q*qold<=0 then goto theiend21
screen scrnum,,(i mod 2),((i-1) mod 2)
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
screen scrnum,,(i mod 2),((i-1) mod 2)
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
deno=o0^2/((o0^2-o^2)^2+g^2*o^2)
rt=(o0^2-o^2)*deno
it=g*o*deno
x1=dr+h*cos(o*t-phi)
x2=dh+dr+h*(rt*cos(o*t-phi)+it*sin(o*t-phi))
line (dr,120)-(dr,130),clsp
line (dh+dr,120)-(dh+dr,130),clsp
line (h+dr,120)-(h+dr,130),clsp
line (dh+dr+h*o0/g,120)-(dh+dr+h*o0/g,130),clsp
line (-h+dr,120)-(-h+dr,130),clsp
line (dh+dr-h*o0/g,120)-(dh+dr-h*o0/g,130),clsp
put (dr+h/2-2,140),d1
dx=(x2-x1)/3
line (x1+10,100)-(x1+dx,110),cl
line (x1+dx,110)-(x1+dx+dx,90),cl
line (x1+dx+dx,90)-(x2-10,100),cl
circle (x1,100),10,clc
circle (x2,100),10,clc
line (50,-20)-(50+50*g/(1+g)*rt,50*g/(1+g)*it-20)
line (200,-20)-(200+50*g/(1+g),-20)
circle (50+50*g/(1+g)*rt,50*g/(1+g)*it-20),1.5
circle (200+50*g/(1+g),-20),1.5
put (40,-30),apib
put (190,-30),f0m
return

theend:
end
return

masterstart:
'open "waves.cfg" for input as #1
'input #1, scrnum
'close #1
scrnum=9
on key(10) gosub theend
key(10) on

screen 0
width 80
cls
color 11
print "Waves Programs:"
print
data "1-1","1-2","2-1","3-1","4-1"
data "4-2","5-1","5-2","5-3","6-1"
data "6-2","6-3","6-4","6-5","7-1","7-2"
data "8-1","8-2","8-3","8-4","8-5","8-6"
data "9-1","9-2","10-1","10-2","10-3","10-4"
data "11-1","11-2","11-3","11-4","12-1"
data "12-2"

color 14
for prg=1 to 34
read a$
print a$,
next

print
print

color 10
print "Enter a program name to run it. Hit F10 from within any program"
print "to return to the main menu. Hit enter without typing a key from"
print "the main menu to quit."
print

print "Enter program (ie 1-1)"
print "Enter to end"
input pn$
if pn$="1-1" then goto p1p1
if pn$="1-2" then goto p1p2
if pn$="2-1" then goto p2p1
if pn$="3-1" then goto p3p1
if pn$="4-1" then goto p4p1
if pn$="4-2" then goto p4p2
if pn$="5-1" then goto p5p1
if pn$="5-2" then goto p5p2
if pn$="5-3" then goto p5p3
if pn$="6-1" then goto p6p1
if pn$="6-2" then goto p6p2
if pn$="6-3" then goto p6ft
if pn$="6-4" then goto p6p3
if pn$="6-5" then goto p6p4
if pn$="7-1" then goto p7p1
if pn$="7-2" then goto p7p2
if pn$="8-1" then goto p8p1
if pn$="8-2" then goto p8p2
if pn$="8-3" then goto p8p3
if pn$="8-4" then goto p8p4
if pn$="8-5" then goto p8p5
if pn$="8-6" then goto p8p6
if pn$="9-1" then goto p9p1
if pn$="9-2" then goto p9p2
if pn$="10-1" then goto p10p1
if pn$="10-2" then goto p10p2
if pn$="10-3" then goto p10p3
if pn$="10-4" then goto p10p4
if pn$="11-1" then goto p11p1
if pn$="11-2" then goto p11p2
if pn$="11-3" then goto p11p3
if pn$="11-4" then goto p11p4
if pn$="12-1" then goto p12p1
if pn$="12-2" then goto p12p2
if pn$="" then end
clear
goto masterstart

theend:
clear
goto masterstart
return

def fnthreedx(x,y,z)=(x+y)/sqr(2)
def fnthreedy(x,y,z)=z+c*(y-x)

sub threedline(x1,y1,z1,x2,y2,z2,cll)
  line (fnthreedx(x1,y1,z1),fnthreedy(x1,y1,z1))-(fnthreedx(x2,y2,z2),fnthreedy(x2,y2,z2)),cll
end sub

p1p1:
dt=.05
pi=4*atn(1)
wx=67
wy=50

screen scrnum,,1,1
window (-wx,-wy)-(wx,wy)

screen scrnum,,0,0
window (-wx,-wy)-(wx,wy)

m=1
theloop11:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
REM do the drawing
rem for k=0 to 41:pset (25*cos(k*pi/21),25*sin(k*pi/21)):next
line (0,0)-(25*cos(dt*m),-25*sin(dt*m)),5
line (0,-25)-(25*cos(dt*m),-25),6
rem line (25*cos(dt*m),0)-(25*cos(dt*m),-25*sin(dt*m))
circle (25*cos(dt*m),0),2,2
line (-50,0)-(-34+8*cos(dt*m),2),2
line (-16+17*cos(dt*m),-2)-(-34+8*cos(dt*m),2),2
line (-16+17*cos(dt*m),-2)-(25*cos(dt*m),0),2
rem circle (25*cos(dt*m),25*sin(dt*m)),2,2
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop11

p1p2:
clx=11
clw=12
clz=13
cls
print "This program multiplies complex numbers."
print "Input the coordinates on w in the complex"
print "plane. Then z starts at the origin, and"
print "can change it with the arrow keys."
print " Press F10 to quit."
input "real part of w ";x1
input "imaginary part of w ";y1

on error goto tryagain12

x1=50*x1
y1=50*y1

screen scrnum,,1,1
window (0,bottom)-(300,220)
screen scrnum,,0,0
window (0,bottom)-(300,220)
dim t1(100)
print chr$(249);
get (0,214)-(4,220),t1
cls
dim w1(100)
print "w";
get (0,214)-(4,220),w1
cls
dim z1(100)
print "z";
get (0,214)-(4,220),z1
cls
m=1
window (-150,-110+bottom)-(150,110)

delta=1

x=y1
y=-x1

gosub theloop12

thekeyin12:

xo=x
yo=y
i$=inkey$
if i$=chr$(0)+chr$(79) then goto theend
if i$=chr$(0)+chr$(68) then goto theend
if i$=chr$(0)+chr$(72) then gosub up12
if i$=chr$(0)+chr$(80) then gosub down12
if i$=chr$(0)+chr$(77) then gosub right12
if i$=chr$(0)+chr$(75) then gosub left12

goto thekeyin12

theloop12:
x2=(x*x1-y*y1)/50
y2=(x*y1+y*x1)/50
cls
print
print "   w =";
print using " +#.#";cint(x1/5)/10;
print using " +#.#";cint(y1/5)/10;
print "i"
print
print "   z =";
print using " +#.#";cint(x/5)/10;
print using " +#.#";cint(y/5)/10;
print "i"
print
print "   w";chr$(249);"z =";
print using " +#.#";cint(x2/5)/10;
print using " +#.#";cint(y2/5)/10;
print "i"
circle (x,y),1,clx
circle (x1,y1),1,clw
circle ((x*x1-y*y1)/50,(x*y1+y*x1)/50),1,clx
line (-3,50)-(3,50),7
line (-3,-50)-(3,-50),7
line (50,-3)-(50,3),7
line (-50,-3)-(-50,3),7
line (0,-100+bottom)-(0,120),7
line (-150,0)-(150,0),7
line (x,y)-(0,0),clx
put (1.2*x,1.2*y),z1
line (x1,y1)-(0,0),clw
put (1.2*x1,1.2*y1),w1
line (x2,y2)-(0,0),clz
rem put (x2-1,y2+4),t1
circle(x2,y2),1,clz
put (1.2*x2-4,1.2*y2),w1
put (1.2*x2,1.2*y2),t1
put (1.2*x2+4,1.2*y2),z1
screen scrnum,,(m mod 2),((m-1) mod 2)
m=m+1
return

up12:
y=y+delta:gosub theloop12 :return
down12:
y=y-delta:gosub theloop12 :return
right12:
x=x+delta:gosub theloop12 :return
left12:
x=x-delta:gosub theloop12 :return

tryagain12:
x=xo
y=yo
x2=(x*x1-y*y1)/50
y2=(x*y1+y*x1)/50
resume next

p2p1:
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
screen scrnum,,1,1
window (0,bottom)-(side,220)

screen scrnum,,0,0
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
on key(10) gosub theend
on key(11) gosub increase21
on key(14) gosub decrease21
screen scrnum,,(i mod 2),((i-1) mod 2)
cls
gosub drawit21
i=i+1
t=t+dt

goto theloop21
end

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
line (x1+2,100)-(x1+dx,110),cl
line (x1+dx,110)-(x1+dx+dx,90),cl
line (x1+dx+dx,90)-(x2-10,100),cl
circle (x1,100),2,clc
circle (x2,100),10,clc
return

p3p1:
bottom=-50
side=300
pi=4*atn(1)
t=1
ii=800*t
tm=.1
om=.1
dom=.02
a1=1
a2=0
b1=0
b2=.4
asp=1
screen scrnum,,1,1
window (0,bottom)-(side,220)

screen scrnum,,0,0
window (0,bottom)-(side,220)

key(10) on
i=1
theloop31:
on key(10) gosub theend
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
screen scrnum,,(i mod 2),((i-1) mod 2)
cls
gosub drawit31
i=i+1
goto theloop31

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
circle (x11,y11),7,12,,asp
circle (x21,y21),7,12,,asp
y12=160-200*cos(theta12)
y22=160-200*cos(theta22)
x12=100-200*sin(theta12)
x22=200-200*sin(theta22)
circle (x12,y12),7,11,,asp
circle (x22,y22),7,11,,asp
line (150,-60)-(150,0)
line (100,-60)-(100,0)
line (200,-60)-(200,0)
return

p4p1:
bottom=-50
side=300
pi=4*atn(1)
t=1
ii=800*t
tm=.1
om=.1
dom=.01
a1=1
a2=1
b1=0
b2=0
asp=1
screen scrnum,,1,1
window (0,bottom)-(side,220)

screen scrnum,,0,0
window (0,bottom)-(side,220)

key(10) on
i=1
theloop41:
on key(10) gosub theend
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
screen scrnum,,(i mod 2),((i-1) mod 2)
cls
gosub drawit41
i=i+1
goto theloop41


drawit41:
circle (x1,y1),7,5,,asp
circle (x2,y2),7,5,,asp
line (x1,y1)-(100,220),13
line (x2,y2)-(200,220),13
line (x1,y1)-(x2,y2),13

y11=190-200*cos(theta11)
y21=190-200*cos(theta21)
x11=100-200*sin(theta11)
x21=200-200*sin(theta21)
circle (x11,y11),7,12,,asp
circle (x21,y21),7,12,,asp

y12=160-200*cos(theta12)
y22=160-200*cos(theta22)
x12=100-200*sin(theta12)
x22=200-200*sin(theta22)
circle (x12,y12),7,11,,asp
circle (x22,y22),7,11,,asp

line (150,-60)-(150,0)
line (100,-60)-(100,0)
line (200,-60)-(200,0)

return

p4p2:
pi=4*atn(1)
dim mm(6)
dim a(6)

cl=11
clc=12
bottom=0
side=300

REM the parameters in the K matrix
em=2
bm=.5
cm=.3
dm=.3

REM the dispersion relation
for k=0 to 3
mm(k)=40/sqr(em-2*bm*cos(k*pi/3)-2*cm*cos(2*k*pi/3)-dm*cos(k*pi))
next
mm(4)=mm(2)
mm(5)=mm(1)

REM the amplitudes of the different normal modes
a(0)=2
a(1)=1
a(2)=1
a(3)=1
a(4)=1
a(5)=1

dim yy(6)
dim y(5,6,mm(0))


gosub recalc42

key(10) on
key(1) on
key(2) on
key(3) on
key(4) on
key(5) on
key(6) on
key(9) on
m=2
theloop42:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit42
m=m+1
on key(1) gosub s142
on key(2) gosub s242
on key(3) gosub s342
on key(4) gosub s442
on key(5) gosub s542
on key(6) gosub s642
on key(9) gosub s742
on key(10) gosub theend
goto theloop42


recalc42:
cls
screen scrnum,,1,1
window (-side/2,bottom-110)-(side/2,110)
cls
screen scrnum,,0,0
window (-side/2,bottom-110)-(side/2,110)
cls
for n=0 to 5
yy(n)=pi*n/3
for k=0 to 3
yy(n)=yy(n)+a(k)*.1*cos(k*pi*(n)/3)
next
for k=4 to 4
yy(n)=yy(n)+a(k)*.1*sin(2*pi*(n)/3)
next
for k=5 to 5
yy(n)=yy(n)+a(k)*.1*sin(pi*(n)/3)
next
next

for k=0 to 3
for n=0 to 5
for m=0 to mm(k)
y(k,n,m)=a(k)*.1*cos(k*pi*(n)/3)*cos(2*pi*(m-1)/mm(k))
next
next
next
for k=4 to 4
for n=0 to 5
for m=0 to mm(k)
y(k,n,m)=a(k)*.1*sin(2*pi*(n)/3)*cos(2*pi*(m-1)/mm(k))
next
next
next
for k=5 to 5
for n=0 to 5
for m=0 to mm(k)
y(k,n,m)=a(k)*.05*sin(pi*(n)/3)*cos(2*pi*(m-1)/mm(k))
next
next
next
return

REM the hacksaw blades are drawn in three segments so they can "bend"
drawit42:
for n=0 to 5
yy(n)=0
for k=0 to 5
yy(n)=yy(n)+y(k,n,m mod mm(k))
next
next
for n=0 to 5
line (0,0)-(20*cos(pi*n/3+yy(n)/3),20*sin(pi*n/3+yy(n)/3)),cl
line (20*cos(pi*n/3+yy(n)/3),20*sin(pi*n/3+yy(n)/3))-(40*cos(pi*n/3+2*yy(n)/3),40*sin(pi*n/3+2*yy(n)/3)),cl
line (40*cos(pi*n/3+2*yy(n)/3),40*sin(pi*n/3+2*yy(n)/3))-(60*cos(pi*n/3+yy(n)),60*sin(pi*n/3+yy(n))),cl
circle (60*cos(pi*n/3+yy(n)),60*sin(pi*n/3+yy(n))),3,clc
next
return

s142:
 a(0)=0
a(1)=1
a(2)=0
a(3)=0
a(4)=0
a(5)=0
gosub recalc42:return

s242:
 a(0)=0
a(1)=0
a(2)=1
a(3)=0
a(4)=0
a(5)=0
gosub recalc42:return

s342:
 a(0)=0
a(1)=0
a(2)=0
a(3)=1
a(4)=0
a(5)=0
gosub recalc42:return

s442:
 a(0)=0
a(1)=0
a(2)=0
a(3)=0
a(4)=1
a(5)=0
gosub recalc42:return

s542:
 a(0)=0
a(1)=0
a(2)=0
a(3)=0
a(4)=0
a(5)=1
gosub recalc42:return

s642:
 a(0)=2
a(1)=0
a(2)=0
a(3)=0
a(4)=0
a(5)=0
gosub recalc42:return

s742:
 a(0)=2
a(1)=1
a(2)=1
a(3)=1
a(4)=1
a(5)=1
gosub recalc42:return

p5p1:
cls
print "This programs shows the oscillations of a set of"
print "coupled pendulums (the top is cut off). Below"
print "the actual oscillation are the normal modes into"
print " which it can be decomposed."
print
print "Press F10 to quit."
print "Input the number of blocks (2 to 6) "
input nn
pi=4*atn(1)
nn=nn+1
dim mm(nn-1)
dim a(nn-1)
cl=11
clc=12
cl2=3
clc2=4
cp=13

for k=1 to nn-1
mm(k)=40/sqr(3-2*cos(k*pi/nn))
next

for k=1 to nn-1
a(k)=2/nn
next

mmax=350
nmax=nn
dim yy(nn)
dim y(nn-1,nn,mm(1))

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

for k=1 to nn-1
for n=0 to nn
for m=0 to mm(k)
y(k,n,m)=a(k)*4*sin(k*pi*(n)/nn)*sin(2*pi*(m-1)/mm(k))
next
next
next

key(10) on
m=1
theloop51:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit51
m=m+1
on key(10) gosub theend
goto theloop51


drawit51:
for n=0 to nn
yy(n)=0
for k=1 to nn-1
yy(n)=yy(n)+y(k,n,m mod mm(k))
next
next
for n=0 to nmax-1
line (12+80*n/nmax+yy(n),80)-(8+80*(n+1)/nmax+yy(n+1),80),cl
for k=1 to nn-1
line (12+80*n/nmax+y(k,n,m mod mm(k)),k*80/nn)-(8+80*(n+1)/nmax+y(k,n+1,m mod mm(k)),k*80/nn),cl2
next

next
for n=1 to nmax-1
line (10+80*n/nmax+yy(n),82)-(10+80*n/nmax+yy(n),100),cp
circle (10+80*n/nmax+yy(n),80) ,2,clc
for k=1 to nn-1
circle (10+80*n/nmax+y(k,n,m mod mm(k)),k*80/nn) ,2,clc2
next
next
return

p5p2:
cls
pi=4*atn(1)
print "The beaded string with fixed ends."
print "Choose 2 to 7 beads."
print
print "Type F10 to quit."
print
input "Enter the number of beads: ";nnn
nn=nnn+1
dim mm(nn-1)
dim a(nn-1)

REM the dispersion relation
for k=1 to nn-1
mm(k)=40/sqr(2-2*cos(k*pi/nn))
next

for k=1 to nn-1
a(k)=3/nn
next

mmax=350
nmax=nn
dim yy(nn)
dim y(nn-1,nn,mm(1))

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

for k=1 to nn-1
for n=0 to nn
for m=0 to mm(k)
y(k,n,m)=a(k)*5*sin(k*pi*(n)/nn)*sin(2*pi*(m-1)/mm(k))
next
next
next

key(10) on
m=1
theloop52:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit52
m=m+1
on key(10) gosub theend
goto theloop52


drawit52:
for n=0 to nn
yy(n)=80
for k=1 to nn-1
yy(n)=yy(n)+y(k,n,m mod mm(k))
next
next
for n=0 to nmax-1
line (10+80*n/nmax,yy(n))-(10+80*(n+1)/nmax,yy(n+1))
for k=1 to nn-1
line (10+80*n/nmax,k*80/nn+y(k,n,m mod mm(k)))-(10+80*(n+1)/nmax,k*80/nn+y(k,n+1,m mod mm(k))),5
next
next
for n=1 to nmax-1
circle (10+80*n/nmax,yy(n)) ,1
for k=1 to nn-1
circle (10+80*n/nmax,k*80/nn+y(k,n,m mod mm(k))) ,1,5
next
next
return

p5p3:
pi=4*atn(1)
nn=4
dim mm(nn-1)
dim a(nn-1)
option base 0

for k=0 to nn-1
mm(k)=40/sqr(3-2.9*cos(k*pi/nn))
next

a(1)=.7
a(2)=.7
a(3)=.7
a(0)=0

nmax=nn
dim yy(nn)
dim y(nn-1,nn,mm(0))

screen scrnum,,1,1
window (-10,0)-(110,110)

screen scrnum,,0,0
window (-10,0)-(110,110)

for k=0 to nn-1
for n=1 to nn
for m=0 to mm(k)
y(k,n,m)=a(k)*5*cos((n-.5)*k*pi/nn)*sin(2*pi*(m-1)/mm(k))
next
next
next

key(10) on

m=1
theloop53:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit53
m=m+1
on key(10) gosub theend
goto theloop53


drawit53:

for n=1 to nn
yy(n)=80
for k=0 to nn-1
yy(n)=yy(n)+y(k,n,m mod mm(k))
next
next

for n=1 to nn-1
line (80*n/nmax,10+yy(n))-(80*(n+1)/nmax,10+yy(n+1))
for k=0 to nn-1
line (80*n/nmax,10+k*80/nn+y(k,n,m mod mm(k)))-(80*(n+1)/nmax,10+k*80/nn+y(k,n+1,m mod mm(k))),5
next
next
line (0,10+yy(1))-(80/nmax,10+yy(1))
for k=0 to nn-1
line (0,10+k*80/nn+y(k,1,m mod mm(k)))-(80/nmax,10+k*80/nn+y(k,1,m mod mm(k))),5
next
line (80*(nn)/nmax,10+yy(nn))-(80*(nn+1)/nmax,10+yy(nn))
for k=0 to nn-1
line (80*(nn)/nmax,10+k*80/nn+y(k,nn,m mod mm(k)))-(80*(nn+1)/nmax,10+k*80/nn+y(k,nn,m mod mm(k))),5
next

for n=1 to nn
circle (80*n/nmax,10+yy(n)) ,1
for k=0 to nn-1
circle (80*n/nmax,10+k*80/nn+y(k,n,m mod mm(k))) ,1,5
next
next

return
return

p6p1:
pi=4*atn(1)
k=1
a0=20
a=a0
nn=24
mm0=12
mm=mm0

screen scrnum,,1,1
window (0,0)-(200,200)

screen scrnum,,0,0
window (0,0)-(200,200)

m=1
key(10) on
key(11) on
key(14) on

theloop61:
on key(10) gosub theend
on key(11) gosub increase61
on key(14) gosub decrease61
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit61
m=m+1
goto theloop61

drawit61:
for n=0 to nn-1
line (10+160*n/nn,80+a*sin(k*n*pi/nn)*sin(m/mm))-(10+160*(n+1)/nn,80+a*sin(k*(n+1)*pi/nn)*sin(m/mm)),11
next
return

increase61:
k=k+1
mm=mm0/k
a=a0/k
return

decrease61:
if k>1 then k=k-1 else return
mm=mm0/k
a=a0/k
return

p6p2:
pi=4*atn(1)
k=.5
a0=20
a=a0/k
nn=24
mm0=12
mm=mm0

screen scrnum,,1,1
window (0,0)-(200,200)

screen scrnum,,0,0
window (0,0)-(200,200)

m=1
key(10) on
key(11) on
key(14) on

theloop62:
on key(10) gosub theend
on key(11) gosub increase62
on key(14) gosub decrease62
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit62
m=m+1
goto theloop62

drawit62:
line (170,20)-(170,140),13
circle (170,80+a*sin(k*pi)*sin(m/mm)),1,11
for n=0 to nn-1
line (10+160*n/nn,80+a*sin(k*n*pi/nn)*sin(m/mm))-(10+160*(n+1)/nn,80+a*sin(k*(n+1)*pi/nn)*sin(m/mm)),11
next
return

increase62:
k=k+1
mm=mm0/k
a=a0/k
return

decrease62:
if k>1 then k=k-1 else return
mm=mm0/k
a=a0/k
return

p6p3:
pi=4*atn(1)
w=0.5
k=1
a0=40
nn=20
nterms=20
mm0=16
dim psi(nn)

screen scrnum,,1,1
window (0,0)-(200,200)

screen scrnum,,0,0
window (0,0)-(200,200)

m=1
key(10) on

theloop63:
on key(10) gosub theend
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit63
m=m+1
goto theloop63

drawit63:
for n=0 to nn-1
psi[n]=0
for k=1 to nterms
psi[n]=psi[n]+sin(w*k*pi)/k/k*sin(k*n*pi/nn)*cos(m*k/mm0)
next
psi[n]=psi[n]*a0/4/w/(1-w)
next
for n=0 to nn-1
line (10+160*n/nn,80+psi[n])-(10+160*(n+1)/nn,80+psi[n+1]),11
next
return

p6p4:
cls
print "Input w"
input w
print
print
print "Input number of terms in Fourier series"
input nterms
pi=4*atn(1)
k=1
a0=40
nn=30
mm0=16
dim psi(nn)

screen scrnum,,1,1
window (0,0)-(200,200)

screen scrnum,,0,0
window (0,0)-(200,200)

m=1
key(10) on

theloop64:
on key(10) gosub theend
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit64
m=m+1
goto theloop64

drawit64:
for n=0 to nn-1
psi[n]=0
for k=1 to nterms
psi[n]=psi[n]+sin(w*k*pi)/k/k*sin(k*n*pi/nn)*cos(m*k/mm0)
next
psi[n]=psi[n]*a0/4/w/(1-w)
next


for n=0 to nn-1
line (10+160*n/nn,80+psi[n])-(10+160*(n+1)/nn,80+psi[n+1]),11
next
return

p7p1:
pi=4*atn(1)
cl=11
nodes=1
nn=42
eps=20/nodes
kl=pi*nodes
o=2*nodes

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

key(10) on
key(1) on
key(2) on
key(3) on
key(4) on
key(5) on
key(6) on
key(7) on
key(8) on
key(9) on
m=1
theloop71:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit71
m=m+1
on key(10) gosub theend
on key(1) gosub s171
on key(2) gosub s271
on key(3) gosub s371
on key(4) gosub s471
on key(5) gosub s571
on key(6) gosub s671
on key(7) gosub s771
on key(8) gosub s871
on key(9) gosub s971
goto theloop71


drawit71:
for n=1 to nn/2
line (3+80*2*n/nn+eps*sin(kl*2*n/nn)*cos(o*m/nn),55)-(3+80*(2*n-1)/nn+eps*sin(kl*(2*n-1)/nn)*cos(o*m/nn),45),cl
next
for n=0 to nn/2-1
line (3+80*2*n/nn+eps*sin(kl*2*n/nn)*cos(o*m/nn),55)-(3+80*(2*n+1)/nn+eps*sin(kl*(2*n+1)/nn)*cos(o*m/nn),45),cl
next
return

s171:
 nodes=1
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s271:
 nodes=2
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s371:
 nodes=3
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s471:
 nodes=4
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s571:
 nodes=5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s671:
 nodes=6
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s771:
 nodes=7
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s871:
 nodes=8
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s971:
 nodes=9
eps=20/nodes
kl=pi*nodes
o=2*nodes
return

p7p2:
pi=4*atn(1)
cl=11
nodes=.5
nn=42
eps=20/(nodes+1)
kl=pi*nodes
o=2*nodes

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

key(10) on
key(1) on
key(2) on
key(3) on
key(4) on
key(5) on
key(6) on
key(7) on
key(8) on
key(9) on
m=1
theloop72:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit72
m=m+1
on key(10) gosub theend
on key(1) gosub s172
on key(2) gosub s272
on key(3) gosub s372
on key(4) gosub s472
on key(5) gosub s572
on key(6) gosub s672
on key(7) gosub s772
on key(8) gosub s872
on key(9) gosub s972
goto theloop72


drawit72:
for n=1 to nn/2
line (3+80*2*n/nn+eps*sin(kl*2*n/nn)*cos(o*m/nn),55)-(3+80*(2*n-1)/nn+eps*sin(kl*(2*n-1)/nn)*cos(o*m/nn),45),cl
next
for n=0 to nn/2-1
line (3+80*2*n/nn+eps*sin(kl*2*n/nn)*cos(o*m/nn),55)-(3+80*(2*n+1)/nn+eps*sin(kl*(2*n+1)/nn)*cos(o*m/nn),45),cl
next
return

s172:
 nodes=.5
eps=20/(nodes+1)
kl=pi*nodes
o=2*nodes
return
s272:
 nodes=1.5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s372:
 nodes=2.5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s472:
 nodes=3.5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s572:
 nodes=4.5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s672:
 nodes=5.5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s772:
 nodes=6.5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s872:
 nodes=7.5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
s972:
 nodes=8.5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return

p8p1:
pi=4*atn(1)
mm=60
mmax=50
nn=20
nmax=5*nn/4-1
cl=11
clr=12
cll=13

dim y1(nn,mm)
dim y2(nn,mm)

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

for n=0 to nn
for m=0 to mm
y1(n,m)=10*cos(2*pi*(n)/nn)*cos(2*pi*(m-1)/mm)
y2(n,m)=10*sin(2*pi*(n)/nn)*sin(2*pi*(m-1)/mm)
next
next

key(10) on
m=1
theloop81:
on key(10) gosub theend
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit81
m=m+1
goto theloop81

drawit81:
for n=0 to nmax
line (10+80*n/nmax,y1(n mod nn,m mod mm)+y2(n mod nn,m mod mm)+45)-(10+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+y2((n+1) mod nn,m mod mm)+45),cl
next
circle (10+80/nmax*nn*((m-1) mod mm)/mm,55),1
if ((m mod mm)*4<=mm) then circle (10+80*nn/nmax+80/nmax*nn*((m-1) mod mm)/mm,55),1
return

p8p2:
pi=4*atn(1)
mm=50
mmax=50
nn=16
nmax=5*nn/4-1
cl=11
clr=12
cll=13

dim y1(nn,mm)
dim y3(nn,mm)

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

for n=0 to nn
for m=0 to mm
y1(n,m)=10*cos(2*pi*(n)/nn)*cos(2*pi*(-m+1)/mm)
y3(n,m)=10*sin(2*pi*(n)/nn)*sin(2*pi*(m-1)/mm)
next
next

key(10) on
m=1
theloop82:
on key(10) gosub theend
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit82
m=m+1
goto theloop82

drawit82:
for n=0 to nmax
line (10+80*n/nmax,y1(n mod nn,m mod mm)+15)-(10+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+15),clr
line (10+80*n/nmax,y3(n mod nn,m mod mm)+40)-(10+80*(n+1)/nmax,y3((n+1) mod nn,m mod mm)+40),cll
line (10+80*n/nmax,y1(n mod nn,m mod mm)+y3(n mod nn,m mod mm)+75)-(10+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+y3((n+1) mod nn,m mod mm)+75),cl
next
circle (10+80/nmax*nn*((m-1) mod mm)/mm,85),1
if ((m mod mm)*4<=mm) then circle (10+80*nn/nmax+80/nmax*nn*((m-1) mod mm)/mm,85),1
return

p8p3:
pi=4*atn(1)
kk=4
kp=2
cl=11
mm=60
mmax=200
nn=50
cycles=7/4
nmax%=2*nn*cycles/kk

dim y1(nn,mm)

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)
ay=10/sqr(cos(kk*pi*nmax%/nn)^2*(1-exp(-2*kp*nmax%/nn))^2+sin(kk*pi*nmax%/nn)^2*(1+exp(-2*kp*nmax%/nn))^2)
for n=0 to nn
for m=0 to mm
y1(n,m)=ay*(exp(-kp*n/nn)*cos(kk*pi*(n/nn-nmax%/nn-m/mm))  )
rem -exp(-2*kp*nmax%/nn)*exp(kp*n/nn)*cos(kk*pi*(n/nn-nmax%/nn+m/mm)))
next
next

m=1
key(10) on
theloop83:
on key(10) gosub theend:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit83
m=m+1
goto theloop83

drawit83:
rem line (0,60)-(3,60)
line (0,50)-(100,50)
for n=0 to nmax%-1
line (100*n/nmax%,y1(n,m mod mm)+50)-(100*(n+1)/nmax%,y1(n+1,m mod mm)+50),cl
next
return

p8p4:
pi=4*atn(1)
kk=4
kp=1.3
cl=11
mm=60
mmax=200
nn=50
cycles=11/4
nmax%=cint(2*nn*cycles/kk)

dim y1(nmax%,mm)

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)
ay=10/sqr(cos(kk*pi*nmax%/nn)^2*(1-exp(-2*kp*nmax%/nn))^2+sin(kk*pi*nmax%/nn)^2*(1+exp(-2*kp*nmax%/nn))^2)
for n=0 to nmax%
for m=0 to mm
y1(n,m)=ay*(exp(-kp*n/nn)*cos(kk*pi*(n/nn-nmax%/nn-m/mm))-exp(-2*kp*nmax%/nn)*exp(kp*n/nn)*cos(kk*pi*(n/nn-nmax%/nn+m/mm)))
next
next

m=1
key(10) on
theloop84:
on key(10) gosub theend:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit84
m=m+1
goto theloop84

drawit84:
locate 20,8
print "x=0";
locate 20,73
print "x=L";
rem line (0,60)-(3,60)
line (0,50)-(100,50)
for n=0 to nmax%-1
line (90-80*n/nmax%,y1(n,m mod mm)+50)-(90-80*(n+1)/nmax%,y1(n+1,m mod mm)+50),cl
next
return

p8p5:
pi=4*atn(1)
kk=4
kp=1.3
cl=11
mm=60
mmax=200
nn=9
cycles=11/4
nmax%=cint(2*nn*cycles/kk)
print nmax%

dim y1(nmax%,mm)

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)
ay=10/sqr(cos(kk*pi*nmax%/nn)^2*(1-exp(-2*kp*nmax%/nn))^2+sin(kk*pi*nmax%/nn)^2*(1+exp(-2*kp*nmax%/nn))^2)
for n=0 to nmax%
for m=0 to mm
y1(n,m)=ay*(exp(-kp*n/nn)*cos(kk*pi*(n/nn-nmax%/nn-m/mm))-exp(-2*kp*nmax%/nn)*exp(kp*n/nn)*cos(kk*pi*(n/nn-nmax%/nn+m/mm)))
next
next

m=1
key(10) on
theloop85:
on key(10) gosub theend:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit85
m=m+1
goto theloop85

drawit85:
locate 20,8
print "x=0";
locate 20,73
print "x=L";
rem line (0,60)-(3,60)
line (0,50)-(100,50)
for n=0 to nmax%-1
line (90-80*n/nmax%,y1(n,m mod mm)+50)-(90-80*(n+1)/nmax%,y1(n+1,m mod mm)+50),cl
next
for n=1 to nmax%-1
circle (90-80*n/nmax%,y1(n,m mod mm)+50),1,cl+1
next
return

p6ft:
on key(10) gosub theend
REM plots the inverse Fourier Transform of a function that you define
REM it is built on a program that plots fnx(fi%,t) versus fny(fi%,t)
REM for fi%=1 to ni%
pi=4*atn(1)
cla=13
screen 0
print "input w (between 0 and .99)"
input w
if w>.99 then w=.99
if w<0 then w=0
theloop6ft:
screen 0
color 10
REM input m = number of terms in the fourier transform
print
print "input # of terms in Fourier series"
input m
if m=0 then goto masterstart

REM the function in computed on the interval [tmin,tmax]
REM make sure that it is well defined in the interval
tmin=0
tmax=1

REM input n = the number of points to be computed
REM the higher m, the more points you need
n=10*m/(1-w)
if n>600 then n=600

REM reset xmin and xmax and/or ymin and ymax for manual axis scaling
REM if all are 0 then scaling will be automatic
REM the values below are appropriate for the fractal graph

xmin=0
xmax=1
ymin=0
ymax=1.2

REM DEFINE FOURIER COEFFICIENTS
REM FOR COSINES
REM here is a nice smooth curve
def fnbk(k) = 0
REM here is the fractal
REM where the function fnm is defined below
def fnm(k)
fnm=0
end def

REM to include sin functions, remove the REM below and below ****
REM and define the appropriate Fourier coefficients
def fnck(k)=2*sin(k*pi*w)/k^2/pi^2/(1-w)

REM The program allows you to print more than one function at a time
REM input nf% = number of functions
nf%=1

REM define functions here -- this is where the graphing program really starts
def fnx(fi%,t)
REM this make the points linearly spaced in t
if fi%=1 then fnx=t
REM if you want more graphs, you go on
if fi%=2 then fnx=t
end def
def fny(fi%,t)
if fi%=1 then
REM the step below works if your coefficient function is well defined for k=0,
s=0
REM this adds terms 1 to m in the series
for k=1 to m
s=s+fnck(k)*sin((pi*k*fnx(1,t)))
next
fny=s
end if
REM you can define more functions if you want -- they don't show up unless you
REM reset ni% to 2 or more
if fi%=2 then
fny=whatever
end if
end def

REM the rest of this is the graphing program
def fnmax(a,b)
  if a>=b then fnmax=a
  if b>a then fnmax=b
end def
def fnxx(x)=200*(x-xmin)/(xmax-xmin)
def fnyy(y)=200*(y-ymin)/(ymax-ymin)

if (xmax=0) and (xmin=0) then
xmin=10^10
xmax=-10^10
for fi%=1 to nf%
for i=0 to n
t=tmin+(tmax-tmin)*i/n
x=fnx(fi%,t)
if x>xmax then xmax=x
if x<xmin then xmin=x
next
next
end if

if (ymax=0) and (ymin=0) then
ymin=10^10
ymax=-10^10
for fi%=1 to nf%
for i=0 to n
t=tmin+(tmax-tmin)*i/n
y=fny(fi%,t)
if y>ymax then ymax=y
if y<ymin then ymin=y
next
next
end if

x10=fnmax(10^(ceil(log10(abs(xmax)+.000000001))-1),_
     10^(ceil(log10(abs(xmin)+.000000001))-1))
y10=fnmax(10^(ceil(log10(abs(ymax)+.000000001))-1),_
     10^(ceil(log10(abs(ymin)+.000000001))-1))

xe%=log10(x10)
ye%=log10(y10)

ximax=cint(xmax/x10)
ximin=cint(xmin/x10)
yimax=cint(ymax/y10)
yimin=cint(ymin/y10)

screen scrnum
window (-60,-25)-(245,205)
gosub thenumbers6ft

line (0,0)-(0,200),cla
line (0,0)-(200,0),cla
if xe%<>0 then
locate 25,70
print "x 10^";xe%;
end if
for xi=ximin to ximax
if (xi>=xmin/x10) and (xi<=xmax/x10) then
  line (fnxx(xi*x10),-3)-(fnxx(xi*x10),3),cla
  thenumber=xi
  xvalue=fnxx(xi*x10)-1
  yvalue=-10
  gosub printit6ft
end if
next
if ye%<>0 then
locate 1,1
print "x 10^";ye%
end if
for yi=yimin to yimax
if (yi>=ymin/y10) and (yi<=ymax/y10) then
  line (-3,fnyy(yi*y10))-(3,fnyy(yi*y10)),cla
  thenumber=yi
  xvalue=-15
  yvalue=fnyy(yi*y10)+3
  gosub printit6ft
end if
next

line(fnxx(0),fnyy(0))-(fnxx(w),fnyy(w)),3
line(fnxx(1),fnyy(0))-(fnxx(w),fnyy(w)),3

for fi%=1 to nf%
x=fnx(fi%,tmin)
y=fny(fi%,tmin)
for i=1 to n
t=tmin+(tmax-tmin)*i/n
nx=fnx(fi%,t)
ny=fny(fi%,t)
line (fnxx(x),fnyy(y))-(fnxx(nx),fnyy(ny)),15
x=nx
y=ny
next
next

locate 1,1
color 11
print "type m to to enter a different number of terms"
keyin6ft:
i$=inkey$
if i$="m" or i$="M" then print:print "hit a key":print "to return":print "to menu":goto theloop6ft
goto keyin6ft

thenumbers6ft:
dim b%(9,100)
dim c%(100)
for j=0 to 9
cls
locate 1,1
print using "#";j;
get (pmap(0,2),pmap(0,3))-(pmap(8,2),pmap(11,3)),c%
for k=0 to 100
b%(j,k)=c%(k)
next
next
cls
return

REM below are various subroutines

printit6ft:
for k=0 to 100
c%(k)=b%(abs(thenumber),k)
next
put (xvalue,yvalue),c%
if thenumber<0 then line (xvalue-pmap(4,2)+pmap(0,2),_
           yvalue+pmap(7,3)-pmap(0,3))_
           -(xvalue-pmap(10,2)+pmap(0,2),yvalue+pmap(7,3)-pmap(0,3))
return


p8p6:
pi=4*atn(1)
stringcolor=11
beadcolor=12
nn=7
domega=.05
omega=6
dt=.03
t=0
dim yy(nn+1)

def fny86(x,t)
if (omega<7) and (omega>5) then
k=2*atn(sqr(omega^2-25)/(49-omega^2))
fny86=10*cos(k*x-omega*t)
end if
if omega>7 then
k=2*log(sqr((omega^2-49)/14)+sqr((omega^2-25)/14))
fny86=10*exp(-k*x)*cos(pi*x)*cos(omega*t)
end if
if omega<5 then
k=2*log(sqr((49-omega^2)/14)+sqr((25-omega^2)/14))
fny86=10*exp(-k*x)*cos(omega*t)
end if
if omega=7 then
fny86=10*cos(pi*x)*cos(omega*t)
end if
if omega=5 then
fny86=10*cos(omega*t)
end if
end def

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

m=1
gosub drawit86

on key(10) gosub theend
on key(11) gosub increase86
on key(14) gosub decrease86
on key(13) gosub increasel86
on key(12) gosub decreasel86

key(10) on
key(11) on
key(12) on
key(13) on
key(14) on
theloop:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit86
t=t+dt
m=m+1
goto theloop

'theend:
'end
'return

increase86:
omega=omega+domega
return

decrease86:
omega=omega-domega
return

increasel86:
if domega<.02 then domega=domega*10
return

decreasel86:
if domega>.000002 then domega=domega/10
return

drawit86:
print "omega =";
print using " #.#######";omega;
print "     domega =";
print using " #^^^^";domega
line (10,50)-(100,50),3
for n=0 to nn+1
yy(n)=fny86(n,t)
next
for n=0 to nn
line (10+80*n/nn,yy(n)+50)-(10+80*(n+1)/nn,yy(n+1)+50),stringcolor
next
for n=1 to nn+1
circle (10+80*n/nn,yy(n)+50) ,1,beadcolor
line (10+80*n/nn,50)-(10.5+80*n/nn,yy(n)/2+50)
line (10+80*n/nn,yy(n)+50)-(10.5+80*n/nn,yy(n)/2+50)
next
return

p9p1:
pi=4*atn(1)
cl=11
r=.3
mm=40
mmax=80
nn=16
nmax=2*nn

dim y1(nn,mm)
dim y2(nn,mm)

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

for n=0 to nn
for m=0 to mm
y1(n,m)=10*cos(2*pi*(n/nn-m/mm))
y2(n,m)=10*r*cos(2*pi*(n/nn+m/mm))
next
next

key(10) on
m=1
theloop91:
on key(10) gosub theend
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit91
m=m+1
goto theloop91

drawit91:
for n=0 to nmax
line (5+80*n/nmax,y1(n mod nn,m mod mm)+15)-(5+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+15),cl
line (5+80*n/nmax,y2(n mod nn,m mod mm)+40)-(5+80*(n+1)/nmax,y2((n+1) mod nn,m mod mm)+40),cl-1
line (5+80*n/nmax,y1(n mod nn,m mod mm)+y2(n mod nn,m mod mm)+75)-(5+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+y2((n+1) mod nn,m mod mm)+75),cl+1
next
return

p9p2:
pi=4*atn(1)
cl=11
clm=13
dim eps(3)
eps(1)=.85
eps(2)=2
eps(3)=5
mm=40
mmax=80
nn=16
nn4=(nn/4)
nmax=2*nn

key(10) on
key(11) on
key(14) on

on key(10) gosub theend
on key(11) gosub increase92
on key(14) gosub decrease92

dim y1(nn,mm)
dim y2(nn,mm)

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

je=2
thestart92:
tst=1

th=atn(eps(je)/2)
r=eps(je)/sqr(4+eps(je)^2)
t=2/sqr(4+eps(je)^2)
nth=(nn*th/2/pi)

for n=0 to nn
for m=0 to mm
y1(n,m)=10*cos(2*pi*(n/nn-m/mm))
y2(n,m)=10*r*cos(2*pi*(n/nn+m/mm))
next
next


m=1
theloop92:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
if tst=0 then goto thestart92
gosub drawit92
m=m+1
goto theloop92

drawit92:
if je=1 then print "mk/rho=.85"
if je=2 then print "mk/rho=2"
if je=3 then print "mk/rho=5"
for n=1 to nn-1
line (10+80*n/nmax,y1(n mod nn,m mod mm)+15)-(10+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+15),cl
line (10+80*n/nmax,y2((nn+n-nth-nn4) mod nn,m mod mm)+40)-(10+80*(n+1)/nmax,y2((nn+n-nth-nn4+1) mod nn,m mod mm)+40),cl+1
line (10+80*n/nmax,y1(n mod nn,m mod mm)+y2((nn+n-nth-nn4) mod nn,m mod mm)+75)-(10+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+y2((nn+n-nth-nn4+1) mod nn,m mod mm)+75),cl-1
next
for n=nn to nmax
line (10+80*n/nmax,t*y1((n+nth) mod nn,m mod mm)+15)-(10+80*(n+1)/nmax,t*y1((n+nth+1) mod nn,m mod mm)+15),cl
line (10+80*n/nmax,t*y1((n+nth) mod nn,m mod mm)+75)-(10+80*(n+1)/nmax,t*y1((n+nth+1) mod nn,m mod mm)+75),cl-1
next
n=nn
circle (10+80*n/nmax,t*y1((n+nth) mod nn,m mod mm)+75),1,clm
return

increase92:
if je<3 then je=je+1
tst=0
return

decrease92:
if je>1 then je=je-1
tst=0
return

p10p1:
cl=11
h=20
dt=.05
def fnf(t)
if t>=0 then fd=1-t
if t<0 then fd=1+t
if t>1 then fd=0
if t<-1 then fd=0
fnf=fd
end def

mmax=60

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

key(10) on
on key(10) gosub theend

thestart101:
t=-1
m=1
theloop101:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
if t>8 then goto thestart101:
gosub drawit101
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop101

drawit101:
REM do the drawing
xc=5+15*t
xc1=5+15*(t-1)
xc2=5+15*(t+1)
if t<0 then
line (5,40+h*fnf(-t))-(xc2,40),cl
line -(95,40),cl
end if
if t>=0 and t<1 then
line (5,40+h*fnf(-t))-(xc,40+h),cl
line -(xc2,40),cl
line -(95,40),cl
end if
if t>=1 and t<5 then
line (5,40)-(xc1,40),cl
line -(xc,40+h),cl
line -(xc2,40),cl
line -(95,40),cl
end if
if t>=5 and t<6 then
line (5,40)-(xc1,40),cl
line -(xc,40+h),cl
line -(95,40+h*fnf(6-t)),cl
end if
if t>=6 and t<7 then
line (5,40)-(xc1,40),cl
line -(95,40+h*fnf(6-t)),cl
end if
if t>=7 and t<8 then
line (5,40)-(95,40),cl
end if
circle (5,40+h*fnf(-t)),1,13
paint (5,40+h*fnf(-t)),13
t=t+dt
return

p10p2:
pi=4*atn(1)
cl=11
mm1=25
mm2=22
mmax=80
nn1=18
nn2=14
nmax=5*nn1

dim y1(nn1,mm1)
dim y3(nn2,mm2)

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

for n=0 to nn1
for m=0 to mm1
y1(n,m)=10*cos(2*pi*(n/nn1-m/mm1))
next
next

for n=0 to nn2
for m=0 to mm2
y3(n,m)=10*cos(2*pi*(n/nn2-m/mm2))
next
next

key(10) on
m=1
theloop102:
on key(10) gosub theend
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit102
m=m+1
goto theloop102

$segment

drawit102:
for n=0 to nmax
line (5+80*n/nmax,y1(n mod nn1,m mod mm1)+15)-(5+80*(n+1)/nmax,y1((n+1) mod nn1,m mod mm1)+15),cl-1
line (5+80*n/nmax,y3(n mod nn2,m mod mm2)+40)-(5+80*(n+1)/nmax,y3((n+1) mod nn2,m mod mm2)+40),cl+1
line (5+80*n/nmax,y1(n mod nn1,m mod mm1)+y3(n mod nn2,m mod mm2)+75)-(5+80*(n+1)/nmax,y1((n+1) mod nn1,m mod mm1)+y3((n+1) mod nn2,m mod mm2)+75),cl
line (5+80*n/nmax,75+20*cos(pi*(n/nn1-n/nn2-m/mm1+m/mm2)))-(5+80*(n+1)/nmax,75+20*cos(pi*((n+1)/nn1-(n+1)/nn2-m/mm1+m/mm2))),cl+3
line (5+80*n/nmax,75-20*cos(pi*(n/nn1-n/nn2-m/mm1+m/mm2)))-(5+80*(n+1)/nmax,75-20*cos(pi*((n+1)/nn1-(n+1)/nn2-m/mm1+m/mm2))),cl+3
line (5,75)-(95,75),5
next
return

p10p3:
thestart10p3:
input "input k2/k1  ";eps
cll=11
rpi=4*atn(1)
tau=2/(1+eps)
r=(1-eps)/(1+eps)
kappa=.05
dt=.2*(1+eps)
t=-30
nn=40

def fny10p3(x)
if kappa*x*x<10 then yyy10p3=exp(-kappa*x*x) else yyy10p3=0
fny10p3=yyy10p3
end def


screen scrnum,,1,1
window (-50,0)-(50,100)

screen scrnum,,0,0
window (-50,0)-(50,100)

m=1
gosub drawit10p3

on key(10) gosub theend
key(10) on
theloop10p3:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit10p3
t=t+dt
if eps<=1 then if t>30 then t=-30
if eps>1 then if t>30*eps then t=-30
m=m+1
goto theloop10p3

drawit10p3:
for n=-nn/2 to -1
line (100*n/nn,20*(fny10p3(n-t)+r*fny10p3(-n-t))+50)-(100*(n+1)/nn,20*(fny10p3(n+1-t)+r*fny10p3(-n-1-t))+50),cll
next
if eps=0 then
line (0,20*tau*fny10p3(-t)+50)-(50,20*tau*fny10p3(-t)+50),cll+1
else
for n=0 to eps*nn/2-1
line (100*n/nn/eps,20*tau*fny10p3(n-t)+50)-(100*(n+1)/nn/eps,20*tau*fny10p3((n+1)-t)+50),cll+1
next
end if
locate 19,17
print "k = 1";
locate 19,60
print "k =";
if eps=cint(eps) then
print eps;
else
print cint(eps*10)/10;
end if
locate 19,41
print "|";
return


p10p4:
cl=11
v=1
g=1
def fnthexp(x)
if x<0 then ff=0
if x>=0 then ff=exp(-g*x)
fnthexp=ff
end def
def fng(x,t)
if x<0 then f=exp(-g*abs(t-x/v))-exp(-g*abs(t+x/v))/2+g*(t+x/v)*fnthexp(t+x/v)
if x>=0 then f=exp(-g*abs(t-x/v))/2+g*(t-x/v)*fnthexp(t-x/v)
fng=f
end def

x0=-15
x1=15
t0=-10
t1=10
mmax=60
nmax=90
a=30

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

on key(10) gosub theend
key(10) on
m=1
theloop10p4:
t=t0+m*(t1-t0)/mmax
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit10p4
m=m+1
if m>mmax then m=1
goto theloop10p4

drawit10p4:
for n=0 to nmax
x=x0+n*(x1-x0)/nmax
xx=x+(x1-x0)/nmax
line (10+80*n/nmax,a*fng(x,t)+50)-(10+80*(n+1)/nmax,a*fng(xx,t)+50),cl
circle (50,a*fng(0,t)+50),1,cl+1
next
return


p11p1:
cll=12
dz=10
nxb%=3
nyb%=4
scrwidth=200
pi=atn(1)*4
modex%=1
modey%=1
ell=30
ellx=ell*nxb%
elly=ell*nyb%
c=.2
omega=1
dt=.1


def fna11p1(nx%,ny%)=sin(modex%*pi*nx%/(nxb%+1))*sin(modey%*pi*ny%/(nyb%+1))

screen scrnum,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen scrnum,,0,0
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
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit11p1
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop11p1

drawit11p1:
REM do the drawing
locate 1,1
print "n =";modey%;"   n' =";modex%;
call threedline(-ellx,-elly,0,ellx,-elly,0,cll)
call threedline(-ellx,-elly,0,-ellx,elly,0,cll)
call threedline(ellx,elly,0,ellx,-elly,0,cll)
call threedline(ellx,elly,0,-ellx,elly,0,cll)
for nx=0 to nxb%
for ny=0 to nyb%
call threedline(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fna11p1(nx,ny),-ellx+2*ellx*(nx+1)/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fna11p1((nx+1),(ny)),cll)
call threedline(-ellx+2*ellx*nx/(nxb%+1),-elly+2*elly*ny/(nyb%+1),dz*sin(omega*t)*fna11p1(nx,ny),-ellx+2*ellx*(nx)/(nxb%+1),-elly+2*elly*(ny+1)/(nyb%+1),dz*sin(omega*t)*fna11p1((nx),(ny+1)),cll)
next
next

t=t+dt
return

xup11p1:
if modex%<nxb% then modex%=modex%+1
omega=sqr((modex%^2+modey%^2)/2)
return
xdown11p1:
if modex%>1 then modex%=modex%-1
omega=sqr((modex%^2+modey%^2)/2)
return
yup11p1:
if modey%<nyb% then modey%=modey%+1
omega=sqr((modex%^2+modey%^2)/2)
return
ydown11p1:
if modey%>1 then modey%=modey%-1
omega=sqr((modex%^2+modey%^2)/2)
return

p11p2:
pi=4*atn(1)
l1=20
n1=sqr(10)
n2=2
l2=l1*n1/n2
theta1=.5
theta2=atn(n1*sin(theta1)/n2/sqr(1-(n1*sin(theta1)/n2)^2))
clv=13
cll=11
clb=12

'CHANGE THE HEIGHT TO GET THE ASPECT RATIO RIGHT
'THE VECTORS AND THE WAVE FRONTS SHOULD BE PERPENDICULAR
height=75

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

mmax=30

screen scrnum,,1,1
window (-50,0)-(50,height)

screen scrnum,,0,0
window (-50,0)-(50,height)

key(10) on
m=1
theloopllp1:
on key(10) gosub theend
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
x1=l1c*(mmax-m)/mmax
gosub drawit11p2
m=m+1
if m>mmax then m=1
goto theloopllp1

drawit11p2:
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

line (-40,20)-(-40+kx1,20+ky1),clv
line (20,20)-(20+kx2,20+ky2),clv
line (kx1-40,ky1+20)-(kx11-40,20+ky11),clv
line (kx1-40,ky1+20)-(kx12-40,20+ky12),clv
line (kx2+20,ky2+20)-(kx21+20,20+ky21),clv
line (kx2+20,ky2+20)-(kx22+20,20+ky22),clv

return

p11p3:
REM water wave tank
pi=atn(1)*4
height=60
dt=.2
omega=1
nk=1
k=nk*pi/80
eps=5
clp=11
cll=4
mmax=40
nx=20
ny=6
dxy=80/nx
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

screen scrnum,,1,1
window (-10,-10)-(90,height-10)

screen scrnum,,0,0
window (-10,-10)-(90,height-10)

on key(10) gosub theend
key(10) on
m=1
theloop11p3:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit11p3
m=m+1
REM if you want discrete repeats
if m>mmax then m=1
goto theloop11p3

drawit11p3:
REM do the drawing
line (-1,-1)-(81,-1),cll
line (-1,-1)-(-1,dxy*ny+3*eps),cll
line (81,-1)-(81,dxy*ny+3*eps),cll
for ix=0 to nx
for iy=0 to ny
pset(xp(ix,iy,m),yp(ix,iy,m)),clp
next
next
return

p11p4:
REM water wave tank
pi=atn(1)*4
height=70
dt=.2
omega=1
nk=1
k=nk*pi/80
eps=5
clp=11
cll=4
mmax=40
nx=20
ny=6
dxy=80/nx
dd=2*dxy*ny
dim xp(nx,ny,mmax)
dim yp(nx,ny,mmax)


for ix=0 to nx
for iy=0 to ny
for im=1 to mmax
xp(ix,iy,im)=ix*dxy+fnpsix(ix*dxy,iy*dxy,2*pi*im/mmax)
yp(ix,iy,im)=iy*dxy+fnpsiy(ix*dxy,iy*dxy,2*pi*im/mmax)
next
next
next

screen scrnum,,1,1
window (-10,-10)-(90,height-10)

screen scrnum,,0,0
window (-10,-10)-(90,height-10)

on key(10) gosub theend
key(10) on
m=1
theloop11p4:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit11p4
m=m+1
REM if you want discrete repeats
if m>mmax then m=1
goto theloop11p4

drawit11p4:
REM do the drawing
line (-1,-1)-(81,-1),cll
line (-1,-1)-(-1,dd+1),cll
line (81,-1)-(81,dd+1),cll
line (-1,dd+1)-(81,dd+1),cll
for ix=0 to nx
for iy=0 to ny
pset(xp(ix,iy,m),yp(ix,iy,m)),clp
pset(80-xp(ix,iy,m),dd-yp(ix,iy,m)),10
next
next
return

p12p1:
scrwidth=200
pi=atn(1)*4
u1=1
phi1=0
u2=1
phi2=0
dt=.03
t=0
cll=12
nmu%=10
nphi%=0
nmphi%=10
nu1%=nmu%
nu2%=nmu%
mmm=24
screen scrnum,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen scrnum,,0,0
window (-scrwidth,-150)-(scrwidth,150)

on key(10) gosub theend
key(10) on
on key (1) gosub phidown12p1
key(1) on
on key (2) gosub phiup12p1
key(2) on
on key (12) gosub u1down12p1
key(12) on
on key (13) gosub u1up12p1
key(13) on
on key (14) gosub u2down12p1
key(14) on
on key (11) gosub u2up12p1
key(11) on


thestart12p1:
t=0
m=1
theloop12p1:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop12p1

drawit:
if nphi%=0 then ss$=" "
if nphi%>0 then ss$="+"
if nphi%<0 then ss$="-"
locate 1,1
print chr$(218);"             ";chr$(191)
print chr$(179);"     ";
print using "#.#"; u1;
print "     ";chr$(179)
print chr$(179);"             ";chr$(179)
print chr$(179);"      ";ss$;
print using "#.#";abs(nphi%/nmphi%);
print "i";chr$(227);" ";chr$(179)
print chr$(179);
print using " #.#";u2;
print chr$(250);"e       ";chr$(179)
print chr$(192);"             ";chr$(217)
REM do the drawing
line (0,0)-(100*u1*cos(t-phi1),0),cll-1
line (0,0)-(0,100*u2*cos(t-phi2)),cll
line (0,0)-(100*u1*cos(t-phi1),100*u2*cos(t-phi2)),cll+1
for mm=0 to mmm
pset (100*u1*cos(2*pi*mm/mmm-phi1),100*u2*cos(2*pi*mm/mmm-phi2)),14
next
t=t+dt
return

phidown12p1:
nphi%=nphi%-1
if nphi%<=-nmphi% then nphi%=nphi%+nmphi%+nmphi%
phi2=nphi%*pi/nmphi%
return
phiup12p1:
nphi%=nphi%+1
if nphi%>nmphi% then nphi%=nphi%-nmphi%-nmphi%
phi2=nphi%*pi/nmphi%
return

u1up12p1:
if nu1%<nmu% then nu1%=nu1%+1
u1=nu1%/nmu%
return
u1down12p1:
if nu1%>0 then nu1%=nu1%-1
u1=nu1%/nmu%
return
u2up12p1:
if nu2%<nmu% then nu2%=nu2%+1
u2=nu2%/nmu%
return
u2down12p1:
if nu2%>0 then nu2%=nu2%-1
u2=nu2%/nmu%
return

p12p2:
plotarea=200
k12=3
pi=4*atn(1)
randomize timer
nn=2
dt=.03*nn
dim o1(nn)
dim o2(nn)
dim f1(nn)
dim f2(nn)

for j=1 to nn
o1(j)=rnd-1/2
o2(j)=rnd-1/2
f1(j)=pi*(rnd-1/2)
f2(j)=pi*(rnd-1/2)
next

d=10

def fnx12(t)
  fx=0
  for j=1 to nn
  fx=fx+cos((1+o1(j)/d)*t+f1(j))
  next
  fnx12=fx/nn
  end def

def fny12(t)
  fy=0
  for j=1 to nn
  fy=fy+cos((1+o2(j)/d)*t+f2(j))
  next
  fny12=fy/nn
end def


def fnx12x(x)=200*(x-xmin)/(xmax-xmin)
def fny12y(y)=200*(y-ymin)/(ymax-ymin)

xmin=-1
xmax=1
ymin=-1
ymax=1

screen scrnum
window (-60,-25)-(245,205)

x=fnx12(0)
y=fny12(0)
t=0
theloop12p2:
t=t+dt
nx=fnx12(t)
ny=fny12(t)
line (fnx12x(x),fny12y(y))-(fnx12x(nx),fny12y(ny)),cint(13+t/200)
x=nx
y=ny
goto theloop12p2



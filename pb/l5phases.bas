pi=4*atn(1)
dim mm(6)
dim a(6)
dim phi(6)

cl=11
clc=12
bottom=0
side=300

REM the parameters in the K matrix
em=2
bm=1.2
cm=-.3
dm=.1

REM the dispersion relation
for k=0 to 3
mm(k)=round(41/sqr(em-2*bm*cos(k*pi/3)-2*cm*cos(2*k*pi/3)-dm*cos(k*pi)),0)
next
mm(4)=mm(2)
mm(5)=mm(1)

'print mm(0),mm(1),mm(2),mm(3)
'end

REM the amplitudes of the different normal modes
a(0)=0
a(1)=3
a(2)=0
a(3)=0
a(4)=0
a(5)=3

a(0)=0
phi(1)=0
phi(2)=0
phi(3)=0
phi(4)=0
phi(5)=pi/2



dim yy(6)
dim y(5,6,mm(0))

gosub recalc42

on key(1) gosub 1
on key(2) gosub 2
on key(3) gosub 3
on key(4) gosub 4
on key(5) gosub 5
on key(6) gosub 6
on key(9) gosub 7
on key(10) gosub theend42

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
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit42
m=m+1
goto theloop42

theend42:
end
return

recalc42:
cls
screen 9,,1,1
window (-side/2,bottom-110)-(side/2,110)
cls
screen 9,,0,0
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
y(k,n,m)=a(k)*.1*cos(k*pi*(n)/3)*cos(2*pi*(m-1)/mm(k)-phi(k))
next
next
next
for k=4 to 4
for n=0 to 5
for m=0 to mm(k)
y(k,n,m)=a(k)*.1*sin(2*pi*(n)/3)*cos(2*pi*(m-1)/mm(k)-phi(k))
next
next
next
for k=5 to 5
for n=0 to 5
for m=0 to mm(k)
y(k,n,m)=a(k)*.05*sin(pi*(n)/3)*cos(2*pi*(m-1)/mm(k)-phi(k))
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

delay .05

return

1 a(0)=0
a(1)=1
a(2)=0
a(3)=0
a(4)=0
a(5)=0
gosub recalc42:return

2 a(0)=0
a(1)=0
a(2)=1
a(3)=0
a(4)=0
a(5)=0
gosub recalc42:return

3 a(0)=0
a(1)=0
a(2)=0
a(3)=1
a(4)=0
a(5)=0
gosub recalc42:return

4 a(0)=0
a(1)=0
a(2)=0
a(3)=0
a(4)=1
a(5)=0
gosub recalc42:return

5 a(0)=0
a(1)=0
a(2)=0
a(3)=0
a(4)=0
a(5)=1
gosub recalc42:return

6 a(0)=2
a(1)=0
a(2)=0
a(3)=0
a(4)=0
a(5)=0
gosub recalc42:return

7 a(0)=2
a(1)=1
a(2)=1
a(3)=1
a(4)=1
a(5)=1
gosub recalc42:return

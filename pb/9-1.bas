scrnum=9
pi=4*atn(1)
cl=14
r=.3
mm=50
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
theloop:
on key(10) gosub theend
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
goto theloop
theend:
end
return

drawit:
for n=0 to nmax
line (5+80*n/nmax,y1(n mod nn,m mod mm)+15)-(5+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+15),cl
line (5+80*n/nmax,y2(n mod nn,m mod mm)+40)-(5+80*(n+1)/nmax,y2((n+1) mod nn,m mod mm)+40),cl-1
line (5+80*n/nmax,y1(n mod nn,m mod mm)+y2(n mod nn,m mod mm)+75)-(5+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+y2((n+1) mod nn,m mod mm)+75),cl+1
next
delay .05
return


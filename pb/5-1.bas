$compile chain
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

screen 9,,1,1
window (0,0)-(100,100)

screen 9,,0,0
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
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit51
m=m+1
on key(10) gosub theend51
goto theloop51

theend51:
cls
chain "lbas5.exe"
end
return

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

delay .05

return

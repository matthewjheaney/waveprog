$compile chain
scrnum=9
on key(10) gosub theend
key(10) on
cls
nn=4
pi=4*atn(1)
nn=nn+1
dim mm(nn-1)
dim a(nn-1)
dim b(nn-1)
dim c(nn)
cl=11
clc=10
cl2=11
clc2=15
cp=13

for k=1 to nn-1
mm(k)=80/sqr(3-2*cos(k*pi/nn))
next

for k=1 to nn-1
a(k)=3/nn
b(k)=0
next

c(1)=3
c(2)=5
c(3)=1
c(4)=2
c(5)=4

b(1)=1
b(2)=0
b(3)=1
b(4)=0

mmax=350
nmax=nn
dim yy(nn)
dim y(nn-1,nn,mm(1))
dim mr(nn)

mr(1)=4
mr(2)=3
mr(3)=1
mr(4)=2
mr(5)=5
mr(6)=6

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
locate 5,5
print 1
locate 9,5
print 2
locate 13,5
print 3
locate 17,5
print 4
locate 21,5
print 5

for n=0 to nn
yy(n)=0
for k=1 to nn-1
yy(n)=yy(n)+b(k)*y(k,n,m mod mm(k))
next
next
for n=0 to nmax-1
line (12+80*n/nmax+yy(n),80*c(nn)/nn)-(8+80*(n+1)/nmax+yy(n+1),80*c(nn)/nn),cl2
for k=1 to nn-1
line (12+80*n/nmax+y(mr(k),n,m mod mm(mr(k))),c(k)*80/nn)-(8+80*(n+1)/nmax+y(mr(k),n+1,m mod mm(mr(k))),c(k)*80/nn),cl2
next

next
for n=1 to nmax-1
circle (10+80*n/nmax+yy(n),80*c(nn)/nn) ,2,clc2
for k=1 to nn-1
circle (10+80*n/nmax+y(mr(k),n,m mod mm(mr(k))),c(k)*80/nn) ,2,clc2
next
next

delay .05

return

theend:
clear
cls
chain "lbas4.exe"
end

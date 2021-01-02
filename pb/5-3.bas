pi=4*atn(1)
nn=4
dim mm(nn-1)
dim a(nn-1)
option base 0

for k=0 to nn-1
mm(k)=40/sqr(3-2*cos(k*pi/nn))
next

a(1)=.7
a(2)=.7
a(3)=.7
a(0)=.7

nmax=nn
dim yy(nn)
dim y(nn-1,nn,mm(0))

screen 9,,1,1
window (0,0)-(100,110)

screen 9,,0,0
window (0,0)-(100,110)

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
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit53
m=m+1
on key(10) gosub theend53
goto theloop53

theend53:
end
return

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

for n=1 to nn
circle (80*n/nmax,10+yy(n)) ,1
for k=0 to nn-1
circle (80*n/nmax,10+k*80/nn+y(k,n,m mod mm(k))) ,1,5
next
next

return
return



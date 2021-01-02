$compile chain
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
a(k)=4/nn
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
y(k,n,m)=a(k)*5*sin(k*pi*(n)/nn)*sin(2*pi*(m-1)/mm(k))
next
next
next

key(10) on
m=1
theloop52:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit52
m=m+1
on key(10) gosub theend52
goto theloop52

theend52:
cls
chain "lbas7.exe"
end
return

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
delay .05
return


$compile chain
scrnum=9
pi=4*atn(1)
cl=14
clm=13
dim eps(3)
eps(1)=.85
eps(2)=2
eps(3)=5
mm=80
mmax=100
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

theend:
cls
chain "lbas11.exe"
end
return

drawit92:
if je=1 then print "m/kl=.85"
if je=2 then print "m/kl=2"
if je=3 then print "m/kl=5"
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
circle (10+80*n/nmax,t*y1((n+nth) mod nn,m mod mm)+75),1,cl
paint (10+80*n/nmax,t*y1((n+nth) mod nn,m mod mm)+75),cl
delay .05
return

increase92:
if je<3 then je=je+1
tst=0
return

decrease92:
if je>1 then je=je-1
tst=0
return


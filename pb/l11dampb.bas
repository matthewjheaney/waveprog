pi=4*atn(1)
kk=2
kp=1
cl=11
mm=200
mmax=10
cycles=11
nmax%=5
nn=2
print nmax%

dim y1(nmax%,mm)

screen 9,,1,1
window (0,0)-(100,100)

screen 9,,0,0
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
on key(10) gosub theend85:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit85
m=m+1
goto theloop85
theend85:
end
return

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



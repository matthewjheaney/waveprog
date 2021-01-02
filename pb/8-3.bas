$compile chain
pi=4*atn(1)
kk=4
kp=2
cl=11
mm=80
mmax=200
nn=50
cycles=7/4
nmax%=2*nn*cycles/kk

dim y1(nn,mm)

screen 9,,1,1
window (0,0)-(100,100)

screen 9,,0,0
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
on key(10) gosub theend83:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit83
m=m+1
goto theloop83

theend83:
cls
chain "lbas11.exe"
end
return

drawit83:
rem line (0,60)-(3,60)
line (0,50)-(100,50)
for n=0 to nmax%-1
line (100*n/nmax%,y1(n,m mod mm)+50)-(100*(n+1)/nmax%,y1(n+1,m mod mm)+50),cl
next
delay .05
return

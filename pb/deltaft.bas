pi=4*atn(1)
w=0.5
k=1
a0=40
nn=100
nterms=40
mm0=16
dim psi(nn)
ep=.313
screen 9,,1,1
window (0,0)-(200,200)

screen 9,,0,0
window (0,0)-(200,200)

m=1
key(10) on

theloop63:
on key(10) gosub theend63
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit63
m=m+1
goto theloop63
theend63:
end
return

drawit63:
for n=0 to nn
psi(n)=0
for k=0 to nterms
psi(n)=psi(n)+1/ep/(1/ep^2-k^2)*cos(k*pi*ep/2)*cos(k*n*pi/nn)*cos(m*k/mm0)
next
psi(n)=psi(n)*a0
next
for n=0 to nn-1
line (10+160*n/nn,80+psi(n))-(10+160*(n+1)/nn,80+psi(n+1)),11
next
return

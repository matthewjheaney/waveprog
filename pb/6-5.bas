$compile chain
cls
print "Input w"
input w
print
print
print "Input number of terms in Fourier series"
input nterms
pi=4*atn(1)
k=1
a0=40
nn=30
mm0=16
dim psi(nn)

screen 9,,1,1
window (0,0)-(200,200)

screen 9,,0,0
window (0,0)-(200,200)

m=1
key(10) on

theloop64:
on key(10) gosub theend64
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit64
m=m+1
goto theloop64
theend64:
cls
chain "lbas8.exe"
end
return

drawit64:
for n=0 to nn-1
psi(n)=0
for k=1 to nterms
psi(n)=psi(n)+sin(w*k*pi)/k/k*sin(k*n*pi/nn)*cos(m*k/mm0)
next
psi(n)=psi(n)*a0/4/w/(1-w)
next


for n=0 to nn-1
line (10+160*n/nn,80+psi(n))-(10+160*(n+1)/nn,80+psi(n+1)),11
next
return


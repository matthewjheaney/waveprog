$compile chain
pi=4*atn(1)
mm=80
mmax=50
nn=20
nmax=5*nn/4-1
cl=11
clr=12
cll=13

dim y1(nn,mm)
dim y2(nn,mm)

screen 9,,1,1
window (0,0)-(100,100)

screen 9,,0,0
window (0,0)-(100,100)

for n=0 to nn
for m=0 to mm
y1(n,m)=10*cos(2*pi*(n)/nn)*cos(2*pi*(m-1)/mm)
y2(n,m)=10*sin(2*pi*(n)/nn)*sin(2*pi*(m-1)/mm)
next
next

key(10) on
m=1
theloop81:
on key(10) gosub theend81
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit81
m=m+1
goto theloop81
theend81:
cls
chain "lbas9.exe"
end
end
return

drawit81:
for n=0 to nmax
line (10+80*n/nmax,y1(n mod nn,m mod mm)+y2(n mod nn,m mod mm)+45)-(10+80*(n+1)/nmax,y1((n+1) mod nn,m mod mm)+y2((n+1) mod nn,m mod mm)+45),cl
next
circle (10+80/nmax*nn*((m-1) mod mm)/mm,55),1
if ((m mod mm)*4<=mm) then circle (10+80*nn/nmax+80/nmax*nn*((m-1) mod mm)/mm,55),1
delay .05
return


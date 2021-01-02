$compile chain
pi=4*atn(1)
cl=11
mm1=25
mm2=22
mmax=40
nn1=18
nn2=14
nmax=5*nn1

dim y1(nn1,mm1)
dim y3(nn2,mm2)

screen 9,,1,1
window (0,0)-(100,100)

screen 9,,0,0
window (0,0)-(100,100)

for n=0 to nn1
for m=0 to mm1
y1(n,m)=10*cos(2*pi*(n/nn1-m/mm1))
next
next

for n=0 to nn2
for m=0 to mm2
y3(n,m)=10*cos(2*pi*(n/nn2-m/mm2))
next
next

key(10) on
m=1
theloop102:
on key(10) gosub theend
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit102
m=m+1
goto theloop102
theend:
cls
chain "lbas13.exe"
end
end
return

drawit102:
for n=0 to nmax
line (5+80*n/nmax,y1(n mod nn1,m mod mm1)+15)-(5+80*(n+1)/nmax,y1((n+1) mod nn1,m mod mm1)+15),cl-1
line (5+80*n/nmax,y3(n mod nn2,m mod mm2)+40)-(5+80*(n+1)/nmax,y3((n+1) mod nn2,m mod mm2)+40),cl+4
line (5+80*n/nmax,y1(n mod nn1,m mod mm1)+y3(n mod nn2,m mod mm2)+75)-(5+80*(n+1)/nmax,y1((n+1) mod nn1,m mod mm1)+y3((n+1) mod nn2,m mod mm2)+75),cl
line (5+80*n/nmax,75+20*cos(pi*(n/nn1-n/nn2-m/mm1+m/mm2)))-(5+80*(n+1)/nmax,75+20*cos(pi*((n+1)/nn1-(n+1)/nn2-m/mm1+m/mm2))),cl+3
line (5+80*n/nmax,75-20*cos(pi*(n/nn1-n/nn2-m/mm1+m/mm2)))-(5+80*(n+1)/nmax,75-20*cos(pi*((n+1)/nn1-(n+1)/nn2-m/mm1+m/mm2))),cl+3
line (5,75)-(95,75),5
next
delay .05
return


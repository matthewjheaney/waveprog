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
cl=11
clc=10
cl2=11
clc2=15
cp=13

for k=1 to nn-1
mm(k)=round(40/sqr(3-2*cos(k*pi/nn)),0)
next

for k=1 to nn-1
a(k)=3/nn
next

mmax=350
nmax=nn
dim yy(nn)
dim y(nn-1,nn,mm(1))
dim mr(nn)

randomize timer

for i=1 to nn-1
therndloop:
chkn=0
mrc=int((nn-1)*rnd)+1
for j=1 to i-1
if mr(j)=mrc then chkn=1
next
if chkn=1 then goto therndloop else mr(i)=mrc
next


for i=1 to nn
print mr(i),i
next

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
for n=0 to nmax-1
for k=1 to nn-1
line (12+80*n/nmax+y(mr(k),n,m mod mm(mr(k))),k*100/nn)-(8+80*(n+1)/nmax+y(mr(k),n+1,m mod mm(mr(k))),k*100/nn),cl2
next
next

for n=1 to nmax-1
for k=1 to nn-1
circle (10+80*n/nmax+y(mr(k),n,m mod mm(mr(k))),k*100/nn) ,2,clc2
next
next

delay .05

return

theend:
cls
chain "lbas6.exe"
end
return

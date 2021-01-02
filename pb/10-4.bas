$compile chain
scrnum=9
p10p4:
cl=11
v=1
g=1
def fnthexp(x)
if x<0 then ff=0
if x>=0 then ff=exp(-g*x)
fnthexp=ff
end def
def fng(x,t)
if x<0 then f=exp(-g*abs(t-x/v))-exp(-g*abs(t+x/v))/2+g*(t+x/v)*fnthexp(t+x/v)
if x>=0 then f=exp(-g*abs(t-x/v))/2+g*(t-x/v)*fnthexp(t-x/v)
fng=f
end def

x0=-15
x1=15
t0=-10
t1=10
mmax=60
nmax=90
a=30

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

on key(10) gosub theend
key(10) on
m=1
theloop10p4:
t=t0+m*(t1-t0)/mmax
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit10p4
delay .1
m=m+1
if m>mmax then m=1
goto theloop10p4

drawit10p4:
for n=0 to nmax
x=x0+n*(x1-x0)/nmax
xx=x+(x1-x0)/nmax
line (10+80*n/nmax,a*fng(x,t)+50)-(10+80*(n+1)/nmax,a*fng(xx,t)+50),cl
circle (50,a*fng(0,t)+50),1,cl+1
next
return

theend:
cls
chain "lbas14.exe"
end
end
return

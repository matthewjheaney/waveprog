$compile chain
pi=4*atn(1)
stringcolor=11
beadcolor=14
nn=7
scrnum=9
domega=.05
omega=6
lfc=5
hfc=7
dt=.02
t=0
dim yy(nn+1)

def fny86(x,t)
if (omega<7) and (omega>5) then
k=2*atn(sqr(omega^2-25)/(hfc^2-omega^2))
fny86=10*cos(k*x-omega*t)
end if
if omega>7 then
k=2*log(sqr((omega^2-hfc^2)/(hfc^2-lfc^2))+sqr((omega^2-25)/(hfc^2-lfc^2)))
fny86=10*exp(-k*x)*cos(pi*x)*cos(omega*t)
end if
if omega<5 then
k=2*log(sqr((hfc^2-omega^2)/(hfc^2-lfc^2))+sqr((25-omega^2)/(hfc^2-lfc^2)))
fny86=10*exp(-k*x)*cos(omega*t)
end if
if omega=7 then
fny86=10*cos(pi*x)*cos(omega*t)
end if
if omega=5 then
fny86=10*cos(omega*t)
end if
end def

screen scrnum,,1,1
window (0,0)-(100,100)

screen scrnum,,0,0
window (0,0)-(100,100)

m=1
gosub drawit86

on key(10) gosub theend
on key(11) gosub increase86
on key(14) gosub decrease86
on key(13) gosub increasel86
on key(12) gosub decreasel86

key(10) on
key(11) on
key(12) on
key(13) on
key(14) on
theloop:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit86
t=t+dt
m=m+1
goto theloop

theend:
cls
chain "lbas10.exe"
end
end
return

increase86:
omega=omega+domega
return

decrease86:
omega=omega-domega
return

increasel86:
if domega<.02 then domega=domega*10
return

decreasel86:
if domega>.000002 then domega=domega/10
return

drawit86:
print "omega =";
print using " #.#######";omega;
print "     domega =";
print using " #^^^^";domega
line (10,50)-(100,50),3
for n=0 to nn+1
yy(n)=fny86(n,t)
next
for n=0 to nn
line (10+80*n/nn,yy(n)+50)-(10+80*(n+1)/nn,yy(n+1)+50),stringcolor
next
for n=1 to nn+1
circle (10+80*n/nn,yy(n)+50) ,1,beadcolor
line (10+80*n/nn,50)-(10.5+80*n/nn,yy(n)/2+50)
line (10+80*n/nn,yy(n)+50)-(10.5+80*n/nn,yy(n)/2+50)
next
delay .05
return


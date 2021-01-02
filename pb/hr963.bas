'$compile chain
scrnum=9
thestart10p3:
eps=2
cll=11
rpi=4*atn(1)
tau=2/(1+eps)
r=(1-eps)/(1+eps)
kappa=.05
dt=.2*(1+eps)
t=-30
nn=40

def fny10p3(x)
if kappa*x*x<10 then yyy10p3=exp(-kappa*x*x) else yyy10p3=0
fny10p3=yyy10p3
end def


screen scrnum,,1,1
window (-50,0)-(50,100)

screen scrnum,,0,0
window (-50,0)-(50,100)

m=1
gosub drawit10p3

on key(10) gosub theend
key(10) on
theloop:
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit10p3
delay .05
t=t+dt
if eps<=1 then if t>30 then t=-30
if eps>1 then if t>30*eps then t=-30
m=m+1
goto theloop

theend:
cls
chain "lbas14.exe"
end
end
return

drawit10p3:
for n=-nn/2 to -1
line (100*n/nn,20*(fny10p3(n-t)+r*fny10p3(-n-t))+50)-(100*(n+1)/nn,20*(fny10p3(n+1-t)+r*fny10p3(-n-1-t))+50),cll
next
if eps=0 then
line (0,20*tau*fny10p3(-t)+50)-(50,20*tau*fny10p3(-t)+50),cll+1
else
for n=0 to eps*nn/2-1
line (100*n/nn/eps,20*tau*fny10p3(n-t)+50)-(100*(n+1)/nn/eps,20*tau*fny10p3((n+1)-t)+50),cll+1
next
end if
locate 17,17
print "k";
locate 17,60
print "k'";
locate 17,41
print "|";
return


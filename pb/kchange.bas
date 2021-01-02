$compile chain
scrnum=9
nxb%=3
nyb%=3
scrwidth=250
pi=atn(1)*4
dt=.15
dx=1
o=1
k=.1
kp=.1
dkp=.02
dim a(5,5)

def fnpsi(x,t)
	if x<0 then fnpsi=a*(cos(k*x-o*t)+r*cos(k*x+o*t))
	if x>=0 then fnpsi=a*tau*cos(kp*x-o*t)
end def

def fnpsi0(x,t)
	if x<=0 then fnpsi0=a*(cos(k*x-o*t))
	if x>0 then fnpsi0=0

end def

def fnpsir(x,t)
	if x<=0 then fnpsir=a*(r*cos(k*x+o*t))
	if x>0 then fnpsir=0
end def

def fncl(x)
	if x<=0 then fncl=11
	if x>0 then fncl=13
end def

screen scrnum,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen scrnum,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

key(14) on
on key(14) gosub kpdown

key(11) on
on key(11) gosub kpup

key(1) on
on key(1) gosub toggle

key(2) on
on key(2) gosub pause

thestartzzz:
ch=1
t=0
m=1
r=(k-kp)/(k+kp)
tau=2*k/(k+kp)
a=30
theloopzzz:
if ch=0 then goto thestartzzz
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloopzzz

theend:
cls
chain "lbas11.exe"
end
return

drawit:
REM do the drawing
if sg%=1 then line (dx/2,35)-(dx/2,135)
for x=-scrwidth to scrwidth step dx
line (x,85+fnpsi(x,t))-(x+dx,85+fnpsi(x+dx,t)),fncl(x)
next
for x=-scrwidth to -dx step dx
line (x,fnpsi0(x,t))-(x+dx,fnpsi0(x+dx,t)),fncl(x)
line (x,-85+fnpsir(x,t))-(x+dx,-85+fnpsir(x+dx,t)),fncl(x)
next
t=t+dt
return


kpdown:
ch=0
if kp>dkp then kp=kp-dkp
return

kpup:
ch=0
kp=kp+dkp
return


toggle:
if tg%=0 then sg%=1
if tg%=1 then sg%=0
tg%=sg%
return

pause:
i$=inkey$
if i$="" then goto pause
return

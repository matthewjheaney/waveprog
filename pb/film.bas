$compile chain
type complex
r as ext
i as ext
end type

dim z as complex
dim z1 as complex
dim z2 as complex
dim z3 as complex
dim z4 as complex
dim z5 as complex
dim z6 as complex
dim z7 as complex
dim z8 as complex
dim tau as complex
dim r as complex
dim tii as complex
dim rii as complex

pi=4*atn(1)

sub cabs(z as complex,r)
 r=(z.r^2+z.i^2)^(1/2)
end sub

sub cadd(z1 as complex,z2 as complex,z3 as complex)
	z3.r=z1.r+z2.r
	z3.i=z1.i+z2.i
end sub

sub csub(z1 as complex,z2 as complex,z3 as complex)
	z3.r=z1.r-z2.r
	z3.i=z1.i-z2.i
end sub

sub cmul(z1 as complex,z2 as complex,z3 as complex)
	dim zl as complex
	zl.r=z1.r*z2.r-z1.i*z2.i
	zl.i=z1.r*z2.i+z1.i*z2.r
	z3=zl
end sub

sub cdiv(z1 as complex,z2 as complex,z3 as complex)
	dim zl as complex
	zl.r=(z1.r*z2.r+z1.i*z2.i)/(z2.r^2+z2.i^2)
	zl.i=(-z1.r*z2.i+z1.i*z2.r)/(z2.r^2+z2.i^2)
	z3=zl
end sub

sub crea(r,z as complex)
	z.r=r
	z.i=0
end sub

sub ccon(z1 as complex,z2 as complex)
	z2.r=z1.r
	z2.i=-z1.i
end sub



scrnum=9
nxb%=3
nyb%=3
scrwidth=250
pi=atn(1)*4
dt=.15
dx=.5
o=1
k1=pi/100
k2=pi/100
dk2=pi/600
dim a(5,5)
l=50

sub cz(k1,k2,z as complex)
	shared l
	z.r=cos(k2*l)
	z.i=-(k1^2+k2^2)/2/k1/k2*sin(k2*l)
end sub

sub param(k1,k2,tau as complex,r as complex,tii as complex,rii as complex)
	shared l
	dim z as complex
	dim ze as complex
	dim z1 as complex
	dim z2 as complex
	call cz(k1,k2,z)
	ze.r=cos(k1*l)
	ze.i=-sin(k1*l)
	call cdiv(ze,z,tau)
	z1.r=(1+k1/k2)/2*cos(k2*l)
	z1.i=-(1+k1/k2)/2*sin(k2*l)
	call cdiv(z1,z,tii)
	z1.r=(1-k1/k2)/2*cos(k2*l)
	z1.i=(1-k1/k2)/2*sin(k2*l)
	call cdiv(z1,z,rii)
	z2.r=0
	z2.i=-(k1^2-k2^2)/2/k1/k2*sin(k2*l)
	call cdiv(z2,z,r)
end sub


function psi(x,t)
	shared a,k1,k2,l,o,tau,r,tii,rii
	if x<0 then psi=a*(cos(k1*x-o*t)+r.r*cos(k1*x+o*t)+r.i*sin(k1*x+o*t))
	if x>=l then psi=a*(tau.r*cos(k1*x-o*t)-tau.i*sin(k1*x-o*t))
	if (x>=0) and (x<l) then psi=a*(tii.r*cos(k2*x-o*t)-tii.i*sin(k2*x-o*t)+rii.r*cos(k2*x+o*t)+rii.i*sin(k2*x+o*t))
end function

def fncl(x)
	if (x<0) or (x>l) then fncl=11 else fncl=13
end def

screen scrnum,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen scrnum,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

key(14) on
on key(14) gosub k2down

key(11) on
on key(11) gosub k2up

key(1) on
on key(1) gosub toggle

key(2) on
on key(2) gosub pause

thestartzzz:
ch=1
call param(k1,k2,tau,r,tii,rii)
t=0
m=1
a=30
theloopzzz:
if ch=0 goto thestartzzz
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloopzzz

theend:
cls
chain "lbas13.exe"
end
end

drawit:
REM do the drawing
if tg%=1 then line (0,50)-(0,-50)
if tg%=1 then line (l,50)-(l,-50)
for x=-scrwidth to scrwidth step dx
line (x,psi(x,t))-(x+dx,psi(x+dx,t)),fncl(x)
next
t=t+dt
return


k2down:
ch=0
if k2>dk2 then k2=k2-dk2
return

k2up:
ch=0
k2=k2+dk2
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

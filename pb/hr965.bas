$compile exe
on timer(300) gosub thechain
timer on
on key(10) gosub theend
key(10) on
on key(9) gosub thechain
key(9) on

nxb%=3
nyb%=3
scrwidth=250
scrnum=9
pi=atn(1)*4
dt=.15
dim a(6,5)
dim o(5)
dim s$(5)
s$(1)=" "
s$(2)=" B"
s$(3)=" C"

for j=1 to 5
o(j)=sin(pi*j/12)
next

for j=1 to 5
a(j,j)=10
next

def fny(l,k,t)
yy=0
for jfn=1 to 5
yy=yy+a(l,jfn)*sin(jfn*k*pi/6)*cos(o(jfn)*t)
next
fny=yy
end def

screen scrnum,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen scrnum,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

key(1) on
on key(1) gosub npa

np=6
gosub npa

thestartzzz:
cht=1

t=0
m=1
theloopzzz:
if cht=0 then goto thestartzzz
screen scrnum,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
for j=1 to np-1
locate 27-4*j,7
print j
next
locate 3,7
print s$(sn)
for j=1 to np
pset (-150, 48*j-168)
for k=1 to 5
line -(-150+50*k, 48*j-168+fny(j,k,t))
circle (-150+50*k, 48*j-168+fny(j,k,t)),3,11
next
line -(150, 48*j-168)
next

goto theloopzzz

theend:
cls
end
return

thechain:
cls
chain "hr962"
return

npa:
sn=1
for jnp=1 to 5
a(6,jnp)=0
next
a(6,2)=-20
a(6,4)=10
cht=0
return

drawit:
REM do the drawing
t=t+dt
return

$compile chain
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

key(2) on
on key(2) gosub npb

key(3) on
on key(3) gosub npc

np=6
'yto=timer
'dyt=60
gosub npa

thestartzzz:
cht=1

t=0
m=1
theloopzzz:
'yt=timer
'if sn=1 and yt-yto>dyt then gosub npb
'if sn=2 and yt-yto>dyt then gosub npc
'if sn=3 and yt-yto>dyt then gosub npa
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
chain "lbas8.exe"
end
return

npa:
yto=timer
sn=1
for jnp=1 to 5
a(6,jnp)=0
next
a(6,1)=-10
a(6,3)=10
cht=0
return

npb:
yto=timer
sn=2
for jnp=1 to 5
a(6,jnp)=0
next
a(6,2)=5
a(6,4)=5
cht=0
return

npc:
yto=timer
sn=3
for jnp=1 to 5
a(6,jnp)=0
next
a(6,1)=5
a(6,4)=5
cht=0
return

np5:
yto=timer
dyt=5
sn=1
for j=1 to 5
for k=1 to 5
a(j,k)=0
next
next
for j=1 to 5
a(j,j)=10
next
s$="A"
np=5
cht=0
return

drawit:
REM do the drawing
t=t+dt
return

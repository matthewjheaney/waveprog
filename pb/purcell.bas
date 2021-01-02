$compile chain
on key(10) gosub theend
key(10) on
cll=11
v=.4
dv=.05
pi=4*atn(1)
gaminv=sqr(1-v*v)
rmax=300/gaminv
n=20
scrwidth=210
dr=1.5
mm=400/dr
dth=.005
tg=0

key(13) on
on key(13) gosub xplus

key(12) on
on key(12) gosub xminus

def fnatn(s,c)
   if c>0 then fth=atn(s/c)
   if c=0 then fth=pi/2
   if c<0 then fth=pi-atn(-s/c)
   fnatn=fth
end def

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

theloop:
tg=0
m=1
screen 9,,(m mod 2),((m-1) mod 2)
cls

r=0
rp=0
tt=0
line (v*r,0)-(rmax,0),3
if frac(n/2)=0 then line (v*r,0)-(-rmax,0),n/2 mod 5 +3
for j=1 to (n-1)/2
theta=2*pi*j/n
gosub drawit
next
m=2
screen 9,,(m mod 2),((m-1) mod 2)
delay 2
cls
line (v*r,0)-(rmax,0),3
if frac(n/2)=0 then line (v*r,0)-(-rmax,0),n/2 mod 5 +3
for j=1 to (n-1)/2
theta=2*pi*j/n
gosub drawit
next

tt=5

for m=3 to mm
r=dr*(m-2)
delay .054
screen 9,,(m mod 2),((m-1) mod 2)
cls
line (v*r,0)-(rmax,0),3
if frac(n/2)=0 then line (v*r,0)-(-rmax,0),n/2 mod 5 +3
for j=1 to (n-1)/2
theta=2*pi*j/n
rp=r+tt
if tg=1 then goto theloop
gosub drawit
next
next

goto theloop

end

drawit:
cost=cos(theta)
sint=sin(theta)
costp=(cost+v)/(1+v*cost)
sintp=gaminv*sint/(1+v*cost)
thetap=fnatn(sintp,costp)
line (rp*cost,rp*sint)-(rmax*cost,rmax*sint),j mod 5 +3
line (v*r,0)-(r*costp,r*sintp),j mod 5 +3
line (rp*cost,-rp*sint)-(rmax*cost,-rmax*sint),j mod 5 +3
line (v*r,0)-(r*costp,-r*sintp),j mod 5 +3
rr1=r
for thj=thetap to theta step dth
rr1=r+tt*(thj-thetap)/(theta-thetap)
rr2=rr1+tt*dth/(theta-thetap)
line (rr1*cos(thj),rr1*sin(thj))-(rr2*cos(thj+dth),rr2*sin(thj+dth)),j mod 5 +3
line (rr1*cos(thj),-rr1*sin(thj))-(rr2*cos(thj+dth),-rr2*sin(thj+dth)),j mod 5 +3
rr1=rr2
next
return


xplus:
tg=1
if v+dv<1 then v=v+dv
gaminv=sqr(1-v*v)
rmax=300/gaminv
return

xminus:
tg=1
if v-dv>0 then v=v-dv
gaminv=sqr(1-v*v)
rmax=300/gaminv
return

theend:
cls
chain "lbas18.exe"
end
end
return

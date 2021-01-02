$compile chain
on key(10) gosub theend
key(10) on
cll=11
v=.4
dv=.05
pi=4*atn(1)
gaminv=sqr(1-v*v)
rmax=500/gaminv
n=16
scrwidth=210
dr=1.5
mm=600/dr/v
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
rp=0
tt=0

m=1
screen 9,,(m mod 2),((m-1) mod 2)
cls

r=-scrwidth/v+scrwidth/3
for j=1 to (n-1)/2
theta=2*pi*j/n
if r<0 then
line (v*r-scrwidth/3,0)-(rmax-scrwidth/3,0),3
if frac(n/2)=0 then line (v*r-scrwidth/3,0)-(-rmax-scrwidth/3,0),n/2 mod 5 +3
else
line (-scrwidth/3,0)-(rmax-scrwidth/3,0),3
if frac(n/2)=0 then line (-scrwidth/3,0)-(-rmax-scrwidth/3,0),n/2 mod 5 +3
end if
gosub drawit
next
for m=2 to mm
r=r+dr
delay .1
screen 9,,(m mod 2),((m-1) mod 2)
cls
for j=1 to (n-1)/2
theta=2*pi*j/n
if r<0 then
line (v*r-scrwidth/3,0)-(rmax-scrwidth/3,0),3
if frac(n/2)=0 then line (v*r-scrwidth/3,0)-(-rmax-scrwidth/3,0),n/2 mod 5 +3
else
line (-scrwidth/3,0)-(rmax-scrwidth/3,0),3
if frac(n/2)=0 then line (-scrwidth/3,0)-(-rmax-scrwidth/3,0),n/2 mod 5 +3
end if
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
if r<0 then
line (v*r-scrwidth/3,0)-(rmax*cost*gaminv+v*r-scrwidth/3,rmax*sint),j mod 5 + 3
line (v*r-scrwidth/3,0)-(rmax*cost*gaminv+v*r-scrwidth/3,-rmax*sint),j mod 5 + 3
else
tt=5
rp=r+tt
line (0-scrwidth/3,0)-(r*cost-scrwidth/3,r*sint),j mod 5 + 3
line (rp*costp-scrwidth/3,rp*sintp)-(rmax*cost*gaminv+v*r-scrwidth/3,rmax*sint),j mod 5 + 3
line (0-scrwidth/3,0)-(r*cost-scrwidth/3,-r*sint),j mod 5 + 3
line (rp*costp-scrwidth/3,-rp*sintp)-(rmax*cost*gaminv+v*r-scrwidth/3,-rmax*sint),j mod 5 + 3
if theta-thetap>dth then
for thj=thetap to theta step dth
rr1=rp-tt*(thj-thetap)/(theta-thetap)
rr2=rr1-tt*dth/(theta-thetap)
line (rr1*cos(thj)-scrwidth/3,rr1*sin(thj))-(rr2*cos(thj+dth)-scrwidth/3,rr2*sin(thj+dth)),j mod 5 +3
line (rr1*cos(thj)-scrwidth/3,-rr1*sin(thj))-(rr2*cos(thj+dth)-scrwidth/3,-rr2*sin(thj+dth)),j mod 5 +3
next
end if

end if
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
return


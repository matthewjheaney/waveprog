$compile chain
nxb%=3
nyb%=3
scrwidth=270
pi=atn(1)*4
a=.35
hs=150
h=140
r=250
dt=.005*(r-h)^(1/2)
hb=70
th1=.3
th2=.27
th3=pi/2
th=0
y=100
mask=1
for j=1 to 7
mask=mask+4^j
next

screen 9,,1,1
window (-scrwidth,-200)-(scrwidth,200)

screen 9,,0,0
window (-scrwidth,-200)-(scrwidth,200)

key(10) on
on key(10) gosub theend
key(1) on
on key(1) gosub hup
key(2) on
on key(2) gosub hdown

thestartzzz:
t=0
m=1
theloopzzz:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloopzzz

drawit:
REM do the drawing
th=a*sin(t+dt)
line (-50,-r+h+y)-(50,-r+h+y),2,,mask
line (hs*sin(th1+th)-r*th,-hs*cos(th1+th)+y)-(hs*sin(-th1+th)-r*th,-hs*cos(-th1+th)+y),15
line (hs*sin(th1+th)-r*th,-hs*cos(th1+th)+y)-(hb*sin(th3+th)-r*th,-hb*cos(th3+th)+y),15
line (hs*sin(th1+th)-r*th,-hs*cos(th1+th)+y)-(r*sin(th2+th)-r*th,-r*cos(th2+th)+y),15
line (hs*sin(-th1+th)-r*th,-hs*cos(-th1+th)+y)-(r*sin(-th2+th)-r*th,-r*cos(-th2+th)+y),15
line ((r-h)*sin(th)-r*th,-(r-h)*cos(th)+y)-(hs*cos(th1)*sin(th)-r*th,-hs*cos(th1)*cos(th)+y),3
pset (r*sin(th1+th)-r*th,-r*cos(th1+th)+y)
for jj=1 to 10
line -(r*sin(th1-th1*jj/5+th)-r*th,-r*cos(th1-th1*jj/5+th)+y),15
next
circle ((r-h)*sin(th)-r*th,-(r-h)*cos(th)+y),3

t=t+dt
return

hup:
h=h*1.1
dt=.005*(r-h)^(1/2)
return

hdown:
h=h/1.1
dt=.005*(r-h)^(1/2)
return

theend:
cls
chain "lbas2.exe"
end

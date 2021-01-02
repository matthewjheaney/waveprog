asp=1
asp=5/4
scrwidth=200*asp
pi=atn(1)*4
dt=.05
clp=14
cllp=9
cllm=14
clb=2
do2=200
'do2=100
'do2=30
lam=.4*do2
dx=1
def fnr1(x)=((x+do2)^2+62500)^(1/2)
def fnr2(x)=((x-do2)^2+62500)^(1/2)
k=2*pi/lam

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

thestart:
t=0
m=1
theloop:
screen 9,,(m mod 2),((m-1) mod 2)
cls
delay .15
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop

theend:
end

drawit:
REM do the drawing
for j=0 to 440/lam
circle (-do2,-125),lam*(j+frac(t)),cllp,0,pi,asp*3/4
circle (do2,-125),lam*(j+frac(t)),cllp,0,pi,asp*3/4
circle (-do2,-125),lam*(j+frac(t+.5)),cllm,0,pi,asp*3/4
circle (do2,-125),lam*(j+frac(t+.5)),cllm,0,pi,asp*3/4
next
line (-scrwidth,125)-(scrwidth,125),clb
paint (0,140),clb
for x=-scrwidth to scrwidth-dx step dx
line (x,125+10*(1+cos((fnr1(x)-fnr2(x))*k)))-(x+dx,125+10*(1+cos((fnr1(x+dx)-fnr2(x+dx))*k))),clp
next
t=t+dt
return


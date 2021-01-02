$compile chain
nxb%=3
nyb%=3
cmc=0
scrwidth=150
pi=atn(1)*4
dt=.1
a=1.5
b1=10
b2=10
screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

key(1) on
on key(1) gosub ccmc

key(2) on
on key(2) gosub bcmc

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

theend:
cls
chain "lbas6.exe"
end

drawit:
REM do the drawing
x1=b1*t+b2*sin(t)-scrwidth
x2=b1*t-b2*sin(t)-scrwidth+50
x3=b1*t-scrwidth+25
circle (x1,0),10,11
circle (x2,0),10,11
circle (x3,80),2,cmc
d=(x2-x1-20)/10
line (x1+10,0)-(x1+10+d,10),15
line (x1+10+d,10)-(x1+10+3*d,-10),15
line (x1+10+5*d,10)-(x1+10+3*d,-10),15
line (x1+10+5*d,10)-(x1+10+7*d,-10),15
line (x1+10+9*d,10)-(x1+10+7*d,-10),15
line (x1+10+9*d,10)-(x2-10,0),15
t=t+dt
if b1*t>scrwidth*2.2 then t=-3

delay .05

return

ccmc:
cmc=13
return

bcmc:
cmc=0
return


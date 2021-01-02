nxb%=3
nyb%=3
scrwidth=250
pi=atn(1)*4
modex%=1
modey%=1
ell=100
c=.2
h=30
dt=.03
nn=20
kw=10
k=kw/2.2/scrwidth
depth=40
depth=200
htn=(exp(k*depth)-exp(-k*depth))/(exp(k*depth)+exp(-k*depth))

screen 9,,1,1
window (-scrwidth,-50)-(scrwidth,250)

screen 9,,0,0
window (-scrwidth,-50)-(scrwidth,250)

key(10) on
on key(10) gosub theend

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
end

drawit:
REM do the drawing
line (-scrwidth,0)-(scrwidth,-0)
line (0,0)-(0,-10)
pset (-1.1*scrwidth-h*sin(-t),htn*h*cos(-t)+depth)
for jj=1 to nn
x=1.1*scrwidth*(-1+2*jj/nn)
xx=jj/nn*kw
line -(x-h*sin(xx-t),htn*h*cos(xx-t)+depth),3
next
'paint (0,-h),3
xx=kw/2
circle (-h*sin(xx-t),htn*h*cos(xx-t)+3+depth),3,,,,1
circle (-h*sin(xx-t),htn*h*cos(xx-t)-5+depth),6,,,,1.3
line (-h*sin(xx-t)-3,htn*h*cos(xx-t)-2+depth)-(-h*sin(xx-t)-7,htn*h*cos(xx-t)+2+depth)
line (-h*sin(xx-t)+3,htn*h*cos(xx-t)-2+depth)-(-h*sin(xx-t)+7,htn*h*cos(xx-t)+2+depth)
line (-h*sin(xx-t)+2,htn*h*cos(xx-t)-11+depth)-(-h*sin(xx-t)+4,htn*h*cos(xx-t)-16+depth)
line (-h*sin(xx-t)-2,htn*h*cos(xx-t)-11+depth)-(-h*sin(xx-t)-4,htn*h*cos(xx-t)-16+depth)
t=t+dt
return



$compile chain
' F1 toggles water
' F2 toggles swimmer
' h controls the wave amplitude - goes nonlinear at about 40
h=20
asp=5/4
asp=1
scrwidth=200*asp
pi=4*atn(1)

sub vector(xv,yv,xvv,yvv,va,cl)
local vl
vl=((xvv-xv)^2+(yvv-yv)^2)^(1/2)
line (xv,yv)-(xvv,yvv),cl
line (xvv,yvv)-(xvv-va/vl*(xvv-xv)+va/vl/2*(yvv-yv),yvv-va/vl*(yvv-yv)-va/vl/2*(xvv-xv)),cl
line (xvv,yvv)-(xvv-va/vl*(xvv-xv)-va/vl/2*(yvv-yv),yvv-va/vl*(yvv-yv)+va/vl/2*(xvv-xv)),cl
end sub

tgl=0
on key(1) gosub toggle
key(1) on

mtgl=0
on key(2) gosub mtoggle
key(2) on


nxb%=3
nyb%=3
modex%=1
modey%=1
ell=100
c=.2
dt=.1
nn=20
kw=10
k=kw/2.2/scrwidth
'depth=40
depth=120
htn=(exp(k*depth)-exp(-k*depth))/(exp(k*depth)+exp(-k*depth))

def fntanh(x)=(exp(x)-exp(-x))/(exp(x)+exp(-x))

def fnsinh(x)=(exp(x)-exp(-x))/2

def fncosh(x)=(exp(x)+exp(-x))/2


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
delay .1
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloopzzz

drawit:
REM do the drawing
line (-scrwidth,0)-(scrwidth,-0)
'line (0,0)-(0,-10)
pset (-1.1*scrwidth-h*sin(-t),htn*h*cos(-t)+depth)
for jj=-1 to nn+2
x=1.1*scrwidth*(-1+2*jj/nn)
xx=jj/nn*kw
line -(x-h*sin(xx-t),htn*h*cos(xx-t)+depth),3
next

call vector(0,0,30,0,10,13)
call vector(0,0,0,30,10,13)
locate 20,47
print "x";
locate 19,38
print "y";



hh=h/fncosh(depth*k)
for y=-50 to depth-50 step 20
cky=fncosh(k*(y+50))
sky=fnsinh(k*(y+50))
for x=-.1*scrwidth to 2.3*scrwidth step 20
if tgl=1 then circle (x-hh*sin(k*x-t)*cky-1.1*scrwidth,y+50+hh*cos(k*x-t)*sky),1.5,14,0,2*pi,3/4*asp
next
next

xx=kw/2
if mtgl=1 then
circle (-h*sin(xx-t),htn*h*cos(xx-t)+3+depth),3,,,,1
circle (-h*sin(xx-t),htn*h*cos(xx-t)-5+depth),6,,,,1.3
line (-h*sin(xx-t)-3,htn*h*cos(xx-t)-2+depth)-(-h*sin(xx-t)-7,htn*h*cos(xx-t)+2+depth)
line (-h*sin(xx-t)+3,htn*h*cos(xx-t)-2+depth)-(-h*sin(xx-t)+7,htn*h*cos(xx-t)+2+depth)
line (-h*sin(xx-t)+2,htn*h*cos(xx-t)-11+depth)-(-h*sin(xx-t)+4,htn*h*cos(xx-t)-16+depth)
line (-h*sin(xx-t)-2,htn*h*cos(xx-t)-11+depth)-(-h*sin(xx-t)-4,htn*h*cos(xx-t)-16+depth)
end if
t=t+dt
return

toggle:
tgl=1-tgl
return

mtoggle:
mtgl=1-mtgl
return

theend:
'end
cls
chain "lbas0.exe"
end

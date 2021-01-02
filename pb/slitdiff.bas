scrwidth=220
pi=atn(1)*4
dt=.1
cllp=13
cllm=14

d=15

def fndiffangle(d)
   if d<=10 then dangl=pi/2 else dangl=atn(10/d/sqr(1-100/d^2))
   fndiffangle=dangl
end def

dang=fndiffangle(d)

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
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop

theend:
end

drawit:
REM do the drawing
line (0,150)-(0,d)
line (0,-150)-(0,-d)
delay .05
for j=-scrwidth-60 to 0 step 20
line (j+20*(frac(t)-1),150)-(j+20*(frac(t)-1),-150),cllp
rh=-j+20*frac(t)
dd=max(0,d*(1+dang*j/scrwidth))
line (rh+1,dd)-(rh+1,-dd),cllp
circle (0,dd),rh,cllp,0,dang
circle (0,-dd),rh,cllp,2*pi-dang,2*pi
next
t=t+dt
delay .054
return



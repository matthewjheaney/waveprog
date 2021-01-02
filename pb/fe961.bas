$compile chain
common chtime
on timer(chtime) gosub thechain
timer on
on key(9) gosub thechain
key(9) on
scrwidth=400
pi=atn(1)*4
dt=.1
cllp=13
cllm=14
ell=200
dd=20
nx=2
ny=1
om=sqr(nx^2+ny^2)
a=17/sqr(nx^2+ny^2+.1)

screen 9,,1,1
window (-scrwidth/4+20,-50)-(3/4*scrwidth+20,250)

screen 9,,0,0
window (-scrwidth/4+20,-50)-(3/4*scrwidth+20,250)

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
locate 4,9
print "y=a"
locate 22,9
print "y=0"
locate 23,15
print "x=0"
locate 23,57
print "x=a"

'print
'print "   n  =";nx;"  n  =";ny
'print "    x        y"
locate 1,73
print "PROB 1"
line (-3,-3)-(-3,ell+3),cllp
line (ell+3,-3)-(ell+3,ell+3),cllp
line (-3,ell+3)-(ell+3,ell+3),cllp
line (-3,-3)-(ell+3,-3),cllp
for x=0 to ell step dd
for y=0 to ell step dd
circle (x+a*nx*sin(nx*pi*x/ell)*cos(ny*pi*y/ell)*sin(om*t),y+a*ny*sin(ny*pi*y/ell)*cos(nx*pi*x/ell)*sin(om*t)),1,cllm
next
next
delay .054
t=t+dt
return

thechain:
clear
screen 9,,1,1
cls
screen 9,,0,0
cls
chain "fe962"
return

end
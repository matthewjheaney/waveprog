nxb%=3
nyb%=3
scrwidth=75
pi=atn(1)*4
dt=.03
pi=4*atn(1)
cl=11
nodes=5
nn=42
eps=20/nodes
'eps=2
kl=pi*nodes/2
o=nodes

screen 9,,1,1
window (50-scrwidth,-75)-(50+scrwidth,75)

screen 9,,0,0
window (50-scrwidth,-150)-(50+scrwidth,150)

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
for n=1 to nn/2
line (3+80*2*n/nn+eps*sin(kl*2*n/nn-o*m/nn),55)-(3+80*(2*n-1)/nn+eps*sin(kl*(2*n-1)/nn-o*m/nn),35),cl
next
for n=0 to nn/2-1
line (3+80*2*n/nn+eps*sin(kl*2*n/nn-o*m/nn),55)-(3+80*(2*n+1)/nn+eps*sin(kl*(2*n+1)/nn-o*m/nn),35),cl
next

t=t+dt
return

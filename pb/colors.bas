nxb%=3
nyb%=3
scrwidth=150
pi=atn(1)*4
dt=.03
a=1.5

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

for j=1 to 32
line (-100,-100+5*j)-(100,-100+5*j),j
next

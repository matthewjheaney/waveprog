pi=4*atn(1)
cl=11
nodes=1
nn=42
eps=20/nodes
kl=pi*nodes
o=2*nodes

screen 9,,1,1
window (0,0)-(100,100)

screen 9,,0,0
window (0,0)-(100,100)

key(10) on
key(1) on
key(2) on
key(3) on
key(4) on
key(5) on
key(6) on
key(7) on
key(8) on
key(9) on
m=1
theloop:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
on key(10) gosub theend
on key(1) gosub 1
on key(2) gosub 2
on key(3) gosub 3
on key(4) gosub 4
on key(5) gosub 5
on key(6) gosub 6
on key(7) gosub 7
on key(8) gosub 8
on key(9) gosub 9
goto theloop

theend:
end
return

drawit:
for n=0 to nn
line (10+80*n/nn+eps*sin(kl*n/nn)*cos(o*m/nn),55)-(10+80*n/nn+eps*sin(kl*n/nn)*cos(o*m/nn),45),cl
next
return

1 nodes=1
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
2 nodes=2
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
3 nodes=3
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
4 nodes=4
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
5 nodes=5
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
6 nodes=6
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
7 nodes=7
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
8 nodes=8
eps=20/nodes
kl=pi*nodes
o=2*nodes
return
9 nodes=9
eps=20/nodes
kl=pi*nodes
o=2*nodes
return


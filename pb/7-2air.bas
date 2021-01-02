$compile chain
pi=4*atn(1)
cl=11
nodes=.5
nn=42
eps=20/(nodes+1)
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
theloop72:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit72
m=m+1
on key(10) gosub theend72
on key(1) gosub s172
on key(2) gosub s272
on key(3) gosub s372
on key(4) gosub s472
on key(5) gosub s572
on key(6) gosub s672
on key(7) gosub s772
on key(8) gosub s872
on key(9) gosub s972
goto theloop72

theend72:
cls
chain "lbas9.exe"
end
end
return

drawit72:
for n=0 to nn/2 step .5
line (3+80*2*n/nn+eps*sin(kl*2*n/nn)*cos(o*m/nn),55)-(3+80*(2*n)/nn+eps*sin(kl*(2*n)/nn)*cos(o*m/nn),45),cl
next
line (2.5,55.5)-(2.5,44.5)
line (2.5,55.5)-(83.5,55.5)
line (2.5,44.5)-(83.5,44.5)
'for n=0 to nn/2-1
'line (3+80*2*n/nn+eps*sin(kl*2*n/nn)*cos(o*m/nn),55)-(3+80*(2*n+1)/nn+eps*sin(kl*(2*n+1)/nn)*cos(o*m/nn),45),cl
'next
delay .05
return

s172:
 nodes=.5
eps=20/(nodes+1)
kl=pi*nodes
o=2*nodes
return
s272:
 nodes=1.5
eps=10/nodes
kl=pi*nodes
o=2*nodes
return
s372:
 nodes=2.5
eps=10/nodes
kl=pi*nodes
o=2*nodes
return
s472:
 nodes=3.5
eps=10/nodes
kl=pi*nodes
o=2*nodes
return
s572:
 nodes=4.5
eps=10/nodes
kl=pi*nodes
o=2*nodes
return
s672:
 nodes=5.5
eps=10/nodes
kl=pi*nodes
o=2*nodes
return
s772:
 nodes=6.5
eps=10/nodes
kl=pi*nodes
o=2*nodes
return
s872:
 nodes=7.5
eps=10/nodes
kl=pi*nodes
o=2*nodes
return
s972:
 nodes=8.5
eps=10/nodes
kl=pi*nodes
o=2*nodes
return


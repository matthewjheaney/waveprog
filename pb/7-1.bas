$compile chain
pi=4*atn(1)
cl=11
nodes=1
nn=42
amp=10
eps=amp/nodes
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
theloop71:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit71
m=m+1
on key(10) gosub theend71
on key(1) gosub s171
on key(2) gosub s271
on key(3) gosub s371
on key(4) gosub s471
on key(5) gosub s571
on key(6) gosub s671
on key(7) gosub s771
on key(8) gosub s871
on key(9) gosub s971
goto theloop71

theend71:
cls
chain "lbas9.exe"
end
return

drawit71:
for n=1 to nn/2
line (3+80*2*n/nn+eps*sin(kl*2*n/nn)*cos(o*m/nn),55)-(3+80*(2*n-1)/nn+eps*sin(kl*(2*n-1)/nn)*cos(o*m/nn),45),cl
next
for n=0 to nn/2-1
line (3+80*2*n/nn+eps*sin(kl*2*n/nn)*cos(o*m/nn),55)-(3+80*(2*n+1)/nn+eps*sin(kl*(2*n+1)/nn)*cos(o*m/nn),45),cl
next
delay .05
return

s171:
 nodes=1
eps=amp/nodes
kl=pi*nodes
o=2*nodes
return
s271:
 nodes=2
eps=amp/nodes
kl=pi*nodes
o=2*nodes
return
s371:
 nodes=3
eps=amp/nodes
kl=pi*nodes
o=2*nodes
return
s471:
 nodes=4
eps=amp/nodes
kl=pi*nodes
o=2*nodes
return
s571:
 nodes=5
eps=amp/nodes
kl=pi*nodes
o=2*nodes
return
s671:
 nodes=6
eps=amp/nodes
kl=pi*nodes
o=2*nodes
return
s771:
 nodes=7
eps=amp/nodes
kl=pi*nodes
o=2*nodes
return
s871:
 nodes=8
eps=amp/nodes
kl=pi*nodes
o=2*nodes
return
s971:
 nodes=9
eps=amp/nodes
kl=pi*nodes
o=2*nodes
return


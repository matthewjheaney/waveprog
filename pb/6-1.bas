$compile chain
pi=4*atn(1)
k=1
a0=25
a=a0
nn=24
mm0=12
mm=mm0

screen 9,,1,1
window (0,0)-(200,200)

screen 9,,0,0
window (0,0)-(200,200)

m=1
key(10) on
key(11) on
key(14) on

theloop61:
on key(10) gosub theend61
on key(11) gosub increase61
on key(14) gosub decrease61
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit61
m=m+1
goto theloop61

theend61:
cls
chain "lbas7.exe"
end
return

drawit61:
for n=0 to nn-1
line (10+160*n/nn,80+a*sin(k*n*pi/nn)*sin(m/mm))-(10+160*(n+1)/nn,80+a*sin(k*(n+1)*pi/nn)*sin(m/mm)),11
next
delay .05
return

increase61:
k=k+1
mm=mm0/k
a=a0/k
return

decrease61:
if k>1 then k=k-1 else return
mm=mm0/k
a=a0/k
return

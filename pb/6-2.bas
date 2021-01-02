pi=4*atn(1)
k=.5
a0=35
a=a0/k^.7
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

theloop62:
on key(10) gosub theend62
on key(11) gosub increase62
on key(14) gosub decrease62
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit62
m=m+1
goto theloop62
theend62:
end
return

drawit62:
line (170,20)-(170,140),13
circle (170,80+a*sin(k*pi)*sin(m/mm)),1,11
for n=0 to nn-1
line (10+160*n/nn,80+a*sin(k*n*pi/nn)*sin(m/mm))-(10+160*(n+1)/nn,80+a*sin(k*(n+1)*pi/nn)*sin(m/mm)),11
next
delay .05
return

increase62:
k=k+1
mm=round(mm0/k,0)
a=a0/k^.7
return

decrease62:
if k>1 then k=k-1 else return
mm=round(mm0/k,0)
a=a0/k^.7
return

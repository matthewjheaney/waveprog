$compile chain
' up and down arrow change wide
' left and right arrows change separation
scrwidth=250
pi=atn(1)*4
screen 9
window (-125,-150)-(2*scrwidth-125,150)
x0=scrwidth-15
'sr is the half the separation
sr=20
' 20 doesn't work with scrwidth=200
'sr=20
'ar is half the width
ar=1
'ar=1.25
yy=30
k=1/8
dx=5
dy=3

randomize timer

def fns(x)
  if x=0 then fns=1 else fns=(sin(x)/x)
end def

def fnc(x,jr)
  if x=0 then fnc=1 else fnc=sin(x*jr)/sin(x)/jr
end def

def fnd(x,y,jr)=fns(k*x*ar)*fnc(k*x*sr,jr)*fns(k*y*yy/2)

on key(10) gosub theend
key(10) on

key(11) on
on key(11) gosub yplus

key(14) on
on key(14) gosub yminus

key(13) on
on key(13) gosub xplus

key(12) on
on key(12) gosub xminus

cll=11
clll=12
clll=11

jr=1
thestart:
jc=0
cls

for jrr=1 to 6
line (100,15+(jrr-3.5)*50)-(100,-15+(jrr-3.5)*50)
line (-100,-15+(jrr-3.5)*50)-(100,-15+(jrr-3.5)*50)
line (-100,-15+(jrr-3.5)*50)-(-100,15+(jrr-3.5)*50)
line (-100,15+(jrr-3.5)*50)-(100,15+(jrr-3.5)*50)
for xr=1 to jrr
line (x0-ar-(xr-jrr/2)*sr*2,(jrr-3.5)*50-yy/2)-(x0-ar-(xr-jrr/2)*sr*2,(jrr-3.5)*50+yy/2),clll
line (x0+ar-(xr-jrr/2)*sr*2,(jrr-3.5)*50-yy/2)-(x0+ar-(xr-jrr/2)*sr*2,(jrr-3.5)*50+yy/2),clll
line (x0-ar-(xr-jrr/2)*sr*2,(jrr-3.5)*50-yy/2)-(x0+ar-(xr-jrr/2)*sr*2,(jrr-3.5)*50-yy/2),clll
line (x0-ar-(xr-jrr/2)*sr*2,(jrr-3.5)*50+yy/2)-(x0+ar-(xr-jrr/2)*sr*2,(jrr-3.5)*50+yy/2),clll
next
next

m=0

theloop:
if jc=1 then goto thestart
for jrr=1 to 6
for kk=1 to jrr
x=-100+200*rnd
y=-15+30*rnd
if fnd(x/12,y/12,jrr)^2>rnd then
' circle (x,y),.05
pset (x,y+(jrr-3.5)*50)
 m=m+1
end if
next
next
if m>30000 then goto thepause
goto theloop

thepause:
goto thepause

xplus:
if sr<=15 then sr=sr+dx
jc=1
return

yplus:
if ar+dy<2*sr/3 then ar=ar+dy
jc=1
return

xminus:
if 2*(sr-dx)/3>ar then sr=sr-dx
jc=1
return

yminus:
if ar>dy then ar=ar-dy
jc=1
return


theend:
cls
chain "lbas22.exe"
end

end

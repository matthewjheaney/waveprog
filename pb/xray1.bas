$compile chain
scrwidth=205
pi=atn(1)*4
dim lclr(8)

on key(10) gosub theend
key(10) on

t1=0
t2=0
t3=0
t4=0
t5=0

on key(1) gosub tog1
key(1) on

on key(2) gosub tog2
key(2) on

on key(3) gosub tog3
key(3) on

on key(4) gosub tog4
key(4) on

on key(5) gosub tog5
key(5) on

key(13) on
on key(13) gosub xplus

key(12) on
on key(12) gosub xminus

lclr(0)=5
lclr(1)=4
lclr(2)=12
lclr(3)=14
lclr(4)=10
lclr(5)=2
lclr(6)=9
lclr(7)=1

dth=.05
th=.525

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

thestart:
m=1
theloop:
t0=0
gosub drawit
screen 9,,(m mod 2),((m-1) mod 2)
cls
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
theloop2:
if t0=1 then goto theloop
goto theloop2

drawit:
cls
cth=cos(th)
sth=sin(th)
ke=300*sth/cth*25/scrwidth
if t3=1 then
for j=0 to 50
for k=-20 to 70
circle (scrwidth*(j-25)/25,scrwidth/25/sth*(k-25-(j-25)*cth)),2.1,lclr((j-k+200) mod 8)
paint (scrwidth*(j-25)/25,scrwidth/25/sth*(k-25-(j-25)*cth)),lclr((j-k+200) mod 8)
next
next
end if
if t1=1 then
for j=0 to 50
line (scrwidth*(j-25)/25,-150)-(scrwidth*(j-25)/25,150),lclr(j mod 8)
next
end if
if t2=1 then
for j=-20 to 70
line (scrwidth*(j-25)/25/cth+150*sth/cth,-150)-(scrwidth*(j-25)/25/cth-150*sth/cth,150),lclr((j+200) mod 8)
next
end if
if t3=1 then
for j=0 to 50
for k=-20 to 70
circle (scrwidth*(j-25)/25,scrwidth/25/sth*(k-25-(j-25)*cth)),2.1,lclr((j-k+200) mod 8)
paint (scrwidth*(j-25)/25,scrwidth/25/sth*(k-25-(j-25)*cth)),lclr((j-k+200) mod 8)
call vector(0,0,100*(1-cos(th)),-100*sin(th),8,15)
next
next
end if
if t4=1 then call vector(0,0,100,0,8,15)
if t5=1 then call vector(0,0,100*cos(th),100*sin(th),8,15)
return

sub vector(xv,yv,xvv,yvv,va,cl)
local vl
vl=((xvv-xv)^2+(yvv-yv)^2)^(1/2)
line (xv,yv)-(xvv,yvv),cl
line (xvv,yvv)-(xvv-va/vl*(xvv-xv)+va/vl/2*(yvv-yv),yvv-va/vl*(yvv-yv)-va/vl/2*(xvv-xv)),cl
line (xvv,yvv)-(xvv-va/vl*(xvv-xv)-va/vl/2*(yvv-yv),yvv-va/vl*(yvv-yv)+va/vl/2*(xvv-xv)),cl
end sub

tog1:
t0=1
t1=1-t1
return

tog2:
t0=1
t2=1-t2
return

tog3:
t0=1
t3=1-t3
return

tog4:
t0=1
t4=1-t4
return

tog5:
t0=1
t5=1-t5
return

theend:
cls
chain "lbas25.exe"
end
end
return

xplus:
t0=1
th=th+dth
return

xminus:
t0=1
th=th-dth
return

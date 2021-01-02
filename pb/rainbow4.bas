$compile chain
pi=4*atn(1)
scrwidth=140
nn=1.35
r=75
cl=3
btog=0
ctog=0
dtog=0
etog=0
x0=0
y0=0
screen 12
window (-scrwidth,-100)-(scrwidth,100)

on key(1) gosub togglec
key(1) on

on key(2) gosub toggled
key(2) on

on key(3) gosub togglee
key(3) on

on key(10) gosub theend
key(10) on

'key(11) on
'on key(11) gosub yplus

'key(14) on
'on key(14) gosub yminus

key(13) on
on key(13) gosub xplus

key(12) on
on key(12) gosub xminus


theloop:
btog=0

for n=0 to 101
line (x0+r*cos(pi*n/50),y0+r*sin(pi*n/50))-(x0+r*cos(pi*(n+1)/50),y0+r*sin(pi*(n+1)/50))
next

for h2=0 to 1 step .019999
if ctog=0 and btog=0 then call rline((r*h2),1.332,4)
if ctog=1 and btog=0 then call rline((r*h2),1.35,17)
if etog=1 then
	call rline((r*h2),1.332,4)
	call rline((r*h2),1.35,17)
end if
rem I've exaggerated the blue - should be 1.343
next

if btog=1 then cls

if dtog=1 then
call rrline(r,1.332,15)
call rrline(r,1.350,15)
end if

goto theloop

end

sub rline(h,nn,cl) shared
if h<r then th=atn(h/sqr(r^2-h^2)) else th=pi/2
sth=h/r
thp=atn(sth/nn/sqr(1-sth^2/nn^2))
line (-scrwidth,y0+h)-(x0-sqr(r^2-h^2),y0+h),cl
xi1=pi+th-2*thp
line (x0-r*cos(xi1),y0+r*sin(xi1))-(x0-sqr(r^2-h^2),y0+h),cl
xi2=th+xi1
line (x0-r*cos(xi1),y0+r*sin(xi1))-(x0-r*cos(xi1)-350*cos(xi2),y0+r*sin(xi1)+350*sin(xi2)),cl
end sub

sub rrline(h,nn,cl) shared
sthp= 1/3/nn*3^(1/2)*(4-nn^2)^(1/2)
thp=atn(sthp/sqr(1-sthp^2))
sth=nn*sthp
th=atn(sth/sqr(1-sth^2))
xi3=2*th-4*thp
sthp1= 1/15/nn*15^(1/2)*(16-nn^2)^(1/2)
thp1=atn(sthp1/sqr(1-sthp1^2))
sth1=nn*sthp1
th1=atn(sth1/sqr(1-sth1^2))
xi2=th1-4*thp1
line (x0-r*cos(xi2)-30*cos(xi3),y0+r*sin(xi2)+30*sin(xi3))-(x0-r*cos(xi2)-350*cos(xi3),y0+r*sin(xi2)+350*sin(xi3)),cl
'print cos(th),cos(thp)*nn/2
end sub

togglec:
ctog=1-ctog
btog=1
cls
return

toggled:
dtog=1-dtog
btog=1
cls
return

togglee:
etog=1-etog
btog=1
cls
return


xplus:
r=r*1.5
if r<50 then
 x0=-2.5*(50-r)
 y0=0
else
 x0=0
 y0=0
end if
btog=1
cls
return

yplus:
return

xminus:
r=r/1.5
if r<50 then
 x0=-2.5*(50-r)
 y0=0
else
 x0=0
 y0=0
end if
btog=1
cls
return

yminus:
y0=y0-dy
return

theend:
cls
chain "lbas24.exe"
end
end
return

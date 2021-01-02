f=50
if f>0 then cll=11 else cll=12
asp=5/4
asp=1
scrwidth=210*asp

clb=14
nxb%=3
nyb%=3
pi=atn(1)*4
dt=.03
dim a(5,5)
x0=-scrwidth
y0=0
xl=0
yl=30
xs=scrwidth
dx=5
dy=5



def fnys(xs,f,x0,y0,xl,yl)=((yl-y0)/(xl-x0)-yl/f)*(xs-xl)+yl

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

key(1) on
on key(1) gosub toggle
tgl=0

key(11) on
on key(11) gosub yplus

key(14) on
on key(14) gosub yminus

key(13) on
on key(13) gosub xplus

key(12) on
on key(12) gosub xminus

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
ys=fnys(xs,f,x0,y0,xl,yl)
line (xl,yl)-(xl,-yl),cll
circle (x0,y0),4,cll,,3/4*asp
v=fnys(xs,f,x0,y0,xl,-yl)-fnys(xs,f,x0,y0,xl,yl)+2*yl
if v<>0 then
 xv=2*yl*(xs-xl)/v
 yv=yl+xv*(fnys(xs,f,x0,y0,xl,yl)-yl)/(xs-xl)
 circle (xv,yv),4,clb-1,,3/4*asp
end if
call ray(xs,f,x0,y0,xl,yl,clb)
call ray(xs,f,x0,y0,xl,-yl,clb)
call ray(xs,f,x0,y0,xl,0,clb)
'call ray(xs,f,x0,0,xl,yl,clb+1)
'call ray(xs,f,x0,0,xl,-yl,clb+1)
'call ray(xs,f,x0,0,xl,0,clb+1)
if tgl=1 then
   for j=-150 to 140 step 10
   line (xv,j)-(xv,j+5)
   line (x0,j)-(x0,j+5)
   next
end if
delay .1
t=t+dt
return


sub ray(xs,f,x0,y0,xl,yl,clb)
if x0<=xl then line (x0,y0)-(xl,yl),clb
if x0>xl then line(-xs,yl-xs*(yl-y0)/(xl-x0))-(xl,yl),clb
line (xs,fnys(xs,f,x0,y0,xl,yl))-(xl,yl),clb+1
end sub

rem do a two lens routine

xplus:
x0=x0+dx
return

yplus:
y0=y0+dy
return

xminus:
x0=x0-dx
return

yminus:
y0=y0-dy
return

toggle:
tgl=1-tgl
return

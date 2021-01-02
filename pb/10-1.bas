REM generic animation program
cl=11
h=20
dt=.08
def fnf(t)
if t>=0 then fd=1-t
if t<0 then fd=1+t
if t>1 then fd=0
if t<-1 then fd=0
fnf=fd
end def

mmax=60

screen 9,,1,1
window (0,0)-(100,100)

screen 9,,0,0
window (0,0)-(100,100)

key(10) on
on key(10) gosub theend

thestart91:
t=-1
m=1
theloop91:
screen 9,,(m mod 2),((m-1) mod 2)
cls
if t>8 then goto thestart91:
gosub drawit
delay .05
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop91

theend:
end

drawit:
REM do the drawing
xc=5+15*t
xc1=5+15*(t-1)
xc2=5+15*(t+1)
if t<0 then
line (5,40+h*fnf(-t))-(xc2,40),cl
line -(95,40),cl
end if
if t>=0 and t<1 then
line (5,40+h*fnf(-t))-(xc,40+h),cl
line -(xc2,40),cl
line -(95,40),cl
end if
if t>=1 and t<5 then
line (5,40)-(xc1,40),cl
line -(xc,40+h),cl
line -(xc2,40),cl
line -(95,40),cl
end if
if t>=5 and t<6 then
line (5,40)-(xc1,40),cl
line -(xc,40+h),cl
line -(95,40+h*fnf(6-t)),cl
end if
if t>=6 and t<7 then
line (5,40)-(xc1,40),cl
line -(95,40+h*fnf(6-t)),cl
end if
if t>=7 and t<8 then
line (5,40)-(95,40),cl
end if
circle (5,40+h*fnf(-t)),1,13
paint (5,40+h*fnf(-t)),13
t=t+dt
return


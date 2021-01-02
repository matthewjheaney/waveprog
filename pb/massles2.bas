$compile exe
scrwidth=250
pi=atn(1)*4
dt=.03
cllp=13
cllm=14
dt=.15
dx=.5
o=1
k=pi/600
dk=pi/600
'dim a(5,5)
l=20
a=10

key(10) on
on key(10) gosub theend

key(14) on
on key(14) gosub kdown

key(11) on
on key(11) gosub kup

key(1) on
on key(1) gosub toggle

key(2) on
on key(2) gosub pause

def fncl(x)
      if (x<-l) or (x>l) then fncl=11 else fncl=13
end def

function psi(x,t)
      local rer,imr,retau,imtau,den
      shared k,l,o
      den=(1+k^2*l^2)
      rer=k^2*l^2/den
      imr=-k*l/den
      retau=1/den
'      imtau=k*l/den
      if x<=-l then
       psi=cos(k*x-o*t)+rer*cos(k*x+o*t+2*k*l)+imr*sin(k*x+o*t+2*k*l)
      end if
      if x>=l then
       psi=retau*cos(k*x-o*t-2*k*l)+imr*sin(k*x-o*t-2*k*l)
      end if
      if (x>-l) and (x<l) then psi=((l-x)*psi(-l,t)+(x+l)*psi(l,t))/2/l
end function

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

thestart:
t=0
m=1
theloop:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop

theend:
end

drawit:
REM do the drawing
if tg%=1 then line (-l,50)-(-l,-50)
if tg%=1 then line (l,50)-(l,-50)
for x=-scrwidth to scrwidth step dx
line (x,a*psi(x,t))-(x+dx,a*psi(x+dx,t)),fncl(x)
next
t=t+dt
return


kdown:
ch=0
if k>dk then k=k-dk
return

kup:
ch=0
k=k+dk
return


toggle:
if tg%=0 then sg%=1
if tg%=1 then sg%=0
tg%=sg%
return

pause:
i$=inkey$
if i$="" then goto pause
return

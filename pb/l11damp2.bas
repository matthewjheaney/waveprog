type complex
r as ext
i as ext
end type

dim z as complex
dim z1 as complex
dim z2 as complex
dim z3 as complex
dim z4 as complex
dim z5 as complex
dim z6 as complex
dim z7 as complex
dim z8 as complex
dim z9 as complex
dim z21mcka as complex

pi=4*atn(1)

sub cabs(z as complex,r)
 r=(z.r^2+z.i^2)^(1/2)
end sub

sub cadd(z1 as complex,z2 as complex,z3 as complex)
      z3.r=z1.r+z2.r
      z3.i=z1.i+z2.i
end sub

sub csub(z1 as complex,z2 as complex,z3 as complex)
      z3.r=z1.r-z2.r
      z3.i=z1.i-z2.i
end sub

sub cmul(z1 as complex,z2 as complex,z3 as complex)
      dim zl as complex
      zl.r=z1.r*z2.r-z1.i*z2.i
      zl.i=z1.r*z2.i+z1.i*z2.r
      z3=zl
end sub

sub cdiv(z1 as complex,z2 as complex,z3 as complex)
      dim zl as complex
      zl.r=(z1.r*z2.r+z1.i*z2.i)/(z2.r^2+z2.i^2)
      zl.i=(-z1.r*z2.i+z1.i*z2.r)/(z2.r^2+z2.i^2)
      z3=zl
end sub

sub crea(r,z as complex)
      z.r=r
      z.i=0
end sub

sub ccon(z1 as complex,z2 as complex)
      z2.r=z1.r
      z2.i=-z1.i
end sub

sub cdamping(n%,z1 as complex,z as complex)
      local j%
      dim z7 as complex
      dim z8 as complex
      dim z9 as complex
      shared pi
      z7.r=n%
      z7.i=0
      for j%=1 to n%-1
      z8.r=1-z1.r/(sin(j%*pi/2/n%))^2
      z8.i=-z1.i/(sin(j%*pi/2/n%))^2
      call cmul(z7,z8,z9)
      z7=z9
      next
      z=z7
end sub

dim ys(5),yc(5)
ys(0)=0
yc(0)=0
yc(5)=50
ys(5)=0


nxb%=3
nyb%=3
scrwidth=250
dt=.1
dim a(5,5)

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

key(14) on
on key(14) gosub odown

key(11) on
on key(11) gosub oup


thestartzzz:

mass=1
k=5
g=.5
deltao=.02
o=2

z21mcka.r=mass*o^2/k
z21mcka.i=mass*o*g/k
call cdamping(5,z21mcka,z5)
for jb%=1 to 4
call cdamping(jb%,z21mcka,z2)
call cdiv(z2,z5,z)
yc(jb%)=50*z.r
ys(jb%)=50*z.i
next

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
return

drawit:
REM do the drawing
locate 1,1
print o
line (-200,-20)-(-200,20),13
for jp=0 to 4
line (80*jp-200,yc(jp)*cos(o*t)+ys(jp)*sin(o*t))-(80*jp-120,yc(jp+1)*cos(o*t)+ys(jp+1)*sin(o*t)),14
next
for jp=1 to 4
circle (80*jp-200,yc(jp)*cos(o*t)+ys(jp)*sin(o*t)),3,11
next
t=t+dt
delay .05
return

oup:
o=int(100*(o+deltao))/100
t=t*(o-deltao)/o+dt
z21mcka.r=mass*o^2/k
z21mcka.i=mass*o*g/k
call cdamping(5,z21mcka,z5)
for jb%=1 to 4
call cdamping(jb%,z21mcka,z2)
call cdiv(z2,z5,z)
yc(jb%)=50*z.r
ys(jb%)=50*z.i
next
return

odown:
if o>deltao then o=int(100*(o-deltao))/100 else return
t=t*(o+deltao)/o+dt
z21mcka.r=mass*o^2/k
z21mcka.i=mass*o*g/k
call cdamping(5,z21mcka,z5)
for jb%=1 to 4
call cdamping(jb%,z21mcka,z2)
call cdiv(z2,z5,z)
yc(jb%)=50*z.r
ys(jb%)=50*z.i
next
return

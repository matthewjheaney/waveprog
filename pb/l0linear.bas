$compile chain
nxb%=3
nyb%=3
scrwidth=1
pi=atn(1)*4
dt=.2
a=.05
s=1

screen 9,,1,1
window (-scrwidth,-.5)-(scrwidth,.5)

screen 9,,0,0
window (-scrwidth,-.5)-(scrwidth,.5)

key(10) on
on key(10) gosub theend
key(1) on
on key(1) gosub scaledown
key(2) on
on key(2) gosub scalestop
key(3) on
on key(3) gosub scaleup

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

drawit:
REM do the drawing
'pset (min(-.5,-4*a*(1-(1/(1+1/2/a)^(1/2)))),fnas(-a))
pset (1/2,-a*(1-1/(1+1/8/a)^2))
for tt=1/2 to max(-.5,-4*a*(1-(1/(1+1/2/a)^(1/2)))) step -.001
line -(tt,-a*(1-1/(1+tt/4/a)^2))
next
line (.5,-.25)-(-.5,.25),3
for j=0 to .5/a
line (-.5,j*a)-(.5,j*a),4
line (j*a,-.5)-(j*a,.5),4
next
for j=0 to -.5/a step -1
line (-.5,j*a)-(.5,j*a),4
line (j*a,-.5)-(j*a,.5),4
next
if a>.25 then
for j=0 to 5/a
line (-.5,j*a/10)-(.5,j*a/10),5
line (j*a/10,-.5)-(j*a/10,.5),5
next
for j=0 to -5/a step -1
line (-.5,j*a/10)-(.5,j*a/10),5
line (j*a/10,-.5)-(j*a/10,.5),5
next
end if
if a>2.5 then
for j=0 to 50/a
line (-.5,j*a/100)-(.5,j*a/100),6
line (j*a/100,-.5)-(j*a/100,.5),6
next
for j=0 to -50/a step -1
line (-.5,j*a/100)-(.5,j*a/100),6
line (j*a/100,-.5)-(j*a/100,.5),6
next
end if
a=a*s
delay .2
return

scaleup:
s=1.02
return

scalestop:
s=1
return

scaledown:
s=.98
return


def fnas(a)
if a<1/3 then fnas=-.5 else fnas=a*(1-1/(1-1/8/a)^2)
end def

theend:
'end
cls
chain "lbas0.exe"
end

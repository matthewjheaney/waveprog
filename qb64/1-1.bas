REM generic animation program
dt=.05
pi=4*atn(1)
wx=67
wy=50

screen 9,,1,1
window (-wx,-wy)-(wx,wy)

screen 9,,0,0
window (-wx,-wy)-(wx,wy)

key(10) on
m=1
theloop11:
on key(10) gosub theend11
screen 9,,(m mod 2),((m-1) mod 2)
cls
REM do the drawing
rem for k=0 to 41:pset (25*cos(k*pi/21),25*sin(k*pi/21)):next
line (0,0)-(25*cos(dt*m),-25*sin(dt*m)),5
line (0,-25)-(25*cos(dt*m),-25),6
rem line (25*cos(dt*m),0)-(25*cos(dt*m),-25*sin(dt*m))
circle (25*cos(dt*m),0),2,2
line (-50,0)-(-34+8*cos(dt*m),2),2
line (-16+17*cos(dt*m),-2)-(-34+8*cos(dt*m),2),2
line (-16+17*cos(dt*m),-2)-(25*cos(dt*m),0),2
rem circle (25*cos(dt*m),25*sin(dt*m)),2,2
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop11
theend11:
end
return


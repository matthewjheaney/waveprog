REM generic animation program
dt = .05
pi = 4 * ATN(1)
wx = 67
wy = 50

screen 9,,1,1
WINDOW (-wx, -wy)-(wx, wy)

SCREEN 9, , 0, 0
WINDOW (-wx, -wy)-(wx, wy)

KEY(10) ON
m = 1
theloop11:
ON KEY(10) GOSUB theend11
SCREEN 9, , (m MOD 2), ((m - 1) MOD 2)
CLS
REM do the drawing
REM for k=0 to 41:pset (25*cos(k*pi/21),25*sin(k*pi/21)):next
LINE (0, 0)-(25 * COS(dt * m), -25 * SIN(dt * m)), 5
LINE (0, -25)-(25 * COS(dt * m), -25), 6
REM line (25*cos(dt*m),0)-(25*cos(dt*m),-25*sin(dt*m))
CIRCLE (25 * COS(dt * m), 0), 2, 2
LINE (-50, 0)-(-34 + 8 * COS(dt * m), 2), 2
LINE (-16 + 17 * COS(dt * m), -2)-(-34 + 8 * COS(dt * m), 2), 2
LINE (-16 + 17 * COS(dt * m), -2)-(25 * COS(dt * m), 0), 2
REM circle (25*cos(dt*m),25*sin(dt*m)),2,2
m = m + 1
REM if you want discrete repeats
REM if m>mmax then m=1
GOTO theloop11
theend11:
END
RETURN


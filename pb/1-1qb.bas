dt = .05
pi = 4 * ATN(1)
wx = 67
wy = 50

SCREEN 9, , 1, 1
WINDOW (-wx, -wy)-(wx, wy)

SCREEN 9, , 0, 0
WINDOW (-wx, -wy)-(wx, wy)

ON KEY(10) GOSUB theend11
KEY(10) ON
M = 1
theloop11:
SCREEN 9, , (M MOD 2), ((M - 1) MOD 2)
CLS
REM do the drawing
REM for k=0 to 41:pset (25*cos(k*pi/21),25*sin(k*pi/21)):next
LINE (0, 0)-(25 * COS(dt * M), -25 * SIN(dt * M)), 5
LINE (0, -25)-(25 * COS(dt * M), -25), 6
REM line (25*cos(dt*m),0)-(25*cos(dt*m),-25*sin(dt*m))
CIRCLE (25 * COS(dt * M), 0), 2, 2
LINE (-50, 0)-(-34 + 8 * COS(dt * M), 2), 2
LINE (-16 + 17 * COS(dt * M), -2)-(-34 + 8 * COS(dt * M), 2), 2
LINE (-16 + 17 * COS(dt * M), -2)-(25 * COS(dt * M), 0), 2
REM circle (25*cos(dt*m),25*sin(dt*m)),2,2
M = M + 1
REM if you want discrete repeats
REM if m>mmax then m=1
GOTO theloop11

theend11:
END
'GOTO masterstart
RETURN


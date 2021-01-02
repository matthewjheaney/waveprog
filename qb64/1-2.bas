clx=11
clw = 10
clz = 13
CLS
PRINT "This program multiplies complex numbers."
PRINT "Input the coordinates on w in the complex"
PRINT "plane. Then z starts at the origin, and"
PRINT "can change it with the arrow keys."
PRINT " Press F10 to quit."
INPUT "real part of w "; x1
INPUT "imaginary part of w "; y1

ON ERROR GOTO tryagain12

x1 = 50 * x1
y1 = 50 * y1

SCREEN 9, , 1, 1
WINDOW (0, bottom)-(300, 220)
SCREEN 9, , 0, 0
WINDOW (0, bottom)-(300, 220)
DIM t1(100)
PRINT CHR$(249);
GET (0, 214)-(4, 220), t1()
CLS
DIM w1(100)
PRINT "w";
GET (0, 214)-(4, 220), w1()
CLS
DIM z1(100)
PRINT "z";
GET (0, 214)-(4, 220), z1()
CLS
m = 1
WINDOW (-170, -110 + bottom)-(170, 110)

delta = 1

x = y1
y = -x1

GOSUB theloop12

thekeyin12:

xo = x
yo = y
i$ = INKEY$
IF i$ = CHR$(0) + CHR$(79) THEN GOSUB 1
IF i$ = CHR$(0) + CHR$(68) THEN GOSUB 1
IF i$ = CHR$(0) + CHR$(72) THEN GOSUB 11
IF i$ = CHR$(0) + CHR$(80) THEN GOSUB 12
IF i$ = CHR$(0) + CHR$(77) THEN GOSUB 13
IF i$ = CHR$(0) + CHR$(75) THEN GOSUB 14

GOTO thekeyin12

theloop12:
x2 = (x * x1 - y * y1) / 50
y2 = (x * y1 + y * x1) / 50
CLS
PRINT
PRINT "   w =";
PRINT USING " +#.#"; CINT(x1 / 5) / 10;
PRINT USING " +#.#"; CINT(y1 / 5) / 10;
PRINT "i"
PRINT
PRINT "   z =";
PRINT USING " +#.#"; CINT(x / 5) / 10;
PRINT USING " +#.#"; CINT(y / 5) / 10;
PRINT "i"
PRINT
PRINT "   w"; CHR$(249); "z =";
PRINT USING " +#.#"; CINT(x2 / 5) / 10;
PRINT USING " +#.#"; CINT(y2 / 5) / 10;
PRINT "i"
CIRCLE (x, y), 1, clx
CIRCLE (x1, y1), 1, clw
CIRCLE ((x * x1 - y * y1) / 50, (x * y1 + y * x1) / 50), 1, clx
LINE (-3, 50)-(3, 50), 7
LINE (-3, -50)-(3, -50), 7
LINE (50, -3)-(50, 3), 7
LINE (-50, -3)-(-50, 3), 7
LINE (0, -100 + bottom)-(0, 120), 7
LINE (-150, 0)-(150, 0), 7
LINE (x, y)-(0, 0), clx
PUT (1.2 * x, 1.2 * y), z1()
LINE (x1, y1)-(0, 0), clw
PUT (1.2 * x1, 1.2 * y1), w1()
LINE (x2, y2)-(0, 0), clz
REM put (x2-1,y2+4),t1
CIRCLE (x2, y2), 1, clz
PUT (1.2 * x2 - 4, 1.2 * y2), w1()
PUT (1.2 * x2, 1.2 * y2), t1()
PUT (1.2 * x2 + 4, 1.2 * y2), z1()
SCREEN 9, , (m MOD 2), ((m - 1) MOD 2)
m = m + 1
RETURN


tryagain12:
x = xo
y = yo
x2 = (x * x1 - y * y1) / 50
y2 = (x * y1 + y * x1) / 50
RESUME NEXT

1 CLS
CHAIN "lbas1.exe"
END
RETURN
11 y = y + delta: GOSUB theloop12: RETURN
12 y = y - delta: GOSUB theloop12: RETURN
13 x = x + delta: GOSUB theloop12: RETURN
14 x = x - delta: GOSUB theloop12: RETURN

$compile chain
clx=11
clw=10
clz=13
cls
print "This program multiplies complex numbers."
print "Input the coordinates on w in the complex"
print "plane. Then z starts at the origin, and"
print "can change it with the arrow keys."
print " Press F10 to quit."
input "real part of w ";x1
input "imaginary part of w ";y1

on error goto tryagain12

x1=50*x1
y1=50*y1

screen 9,,1,1
window (0,bottom)-(300,220)
screen 9,,0,0
window (0,bottom)-(300,220)
dim t1(100)
print chr$(249);
get (0,214)-(4,220),t1
cls
dim w1(100)
print "w";
get (0,214)-(4,220),w1
cls
dim z1(100)
print "z";
get (0,214)-(4,220),z1
cls
m=1
window (-170,-110+bottom)-(170,110)

delta=1

x=y1
y=-x1

gosub theloop12

thekeyin12:

xo=x
yo=y
i$=inkey$
if i$=chr$(0)+chr$(79) then gosub 1
if i$=chr$(0)+chr$(68) then gosub 1
if i$=chr$(0)+chr$(72) then gosub 11
if i$=chr$(0)+chr$(80) then gosub 12
if i$=chr$(0)+chr$(77) then gosub 13
if i$=chr$(0)+chr$(75) then gosub 14

goto thekeyin12

theloop12:
x2=(x*x1-y*y1)/50
y2=(x*y1+y*x1)/50
cls
print
print "   w =";
print using " +#.#";cint(x1/5)/10;
print using " +#.#";cint(y1/5)/10;
print "i"
print
print "   z =";
print using " +#.#";cint(x/5)/10;
print using " +#.#";cint(y/5)/10;
print "i"
print
print "   w";chr$(249);"z =";
print using " +#.#";cint(x2/5)/10;
print using " +#.#";cint(y2/5)/10;
print "i"
circle (x,y),1,clx
circle (x1,y1),1,clw
circle ((x*x1-y*y1)/50,(x*y1+y*x1)/50),1,clx
line (-3,50)-(3,50),7
line (-3,-50)-(3,-50),7
line (50,-3)-(50,3),7
line (-50,-3)-(-50,3),7
line (0,-100+bottom)-(0,120),7
line (-150,0)-(150,0),7
line (x,y)-(0,0),clx
put (1.2*x,1.2*y),z1
line (x1,y1)-(0,0),clw
put (1.2*x1,1.2*y1),w1
line (x2,y2)-(0,0),clz
rem put (x2-1,y2+4),t1
circle(x2,y2),1,clz
put (1.2*x2-4,1.2*y2),w1
put (1.2*x2,1.2*y2),t1
put (1.2*x2+4,1.2*y2),z1
screen 9,,(m mod 2),((m-1) mod 2)
m=m+1
return


tryagain12:
x=xo
y=yo
x2=(x*x1-y*y1)/50
y2=(x*y1+y*x1)/50
resume next

1 cls
chain "lbas1.exe"
end
return
11 y=y+delta:gosub theloop12 :return
12 y=y-delta:gosub theloop12 :return
13 x=x+delta:gosub theloop12 :return
14 x=x-delta:gosub theloop12 :return

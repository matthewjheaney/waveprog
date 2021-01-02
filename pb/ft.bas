$compile chain
scrnum=9
on key(10) gosub theend
key(10) on
REM plots the inverse Fourier Transform of a function that you define
REM it is built on a program that plots fnx(fi%,t) versus fny(fi%,t)
REM for fi%=1 to ni%
pi=4*atn(1)
cla=13
screen 0

z1=.2
z2=.3
z3=.35
z4=.355
z5=.38
z6=.9

theloop6ft:
screen 0
color 10
REM input m = number of terms in the fourier transform
print
print "input # of terms in Fourier series"
input m
if m=0 then goto theend:

REM the function in computed on the interval [tmin,tmax]
REM make sure that it is well defined in the interval
tmin=0
tmax=1

REM input n = the number of points to be computed
REM the higher m, the more points you need
n=500

REM reset xmin and xmax and/or ymin and ymax for manual axis scaling
REM if all are 0 then scaling will be automatic
REM the values below are appropriate for the fractal graph

xmin=0
xmax=1
ymin=0
ymax=3.5

REM DEFINE FOURIER COEFFICIENTS

REM FOR SINES
def fnck(k)=(cos(k*pi*z1)+cos(k*pi*z2)+cos(k*pi*z3)-cos(k*pi*z4)-cos(k*pi*z5)-cos(k*pi*z6))*2/pi/k

REM The program allows you to print more than one function at a time
REM input nf% = number of functions

nf%=2
'dim gc(nf%)
'gc(1)=15
'gc(2)=14


REM define functions here -- this is where the graphing program really starts
def fnx(fi%,t)
REM this make the points linearly spaced in t
if fi%=1 then fnx=t
REM if you want more graphs, you go on
if fi%=2 then fnx=t
end def
def fny(fi%,t)
if fi%=1 then
if t<z1 then fny=0
if (t>=z1) and (t<z2) then fny=1
if (t>=z2) and (t<z3) then fny=2
if (t>=z3) and (t<z4) then fny=3
if (t>=z4) and (t<z5) then fny=2
if (t>=z5) and (t<z6) then fny=1
if t>=z6 then fny=0
end if
if fi%=2 then
s=0
REM this adds terms 1 to m in the series
for k=1 to m
s=s+fnck(k)*sin((pi*k*fnx(2,t)))
next
fny=s
end if
if fi%=3 then
fny=whatever
end if
end def

REM the rest of this is the graphing program
def fnmax(a,b)
  if a>=b then fnmax=a
  if b>a then fnmax=b
end def
def fnxx(x)=200*(x-xmin)/(xmax-xmin)
def fnyy(y)=200*(y-ymin)/(ymax-ymin)

if (xmax=0) and (xmin=0) then
xmin=10^10
xmax=-10^10
for fi%=1 to nf%
for i=0 to n
t=tmin+(tmax-tmin)*i/n
x=fnx(fi%,t)
if x>xmax then xmax=x
if x<xmin then xmin=x
next
next
end if

if (ymax=0) and (ymin=0) then
ymin=10^10
ymax=-10^10
for fi%=1 to nf%
for i=0 to n
t=tmin+(tmax-tmin)*i/n
y=fny(fi%,t)
if y>ymax then ymax=y
if y<ymin then ymin=y
next
next
end if

x10=fnmax(10^(ceil(log10(abs(xmax)+.000000001))-1),_
     10^(ceil(log10(abs(xmin)+.000000001))-1))
y10=fnmax(10^(ceil(log10(abs(ymax)+.000000001))-1),_
     10^(ceil(log10(abs(ymin)+.000000001))-1))

xe%=log10(x10)
ye%=log10(y10)

ximax=cint(xmax/x10)
ximin=cint(xmin/x10)
yimax=cint(ymax/y10)
yimin=cint(ymin/y10)

screen scrnum
window (-60,-25)-(245,205)
gosub thenumbers6ft

line (0,0)-(0,200),cla
line (0,0)-(200,0),cla
if xe%<>0 then
locate 25,70
print "x 10^";xe%;
end if
for xi=ximin to ximax
if (xi>=xmin/x10) and (xi<=xmax/x10) then
  line (fnxx(xi*x10),-3)-(fnxx(xi*x10),3),cla
  thenumber=xi
  xvalue=fnxx(xi*x10)-1
  yvalue=-10
  gosub printit6ft
end if
next
if ye%<>0 then
locate 1,1
print "x 10^";ye%
end if
for yi=yimin to yimax
if (yi>=ymin/y10) and (yi<=ymax/y10) then
  line (-3,fnyy(yi*y10))-(3,fnyy(yi*y10)),cla
  thenumber=yi
  xvalue=-15
  yvalue=fnyy(yi*y10)+3
  gosub printit6ft
end if
next

line(fnxx(0),fnyy(0))-(fnxx(w),fnyy(w)),3
line(fnxx(1),fnyy(0))-(fnxx(w),fnyy(w)),3

for fi%=1 to nf%
x=fnx(fi%,tmin)
y=fny(fi%,tmin)
for i=1 to n
t=tmin+(tmax-tmin)*i/n
nx=fnx(fi%,t)
ny=fny(fi%,t)
line (fnxx(x),fnyy(y))-(fnxx(nx),fnyy(ny)),16-fi%*3
x=nx
y=ny
next
next

locate 1,1
color 11
print "type m to to enter a different number of terms"
keyin6ft:
i$=inkey$
if i$="m" or i$="M" then print:print "hit a key":print "to return":print "to menu":goto theloop6ft
goto keyin6ft

thenumbers6ft:
dim b%(9,100)
dim c%(100)
for j=0 to 9
cls
locate 1,1
print using "#";j;
get (pmap(0,2),pmap(0,3))-(pmap(8,2),pmap(11,3)),c%
for k=0 to 100
b%(j,k)=c%(k)
next
next
cls
return

REM below are various subroutines

printit6ft:
for k=0 to 100
c%(k)=b%(abs(thenumber),k)
next
put (xvalue,yvalue),c%
if thenumber<0 then line (xvalue-pmap(4,2)+pmap(0,2),_
           yvalue+pmap(7,3)-pmap(0,3))_
           -(xvalue-pmap(10,2)+pmap(0,2),yvalue+pmap(7,3)-pmap(0,3))
return

theend:
cls
chain "lbas7.exe"
end
return

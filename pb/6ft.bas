REM plots the inverse Fourier Transform of a function that you define
REM it is built on a program that plots fnx(fi%,t) versus fny(fi%,t)
REM for fi%=1 to ni%
pi=4*atn(1)
cla=13
screen 0
print "input w (between 0 and .99)"
input w
if w>.99 then w=.99
if w<0 then w=0
theloop6ft:
cls
screen 0
REM input m = number of terms in the fourier transform
print
print "input number of terms in Fourier series (0 to quit)"
input m
if m=0 then end

REM the function in computed on the interval [tmin,tmax]
REM make sure that it is well defined in the interval
tmin=0
tmax=1

REM input n = the number of points to be computed
REM the higher m, the more points you need
n=10*m/(1-w)
if n>500 then n=500

REM reset xmin and xmax and/or ymin and ymax for manual axis scaling
REM if all are 0 then scaling will be automatic
REM the values below are appropriate for the fractal graph

xmin=0
xmax=1
ymin=0
ymax=1.2

REM DEFINE FOURIER COEFFICIENTS
REM FOR COSINES
REM here is a nice smooth curve
def fnbk(k) = 0
REM here is the fractal
REM where the function fnm is defined below
def fnm(k)
fnm=0
end def

REM to include sin functions, remove the REM below and below ****
REM and define the appropriate Fourier coefficients
def fnck(k)=2*sin(k*pi*w)/k^2/pi^2/(1-w)

REM The program allows you to print more than one function at a time
REM input nf% = number of functions
nf%=1

REM define functions here -- this is where the graphing program really starts
def fnx(fi%,t)
REM this make the points linearly spaced in t
if fi%=1 then fnx=t
REM if you want more graphs, you go on
if fi%=2 then fnx=t
end def
def fny(fi%,t)
if fi%=1 then
REM the step below works if your coefficient function is well defined for k=0,
s=0
REM this adds terms 1 to m in the series
for k=1 to m
s=s+fnck(k)*sin((pi*k*fnx(1,t)))
next
fny=s
end if
REM you can define more functions if you want -- they don't show up unless you
REM reset ni% to 2 or more
if fi%=2 then
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

screen 9
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

for fi%=1 to nf%
x=fnx(fi%,tmin)
y=fny(fi%,tmin)
for i=1 to n
t=tmin+(tmax-tmin)*i/n
nx=fnx(fi%,t)
ny=fny(fi%,t)
line (fnxx(x),fnyy(y))-(fnxx(nx),fnyy(ny))
x=nx
y=ny
next
next

locate 1,1
color 11
print "type m to to enter another number of terms (or quit)"
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


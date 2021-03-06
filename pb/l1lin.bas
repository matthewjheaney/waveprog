FILENAME$="tgraph"

pi=4*atn(1)
aa=1
bb=1

tmin=-1/2
tmax=1/2
tmin=-1/20
tmax=1/20
n=50

rem INPUT NUMBER OF FUNCTIONS
nf%=2

REM DEFINE FUNCTIONS HERE

def fnx(fi%,t)
if fi%=1 then fnx=t
if fi%=2 then fnx=t
if fi%=3 then fnx=2*t
end def
def fny(fi%,t)
if fi%=1 then fny=1-1/(t+1)^2
if fi%=2 then fny=2*t
end def


REM

def fnmax(a,b)
  if a>=b then fnmax=a
  if b>a then fnmax=b
end def
def fnxx(x)=200*(x-xmin)/(xmax-xmin)
def fnyy(y)=200*(y-ymin)/(ymax-ymin)

rem RESET XMIN AND XMAX AND/OR YMIN AND YMAX FOR MANUAL AXIS SCALING
rem IF ALL ARE 0 THEN SCALING WILL BE AUTOMATIC

xmin=0
xmax=0
ymin=-.2
ymax=.2

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

screen 11
window (-60,-25)-(245,205)
gosub thenumbers

line (0,0)-(0,200)
line (0,0)-(200,0)
if xe%<>0 then
locate 25,70
print "x 10^";xe%;
end if
for xi=ximin to ximax
if (xi>=xmin/x10) and (xi<=xmax/x10) then
  line (fnxx(xi*x10),-3)-(fnxx(xi*x10),3)
  thenumber=xi
  xvalue=fnxx(xi*x10)-1
  yvalue=-10
  gosub printit
end if
next
if ye%<>0 then
locate 1,1
print "x 10^";ye%
end if
for yi=yimin to yimax
if (yi>=ymin/y10) and (yi<=ymax/y10) then
  line (-3,fnyy(yi*y10))-(3,fnyy(yi*y10))
  thenumber=yi
  xvalue=-15
  yvalue=fnyy(yi*y10)+3
  gosub printit
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

keyin:
i$=inkey$
if i$="q" then end
if i$="c" then goto therest
goto keyin
therest:

open FILENAME$+".tex" for output as #1
print #1, "$$\beginpicture"
print #1, "\setplotarea x from 0 to 300, y from 0 to 300"
print #1, "\axis bottom visible /"
print #1, "\axis left visible /"

for xi=ximin to ximax
if (xi>=xmin/x10) and (xi<=xmax/x10) then
print #1, "\putrule from ";cint(1.5*fnxx(xi*x10)*10)/10;" -3";
print #1, " to ";cint(1.5*fnxx(xi*x10)*10)/10;" 3"
print #1, "\put {$";xi;"$} at ";cint(1.5*fnxx(xi*x10)*10)/10;" ";-17
end if
next
if xe%<>0 then print #1, "\put {$\times 10^{";xe%;"}$} at 230 -17"
for yi=yimin to yimax
if (yi>=ymin/y10) and (yi<=ymax/y10) then
print #1, "\putrule from -3 ";cint(1.5*fnyy(yi*y10)*10)/10;
print #1, " to 3 ";cint(1.5*fnyy(yi*y10)*10)/10
print #1, "\put {$";yi; "$} [r] at -17 ";1.5*cint(fnyy(yi*y10)*10)/10
end if
next
if ye%<>0 then print #1, "\put {$\times 10^{";ye%;"}$} at -10 230"
print #1, "%\plotheading{}"
print #1, "\visibleaxes"
print #1, "\normalgraphs"
for fi%=1 to nf%
print #1, "\plot"
x=fnx(fi%,tmin)
y=fny(fi%,tmin)
for i=1 to n+1
t=tmin+(tmax-tmin)*i/n
nx=fnx(fi%,t)
ny=fny(fi%,t)
print #1, using "###.#";1.5*fnxx(x);
print #1, " ";
print #1, using "###.#";1.5*fnyy(y)
x=nx
y=ny
next
print #1, "/"
next
print #1, "\endpicture$$"

close #1
end

thenumbers:
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

printit:
for k=0 to 100
c%(k)=b%(abs(thenumber),k)
next
put (xvalue,yvalue),c%
if thenumber<0 then line (xvalue-pmap(4,2)+pmap(0,2),_
           yvalue+pmap(7,3)-pmap(0,3))_
           -(xvalue-pmap(10,2)+pmap(0,2),yvalue+pmap(7,3)-pmap(0,3))
return



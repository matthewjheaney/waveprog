$compile chain
screenasp=1
plotarea=200
k12=3
pi=4*atn(1)
randomize timer
nn=2
dt=.01*nn
dim o1(nn)
dim o2(nn)
dim f1(nn)
dim f2(nn)

for j=1 to nn
o1(j)=rnd-1/2
o2(j)=rnd-1/2
f1(j)=pi*(rnd-1/2)
f2(j)=pi*(rnd-1/2)
next

d=30

def fnx(t)
  fx=0
  for j=1 to nn
  fx=fx+cos((1+o1(j)/d)*t+f1(j))
  next
  fnx=fx/nn
  end def

def fny(t)
  fy=0
  for j=1 to nn
  fy=fy+cos((1+o2(j)/d)*t+f1(j))
  next
  fny=fy/nn
end def


def fnxx(x)=200*(x-xmin)/(xmax-xmin)
def fnyy(y)=200*(y-ymin)/(ymax-ymin)

xmin=-1
xmax=1
ymin=-1
ymax=1

on key(10) gosub theend
key(10) on

screen 12
window ((92-152*screenasp),-25)-((92+153*screenasp),205)

x=fnx(0)
y=fny(0)
t=0
theloop12p2:
t=t+dt
nx=fnx(t)
ny=fny(t)
line (fnxx(x),fnyy(y))-(fnxx(nx),fnyy(ny)),cint(13+t/200)
x=nx
y=ny
goto theloop12p2

theend:
cls
chain "lbas18.exe"
end
end


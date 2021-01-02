$compile chain
scrwidth=220
pi=atn(1)*4
dt=.05
cllp=13
cllm=14
r=100

def fnx(t)=(cos(t)+sin(t)/3)
def fny(t)=(cos(t)-sin(t)/3)

axescolor=3
circlecolor=2
dim cir(500)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

circle (0,0),2,circlecolor
paint (0,0),circlecolor
get (-4,4)-(5,-4),cir
cls

key(10) on
on key(10) gosub theend

thestart:
t=0
m=1
line (-150,0)-(150,0)
line (0,-150)-(0,150)
put (r*(fnx(t))-4,r*(fny(t))+4),cir,xor

theloop:
x1=r*(fnx(t))-4
y1=r*(fny(t))+4
t=t+dt
xx1=r*(fnx(t))-4
yy1=r*(fny(t))+4
put (xx1,yy1),cir,xor
put (x1,y1),cir,xor
pset (x1+4,y1-4),circlecolor
delay .054
goto theloop

theend:
cls
chain "lbas18.exe"
end
end
return



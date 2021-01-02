scrwidth=250
pi=atn(1)*4
screen 9
window (-scrwidth,-150)-(scrwidth,150)

randomize timer

def fns(x)
  if x=0 then fns=1 else fns=sin(x)/x
end def

'def fnd(x,y)=fns(x/2^(1/2))*fns(y/2^(1/2))
'def fnd(x,y)=fns(x/2+y/2)*fns(x/2-y/2)
def fnd(x,y)=fns(x/2+y)*fns(x/2-y)
'def fnd(x,y)=fns(2*x/2^(1/2))*fns(y/2^(1/2))
'def fnd(x,y)=fns(x/2^(1/2))*fns(2*y/2^(1/2))

on key(10) gosub theend
key(10) on

line (100,100)-(100,-100)
line (-100,-100)-(100,-100)
line (-100,-100)-(-100,100)
line (-100,100)-(100,100)

m=0

theloop:
x=-100+200*rnd
y=-100+200*rnd
if fnd(x/12,y/12)^2>rnd then
 circle (x,y),.1,13
 m=m+1
end if
goto theloop

theend:
print m
end

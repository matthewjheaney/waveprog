$compile chain
on timer(300) gosub thechain
timer on
on key(9) gosub thechain
key(9) on
scrwidth=250
pi=atn(1)*4
dt=.03
o=2
cllp=13
cllm=14

def fnx(k,t,j)
      if j=1 then fnx=8*cos(6*pi*k/300-o*t)
      if j=2 then fnx=15*sin(2*pi*k/300)*sin(o*t)
      if j=3 then fnx=10*sin(6*pi*k/300)*cos(o*t)
      if j=4 then fnx=8*cos(10.5*pi*(k+150)/300)*cos(o*t)
end def

screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

key(10) on
on key(10) gosub theend

thestart:
t=0
m=1
theloop:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop

theend:
end

thechain:
cls
chain "hr961.exe"
return

drawit:
REM do the drawing
for j=1 to 4
line (-150,-131+50*j)-(150,-131+50*j), cllp
line (-150,-119+50*j)-(150,-119+50*j), cllp
for k=-150 to 150 step 10
line (k+fnx(k,t,j),-130+50*j)-(k+fnx(k,t,j),-120+50*j),cllm
next
next
for j=2 to 4
line (150,-131+50*j)-(150,-119+50*j), cllp
next
line (-150,-131+100)-(-150,-119+100), cllp
line (-150,-131+150)-(-150,-119+150), cllp
locate 6,6
print "A"
locate 11,6
print "B"
locate 15,6
print "C"
locate 20,6
print "D"
delay .05
t=t+dt
return



$compile chain
scrwidth=250
pi=atn(1)*4
dt=.06

cllp=13
cllm=14
v=60
t0=-500/v
xr=cint(.9*scrwidth)

tau=50

def fnf(x)=100*tau^2/(x^2+tau^2)
def fng(x,t)=fnf((x-xr)-v*t)+fnf(-(x-xr)-v*t)

screen 9,,1,1
window (-scrwidth,-50)-(scrwidth,250)

screen 9,,0,0
window (-scrwidth,-50)-(scrwidth,250)

key(10) on
on key(10) gosub theend

thestart:
t=t0
m=1
theloop:
if t>-2*t0 then t=t0
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop

theend:
cls
chain "lbas13.exe"
end
end

drawit:
REM do the drawing
pset (-scrwidth,fng(-scrwidth,t))
for xx=-scrwidth to xr step 5
line -(xx,fng(xx,t))
next
delay .05
t=t+dt
return



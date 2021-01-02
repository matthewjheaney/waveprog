$compile chain
scrwidth=220
pi=atn(1)*4
dt=.1
cllp=13
cllm=14
d=15

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
cls
chain "lbas21.exe"
end
end

drawit:
REM do the drawing
line (0,150)-(0,d)
line (0,-150)-(0,-d)
delay .05
for j=-scrwidth-20 to 0 step 20
line (j+20*(frac(t)-1),150)-(j+20*(frac(t)-1),-150),cllp
line (-j+20*(frac(t)-1),d-2)-(-j+20*(frac(t)-1),-d+2),cllp
next
locate 4,55
print "THIS IS NOT"
locate 8,55
print "WHAT HAPPENS"
locate 18,55
print "LIGHT IS"
locate 22,55
print "NOT BULLETS"
delay .054
t=t+dt
return



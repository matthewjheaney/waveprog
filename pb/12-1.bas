$compile chain
scrwidth=200
pi=atn(1)*4
u1=1
phi1=0
u2=1
phi2=0
dt=.08
t=0
cll=12
nmu%=10
nphi%=0
nmphi%=10
nu1%=nmu%
nu2%=nmu%
mmm=24
screen 9,,1,1
window (-scrwidth,-150)-(scrwidth,150)

screen 9,,0,0
window (-scrwidth,-150)-(scrwidth,150)

on key(10) gosub theend
key(10) on
on key (1) gosub phidown12p1
key(1) on
on key (2) gosub phiup12p1
key(2) on
on key (12) gosub u1down12p1
key(12) on
on key (13) gosub u1up12p1
key(13) on
on key (14) gosub u2down12p1
key(14) on
on key (11) gosub u2up12p1
key(11) on


thestart12p1:
t=0
m=1
theloop12p1:
screen 9,,(m mod 2),((m-1) mod 2)
cls
gosub drawit
m=m+1
REM if you want discrete repeats
REM if m>mmax then m=1
goto theloop12p1


drawit:
if nphi%=0 then ss$=" "
if nphi%>0 then ss$="+"
if nphi%<0 then ss$="-"
locate 1,1
print chr$(218);"             ";chr$(191)
print chr$(179);"     ";
print using "#.#"; u1;
print "     ";chr$(179)
print chr$(179);"             ";chr$(179)
print chr$(179);"      ";ss$;
print using "#.#";abs(nphi%/nmphi%);
print "i";chr$(227);" ";chr$(179)
print chr$(179);
print using " #.#";u2;
print chr$(250);"e       ";chr$(179)
print chr$(192);"             ";chr$(217)
REM do the drawing
line (0,0)-(100*u1*cos(t-phi1),0),cll-1
line (0,0)-(0,100*u2*cos(t-phi2)),cll
line (0,0)-(100*u1*cos(t-phi1),100*u2*cos(t-phi2)),cll+1
for mm=0 to mmm
circle (100*u1*cos(2*pi*mm/mmm-phi1),100*u2*cos(2*pi*mm/mmm-phi2)),1,14
next
t=t+dt
delay .054
return

phidown12p1:
nphi%=nphi%-1
if nphi%<=-nmphi% then nphi%=nphi%+nmphi%+nmphi%
phi2=nphi%*pi/nmphi%
return
phiup12p1:
nphi%=nphi%+1
if nphi%>nmphi% then nphi%=nphi%-nmphi%-nmphi%
phi2=nphi%*pi/nmphi%
return

u1up12p1:
if nu1%<nmu% then nu1%=nu1%+1
u1=nu1%/nmu%
return
u1down12p1:
if nu1%>0 then nu1%=nu1%-1
u1=nu1%/nmu%
return
u2up12p1:
if nu2%<nmu% then nu2%=nu2%+1
u2=nu2%/nmu%
return
u2down12p1:
if nu2%>0 then nu2%=nu2%-1
u2=nu2%/nmu%
return

theend:
cls
chain "lbas18.exe"
end
end

h=350
v=10
k=.01

screen 12
window (-150,-200)-(150,0)

def fnxx(x,y,z)=h*(exp(k*z)-exp(k*y))/(exp(k*z)+exp(k*y)-exp(k*(y+z)))

def fnyy(x,y,z)=v*x*exp(k*(y+z))/(exp(k*z)+exp(k*y)-exp(k*(y+z)))

sub perline(x1,y1,z1,x2,y2,z2)
line (fnxx(x1,y1,z1),fnyy(x1,y1,z1))-(fnxx(x2,y2,z2),fnyy(x2,y2,z2))
end sub

sub percircle(x1,y1,z1,r1,c1)
circle (fnxx(x1,y1,z1),fnyy(x1,y1,z1)),.2*r1*fnyy(1,y1,z1),c1
end sub

for x=-10 to -2 step 4

for z=-30 to 0 step 5
call perline(x,0,z,x,-30,z)
next z

for y=-30 to 0 step 5
call perline(x,y,0,x,y,-30)
next y

next x


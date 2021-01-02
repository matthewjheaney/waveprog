open "tgraph.tex" for output as #1
randomize timer
pi=4*atn(1)
dim psi(50)
dim c(25),d(25)
for j=0 to 25
c(j)=20*(rnd-.5)
d(j)=20*(rnd-.5)
next
c1=int(8*rnd)
c(c1)=25
d1=int(8*rnd)
d(d1)=25
for k=0 to 50
psi(k)=c(0)
next
for j=1 to 25
for k=0 to 50
psi(k)=psi(k)+2*c(j)*cos(2*j*k*pi/51)-2*d(j)*sin(2*j*k*pi/51)
next
next

screen 9,,1,1
window (-10,-150)-(60,150)

cls

for j=0 to 25
line (j,50)-(j,50+c(j))
next
for j=1 to 25
line (j,0)-(j,d(j))
next

for j=0 to 50
line (j,-50)-(j,-50+psi(j)/5)
next

input s$
if s$="s" then
print #1, ""
print #1, "$$\beginpicture"
print #1, "\setcoordinatesystem units <2pt,1pt>"

for j=0 to 50
print #1, "\putrule from";j;0;" to";j;round(psi(j)/5,1)
next

print #1, "\endpicture$$"
print #1, ""
print #1, "$$\beginpicture"
print #1, "\setcoordinatesystem units <2pt,1pt>"

print #1, "\setquadratic"
print #1, "\setdashes"
print #1, "\plot"
for j=0 to 50
print #1, j;round(10*cos(2*j*c1*pi/51)-10*sin(2*j*d1*pi/51),1)
next

print #1, "/"
print #1, "\linethickness=0pt"
print #1, "\putrule from 0 0 to 50 0"
print #1, "\putrule from 0 -40 to 0 40"
print #1, "\endpicture$$"

print #1, "$$\cos(";c1;"\cdot2\pi x/\ell)-\sin(";d1;"\cdot2\pi x\ell)$$"

print #1, "$$\beginpicture"
print #1, "\setcoordinatesystem units <2pt,1pt>"

print #1, "\put {0} at 0 85"
print #1, "\put {10} at 10 85"
print #1, "\put {20} at 20 85"
print #1, "\put {$n=";c1;"$} at 40 50"
print #1, "\put {$n=";d1;"$} at 40 0"

for j=0 to 25
print #1, "\putrule from";j;50;" to";j;50+round(c(j),1)
next
for j=1 to 25
print #1, "\putrule from";j;0;" to";j;round(d(j),1)
next

print #1, "\endpicture$$"

end if

close #1
end

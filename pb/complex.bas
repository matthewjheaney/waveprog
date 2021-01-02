type complex
r as ext
i as ext
end type

dim z as complex
dim z1 as complex
dim z2 as complex
dim z3 as complex
dim z4 as complex
dim z5 as complex
dim z6 as complex
dim z7 as complex
dim z8 as complex
dim z9 as complex

pi=4*atn(1)

sub cabs(z as complex,r)
 r=(z.r^2+z.i^2)^(1/2)
end sub

sub cadd(z1 as complex,z2 as complex,z3 as complex)
	z3.r=z1.r+z2.r
	z3.i=z1.i+z2.i
end sub

sub csub(z1 as complex,z2 as complex,z3 as complex)
	z3.r=z1.r-z2.r
	z3.i=z1.i-z2.i
end sub

sub cmul(z1 as complex,z2 as complex,z3 as complex)
	dim zl as complex
	zl.r=z1.r*z2.r-z1.i*z2.i
	zl.i=z1.r*z2.i+z1.i*z2.r
	z3=zl
end sub

sub cdiv(z1 as complex,z2 as complex,z3 as complex)
	dim zl as complex
	zl.r=(z1.r*z2.r+z1.i*z2.i)/(z2.r^2+z2.i^2)
	zl.i=(-z1.r*z2.i+z1.i*z2.r)/(z2.r^2+z2.i^2)
	z3=zl
end sub

sub crea(r,z as complex)
	z.r=r
	z.i=0
end sub

sub ccon(z1 as complex,z2 as complex)
	z2.r=z1.r
	z2.i=-z1.i
end sub

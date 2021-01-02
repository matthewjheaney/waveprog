
def fnthreedx(x,y,z)=(x+y)/sqr(2)
def fnthreedy(x,y,z)=z+c*(y-x)

sub threedline(x1,y1,z1,x2,y2,z2,cll)
  line (fnthreedx(x1,y1,z1),fnthreedy(x1,y1,z1))-(fnthreedx(x2,y2,z2),fnthreedy(x2,y2,z2)),cll
end sub

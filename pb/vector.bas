sub vector(xv,yv,xvv,yvv,va,cl)
local vl
vl=((xvv-xv)^2+(yvv-yv)^2)^(1/2)
line (xv,yv)-(xvv,yvv),cl
line (xvv,yvv)-(xvv-va/vl*(xvv-xv)+va/vl/2*(yvv-yv),yvv-va/vl*(yvv-yv)-va/vl/2*(xvv-xv)),cl
line (xvv,yvv)-(xvv-va/vl*(xvv-xv)-va/vl/2*(yvv-yv),yvv-va/vl*(yvv-yv)+va/vl/2*(xvv-xv)),cl
end sub

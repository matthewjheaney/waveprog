key(11) on
on key(11) gosub yplus

key(14) on
on key(14) gosub yminus

key(13) on
on key(13) gosub xplus

key(12) on
on key(12) gosub xminus

xplus:
x0=x0+dx
return

yplus:
y0=y0+dy
return

xminus:
x0=x0-dx
return

yminus:
y0=y0-dy
return

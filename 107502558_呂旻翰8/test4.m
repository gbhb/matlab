
x= meshgrid(1:15:100);
y= meshgrid(1:20:200);
[x,y] = meshgrid(x,y);
z=sin(x)+cos(y);

surf(x,y,z)
title("simple end") 
colorbar


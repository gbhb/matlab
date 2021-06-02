theta=linspace(-pi,pi,50);
phi=linspace(-pi/2,pi/2,50);
[t,p] = meshgrid(theta,phi);
x=sin(t).*sin(p);
y=cos(p).*cos(t);
z=sin(p).*cos(p);
surf(x,y,z)
title("\bf unknown sphere");


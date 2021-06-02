t=0:pi/30:20*pi;
vx=t.*sin(t);
vy=t.*cos(t);
plot3(vx,vy,t);
hold on
plot3(vy,vx,t);
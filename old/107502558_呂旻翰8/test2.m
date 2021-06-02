t=0:0.1:10;
x=exp(-0.2*t).*cos(2*t);
y=exp(-0.2*t).*sin(2*t);
plot3(x,y,t);
grid on;
title('Three-Dimensional Line Plot');
xlabel('x')
ylabel('y')
zlabel('time')
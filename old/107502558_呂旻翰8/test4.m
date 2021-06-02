theta=0:0.1:2*pi;
e=cos(theta)+sin(theta)*(1j);
x=real(e);
y=imag(e);
plot3(x,y,theta);
title('Euler equation when \theta=0:0.1:2\pi');
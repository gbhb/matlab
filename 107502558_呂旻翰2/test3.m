t = 0:pi/20:4*pi;
y = exp(-0.2.*t).*(cos(t)+1i.*sin(t));

yr=real(y);
yi=imag(y);
plot(t,yr);
hold on;
plot(t,yi);
legend('real','img')
title('Plot of complex function vs Time')
xlabel('\bf\itt');
ylabel('\bf\ity(t)');
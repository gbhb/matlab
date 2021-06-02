subplot(3,1,1);
x = 0:0.1:10;
y = exp(x.*(-0.5)).*sin(2.*x);
plot(x,y,'r-','LineWidth',2.0)
title('exp(-0.5.*x).*sin(2.*x):');

subplot(3,1,2);
y1 = exp(x.*(-0.5)).*cos(2.*x);
plot(x,y1,'b--','LineWidth',3.0)
title('exp(-0.5.*x).*cos(2.*x):');

subplot(3,1,3);
plot(x,y,'r-','LineWidth',2.0)
hold on;
plot(x,y1,'b--','LineWidth',3.0)
title('combination:');
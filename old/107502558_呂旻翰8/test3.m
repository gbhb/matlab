t=0:0.01:10;
v=10.*exp((-0.2+pi.*1i).*t);

plot(t,v);
figure;
plot(v);
figure;
polar(t,v);

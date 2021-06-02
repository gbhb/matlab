t=-1:0.01:1;
y=cos(2*pi.*t-0);
h=plot(t,y);
for theta = 0:pi/10:2*pi
    
set(h, 'YData' , cos(2*pi.*t-theta));
pause(0.5)
end

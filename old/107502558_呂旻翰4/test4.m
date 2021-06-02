d=1:1:7;
t=200*8*8./(d.*sqrt(64-d.^2));

plot(d,t,'bo')
xlabel('Distance')
ylabel('Tension')
title("Tension when d=1~7")
[Value,Index]=min(t);
fprintf("Lowest tension when d from 1 to 7 is %d",Index);

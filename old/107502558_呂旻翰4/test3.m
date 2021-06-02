[x,y] = textread('text3.txt','%f %f')
p = polyfit(x,y,1);
xx = 1:8;
yy = xx.*p(1)+p(2);
plot(x,y,'bo',xx,yy,'g-');
title("Least Square Regression When n=1")



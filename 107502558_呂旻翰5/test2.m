x = -1:0.1:3;
y = 2*x.^2-3.*sin(x)+2;
index = size(x,2);
yy =zeros(1,index);
for i = 1:index
    yy(i)=2*x(i).^2-3.*sin(x(i))+2;
end
plot(x,y,'c--','LineWidth',3.0)
hold on
plot(x,yy,'.m','MarkerSize',20.0)





x = -1:0.1:3;
y = x.^2-3.*x+2;
index = size(x,2);
yy =zeros(1,index);
for i = 1:index
    yy(i)=x(i).^2-3.*x(i)+2;
end


plot(x,y,'r--','LineWidth',3.0)
hold on


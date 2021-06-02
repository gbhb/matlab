tic
x = -1:0.1:3;
startTime=tic;
y = 2*x.^2-3.*sin(x)+2;
elpTim2=toc(startTime);
tic
startTime=tic;
index = size(x,2);
yy =zeros(1,index);
for i = 1:index
    
    yy(i)=2*x(i).^2-3.*sin(x(i))+2;
end
elpTim1=toc(startTime);

fprintf('for loop time consume : %d\n',elpTim1);
fprintf('vectorization time consume : %d\n',elpTim2);


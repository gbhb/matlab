x=-1:0.01:1;
y=zeros(201);
y=x./(-5);
while (max(x)-min(x))>(10^(-8))
   x=x./(-5);
end
fprintf('進入迴圈前最大值： 1，最小值：-1\n');
fprintf('進入迴圈後最大值： %d，最小值：%d',max(x),min(x));
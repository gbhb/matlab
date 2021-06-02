x=-1:0.01:1;
y=zeros(201);
y=x./(-5);
while (max(x)-min(x))>(10^(-8))
   x=x./(-5);
end
fprintf('秈癹伴玡程 1程-1\n');
fprintf('秈癹伴程 %d程%d',max(x),min(x));
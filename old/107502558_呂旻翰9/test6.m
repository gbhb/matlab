fid = fopen('interest.txt','w');
p=input('最初金額: ');
i=input('年利率: ');
for n=1:5
fprintf(fid,'第%d年\t%d\n',n,p*(1+i/1200)^n\n);
end
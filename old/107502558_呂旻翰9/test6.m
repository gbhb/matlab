fid = fopen('interest.txt','w');
p=input('�̪���B: ');
i=input('�~�Q�v: ');
for n=1:5
fprintf(fid,'��%d�~\t%d\n',n,p*(1+i/1200)^n\n);
end
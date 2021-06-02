fid = fopen('test4.txt');
a=fscanf(fid,'%f',[1 inf]);
[c,Index1]=max(a);
[b,Index2]=min(a);
fprintf('The max value is %d. At %d.\n',c,Index1);
fprintf('The min value is %d. At %d.\n',b,Index2);
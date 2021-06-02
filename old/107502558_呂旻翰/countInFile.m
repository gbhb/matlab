function count=countInFile(filename,lowerBound,upperBound)
if exist(filename,'file')==0
    error('File not exist!')
end
fid = fopen(filename);
c=0;
count=0;
a=fscanf(fid,'%f',[1 inf]);
while c<length(a)
    c=c+1;
    if a(c)>lowerBound&&a(c)<upperBound
    count=count+1;
    end
end

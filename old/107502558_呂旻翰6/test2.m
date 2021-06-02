a=cell(2,2);
a{1,1}=1:15;
a{1,2}='String';
a{2,1}=[];
a{2,2}=reshape(1:10,[2,5]);
for i =1:2
    for ii=1:2
    if ischar(a{i,ii})==true
        fprintf("String at {%d,%d} is 'String'\n",i,ii);
    end
    end
end
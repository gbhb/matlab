prompt = "input file name: ";
filename = input(prompt,'s');
if isfile(filename)
    [fid] = fopen(filename, 'r+');
else
    disp('Open file failed');
    test4
end
a=fscanf(fid,'%f',[1 inf]);
a=round(a);
fclose(fid);

prompt = "output file name: ";
filename = input(prompt,'s');
x='0';
b=1;
if isfile(filename)
    while b==1
        disp("Outputfile already exist.")
        disp("Keep existing file? (y/n)")
        x=input('','s');
        if(x=='n')
            [fid] = fopen(filename,'w+');
            break;
        end
        filename = input(prompt,'s');
        if isfile(filename)
            b=1;
        else
            b=0;
            [fid] = fopen(filename,'w+');
        end
    end
else
    [fid] = fopen(filename,'w+');
end
fprintf(fid,'%d\n',a);
fclose(fid);
clear fid;
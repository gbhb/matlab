fid = fopen('test3.txt','w');
fprintf(fid,'九九乘法表\n');
for i= 1:9
    for k=1:9
        fprintf(fid,'%d x %d = %2d\t',k,i,i*k);
    end
        fprintf(fid,'\r\n');
end
fclose(fid);
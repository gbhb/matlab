fid = fopen('test2.txt');
array=fscanf(fid,'%f%f',[2 inf]);
fclose(fid);
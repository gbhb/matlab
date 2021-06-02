search_str={'to','favorite'};

for idx = 1:length(search_str)
    grep('test_f2.txt',search_str{idx});
end

function grep(filename,pattern)
if exist(filename, 'dir') == 0 
[fid] = fopen(filename, 'r');
end
line_number=1;
line = 0;
while line ~= -1
    line = fgetl(fid);
    match = strfind(line,pattern);
    if ~isempty(match)
        fprintf('%d: %s \n',line_number,line);
    end
    line_number=line_number+1;
end
    
    fclose(fid);
    clear fid;
end
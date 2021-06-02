%% test1_template.txt

%% If test_f1.txt do not exist, then create a new one( named test_f1.txt ).
if exist('test_f1.txt', 'dir') == 0 
    [fid] = fopen('test_f1.txt', 'w');  %% create a new test_f1.txt.
    fclose(fid);
    clear fid;
end


[fid] = fopen('test_f1.txt');  %% you can use fid to get the default permission.
[filename,permission]=fopen(fid);
default_permission_test_f1_txt = permission;  %% your code here.
fprintf('Because the default permission of file is %s\n', default_permission_test_f1_txt);

fwrite_str = 'Hallo matlab string..';
%% can not write 'fwrite_str' into 'test_f1.txt' ??
fclose(fid);
[fid] = fopen('test_f1.txt', 'r+');
fwrite(fid, fwrite_str); 
fclose(fid);
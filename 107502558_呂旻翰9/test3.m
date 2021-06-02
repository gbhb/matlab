fid = fopen('test_f3.txt','r');

key_str ={'Name Nation Grade Score Age PASS_EXAM'};
key_lst = split(key_str,' ');
C = textscan(fid,'%s %s %s %f %d %s');
for i = 1:6
   disp(key_lst{i}+" :");
   disp(C{i}) 
   disp("-----------------------")
end
fclose(fid);
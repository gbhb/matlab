disp('�X�{roundoff errors �۵����ե���')
f = exp(1i*pi)+1;
if abs(f - 0) < 1.0e-14
    disp('the same')
else
    disp('not the same')
end
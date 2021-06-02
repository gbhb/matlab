disp('出現roundoff errors 相等測試失敗')
f = exp(1i*pi)+1;
if abs(f - 0) < 1.0e-14
    disp('the same')
else
    disp('not the same')
end
x=input('請輸入缺席次數： ');
if x<0
    disp('次數不得小於0次。')
    test2;
else 
    y=100-2^(x-1);
    if y<0
       fprintf('調整後的成績為： %d',0);
    else
       fprintf('調整後的成績為： %d',y);
    end
end

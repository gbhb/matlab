x=input('�п�J�ʮu���ơG ');
if x<0
    disp('���Ƥ��o�p��0���C')
    test2;
else 
    y=100-2^(x-1);
    if y<0
       fprintf('�վ�᪺���Z���G %d',0);
    else
       fprintf('�վ�᪺���Z���G %d',y);
    end
end

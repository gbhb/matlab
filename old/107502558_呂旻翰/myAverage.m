function output = myAverage(in)
szdim=size(in);
if szdim(1)>1
    disp('��J�������V�q')
elseif length(in)<3
    disp('��J�V�q�j�p�����j��2')
else 
    output= (sum(in)-(max(in))-(min(in)))/((length(in)-2));



end
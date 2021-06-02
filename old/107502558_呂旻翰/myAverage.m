function output = myAverage(in)
szdim=size(in);
if szdim(1)>1
    disp('輸入必須為向量')
elseif length(in)<3
    disp('輸入向量大小必須大於2')
else 
    output= (sum(in)-(max(in))-(min(in)))/((length(in)-2));



end
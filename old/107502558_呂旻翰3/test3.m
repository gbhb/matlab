in=input('Please input the income: ');
itax=0;

alltax=0;
if in<=6000
itax=0;
elseif in>6000 && in <=20000
itax=0.17*(in-6000);
elseif in>20000 && in <=50000
itax=2380+0.3*(in-20000);
elseif in>50000 && in <=60000
itax=11380+0.42*(in-50000);
elseif in>60000
itax=15580+0.47*(in-60000);
end

htax=in*0.015;
fprintf('Income tax: %.3f, health tax: %.3f, total tax: %.3f.',itax,htax,itax+htax);



c = 1 - sqrt(3) * 1i ;
[r,theta] = to_polar(c);
fprintf('%s can be written as r*(cos£c+sin£c*i) when r = %g and £c = %g¢X.\n',num2str(c),r,theta);
cofLst = [3,2,6];
fprintf("ans = %d\n",fh(2,3,5));



function fh = sum_gen(cofLst)
    strTmp = "@(";
    strTmp2 = "a, b, c) ";
    x=num2str(cofLst(1));
    y=num2str(cofLst(2));
    z=num2str(cofLst(3));
    strcat(strTmp, strTmp2,x,"a+",y,"b+",z,"c");

    fh = str2func(strTmp);
end

function test1(iter,ser_typ)
if ser_typ == "Lucas"
    fprintf('The %d of term in Lucas = %d\n',iter,lucas(iter));
    
end
if ser_typ == "Fibo"
    fprintf('The %d of term in Fibo = %d\n',iter,fibo(iter));
end
end
function output = lucas(n)
    if n==0
        output=2;
    elseif n==1
        output=1;
    else
        output=lucas(n-1)+lucas(n-2);
    end

end
function output = fibo(n)
    if n==0
        output=0;
    elseif n==1
        output=1;
    else
        output=fibo(n-1)+fibo(n-2);
    end
end
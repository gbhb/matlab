function output = TrigonometricFun(fun,value)
    
    a=func2str(fun);
    if a=="sin"||a=="cos"
    output = fun(value); 
    else
    error('fun must be @sin or @cos');
    end
    
    
end


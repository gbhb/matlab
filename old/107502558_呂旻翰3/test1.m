w=input('Please input the weight of the bag:');

if(w>=10)
    m=(w-2)*50+150+150;
elseif(w>2)
    m=(w-2)*50+150;
else
    m=150;
end
fprintf('The fee will be $%d.',m);
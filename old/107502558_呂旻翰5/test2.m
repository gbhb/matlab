x=1:1:6;
a=0;
b=0;
c=0;
d=0;
e=0;
f=0;
for i = 1:1000
    if Dice()==1
        a=a+1;
    end
    if Dice()==2
        b=b+1;
    end
    if Dice()==3
        c=c+1;
    end
    if Dice()==4
        d=d+1;
    end
    if Dice()==5
        e=e+1;
    end
    if Dice()==6
        f=f+1;
    end
end
y=[a,b,c,d,e,f];
plot(x,y)
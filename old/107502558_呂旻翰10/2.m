t=0:0.01:2*pi;
y1=10*cos(t);
y2=6*sin(t);
h=plot(y1,y2);
while 1
    w = waitforbuttonpress;
    p = get(gcf, 'CurrentCharacter');
    if p=='w'|| p=='W'
        set(h,'LineWidth',rand(1)*5)
    end
    if p=='x'|| p=='X'
        break;
    end
    if p=='c'|| p=='C'
        x=[rand(1),rand(1),rand(1)];
        set(h,'Color',x)
    end
    if p=='s'|| p=='S'
        x=unidrnd(4);
        if x==1
        set(h,'LineStyle','-')
        end
        if x==2
        set(h,'LineStyle','--')
        end
        if x==3
        set(h,'LineStyle',':')
        end
        if x==4
        set(h,'LineStyle','-.')
        end
    end
        
end
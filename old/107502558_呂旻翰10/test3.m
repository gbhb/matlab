t=-2:0.01:2;
y1=cos(t./pi);
y2=2*sin(t.*pi/2);
h=plot(t,y1,t,y2);
while 1
    w = waitforbuttonpress;
    p = gco;
    x=get(p,'Type');
    if x=="line"
    x=[rand(1),rand(1),rand(1)];
    set(p,'Color',x)
    end
end
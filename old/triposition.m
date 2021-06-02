function [locx,locy] = triposition(xa,ya,da,xb,yb,db,xc,yc,dc)
%              三點定位法                          %
%輸入：
%   1.參考節點A（xa,ya）,B(xb,yb),C(xc,yc)
%   2.定位節點D(locx,locy)到這三點的距離分別為da,db,dc
%返回：
%   （locx，locy)為計算的定位節點D點的位置坐標
%
syms x y   %f符號變量
%--------------求解方程組------------------------------------
f1 = 2*x*(xa-xc)+xc^2-xa^2+2*y*(ya-yc)+yc^2-ya^2 == dc^2-da^2;
f2 = 2*x*(xb-xc)+xc^2-xb^2+2*y*(yb-yc)+yc^2-yb^2 == dc^2-db^2;
% 解關於x,y的符號方程組，得到解的符號表示，並存入xx,yy
[xx,yy] = solve(f1,f2,x,y);
px = eval(xx);  %解的數值px(1),px(2)
py = eval(yy);  %解的數值py(1),py(2)
locx = px
locy = py
%%要使用請填入下面這排
%%triposition(24.97154,121.19268,48.54884047180578*0.00000900900901,24.96822,121.19437,118.7161500156535*0.00000900900901,24.96715,121.18766,334.68610409051767*0.00000900900901)
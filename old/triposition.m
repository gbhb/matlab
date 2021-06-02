function [locx,locy] = triposition(xa,ya,da,xb,yb,db,xc,yc,dc)
%              �T�I�w��k                          %
%��J�G
%   1.�ѦҸ`�IA�]xa,ya�^,B(xb,yb),C(xc,yc)
%   2.�w��`�ID(locx,locy)��o�T�I���Z�����O��da,db,dc
%��^�G
%   �]locx�Alocy)���p�⪺�w��`�ID�I����m����
%
syms x y   %f�Ÿ��ܶq
%--------------�D�Ѥ�{��------------------------------------
f1 = 2*x*(xa-xc)+xc^2-xa^2+2*y*(ya-yc)+yc^2-ya^2 == dc^2-da^2;
f2 = 2*x*(xb-xc)+xc^2-xb^2+2*y*(yb-yc)+yc^2-yb^2 == dc^2-db^2;
% ������x,y���Ÿ���{�աA�o��Ѫ��Ÿ���ܡA�æs�Jxx,yy
[xx,yy] = solve(f1,f2,x,y);
px = eval(xx);  %�Ѫ��ƭ�px(1),px(2)
py = eval(yy);  %�Ѫ��ƭ�py(1),py(2)
locx = px
locy = py
%%�n�ϥνж�J�U���o��
%%triposition(24.97154,121.19268,48.54884047180578*0.00000900900901,24.96822,121.19437,118.7161500156535*0.00000900900901,24.96715,121.18766,334.68610409051767*0.00000900900901)
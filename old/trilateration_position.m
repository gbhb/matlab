% ----------------���ΤT��w��k�良���`�I�w��-------------------------------

%{
    clc�R�O�O�ΨӲM���R�O���f�����e�C���޶}�Ҧh�֭����ε{�ǡA�R�O���f�u���@�ӡA
    �ҥHclc�L�׬O�b�}��m���Ϊ̨��m���եήɡAclc�R�O���|�M���R�O���f�����e�C

    clear�R�O�i�H�ΨӲM���u�@�Ŷ������e�CMATLAB���Ӱ򥻪��u�@�Ŷ��A��base���ѡA
    ���~�A���}�@�Ө��m���ɡA�i��|���ͫܦh�u�@�Ŷ��C�C�@�Ө�ƹ����@�Ӥu�@�Ŷ��C
%}

clear;
cx(1) = 2497154;
cy(1) = 12119268;
cx(2) = 2496822;
cy(2) = 12119437;
cx(3) = 2496715;
cy(3) = 12118766;
da=0.4854884047180578;
db=1.187161500156535;
dc=3.3468610409051767;
% �p��w�짤��
[locx,locy] = triposition(cx(1),cy(1),da,cx(2),cy(2),db,cx(3),cy(3),dc);      
plot(locx,locy,'r*');
legend('�ѦҸ`�I','���`�I','�w��`�I','Location','SouthEast');  
title('�T����q�k���w��');

derror = sqrt((locx-mx)^2 + (locy-my)^2);
disp(derror);
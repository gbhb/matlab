data=rand(1,50);
x=1:50;
subplot(2,2,1);
bar(data);
title('������');

subplot(2,2,2);
barh(data);
title('�����');

subplot(2,2,3);
stem(data);
title('�����');

subplot(2,2,4);
pie(data);
title('��ι�');
data=rand(1,50);
x=1:50;
subplot(2,2,1);
bar(data);
title('直條圖');

subplot(2,2,2);
barh(data);
title('橫條圖');

subplot(2,2,3);
stem(data);
title('長桿圖');

subplot(2,2,4);
pie(data);
title('圓形圖');
x=-1:0.01:1;
y=zeros(201);
y=x./(-5);
while (max(x)-min(x))>(10^(-8))
   x=x./(-5);
end
fprintf('�i�J�j��e�̤j�ȡG 1�A�̤p�ȡG-1\n');
fprintf('�i�J�j���̤j�ȡG %d�A�̤p�ȡG%d',max(x),min(x));
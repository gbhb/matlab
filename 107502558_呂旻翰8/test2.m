[x,y] = meshgrid(-4:0.1:4);
z=exp(-0.5.*(x.^2+0.5.*(x-y).^2));
mesh(x,y,z);
grid on;
title('Mesh graph');
colorbar
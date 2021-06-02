a=sprandn(100,100,0.05);
for k =1:size(a,1)
    a(k,k)=1;
end
a_full=full(a);
x=whos('a');
xx=whos('a_full');
fprintf('a memory : %d.\n',x.bytes);
fprintf('a_full memory : %d.\n',xx.bytes);
if xx.bytes>x.bytes
    fprintf('a_full uses more memory.\n');
else
    fprintf('a uses more memory.\n');
end
spy(a)
title('Sparsity pattern of a')
b_full = rand(100,1);
b=sparse(b_full);
f=whos('b');
ff=whos('b_full');
fprintf('b memory : %d.\n',f.bytes);
fprintf('b_full memory : %d.\n',ff.bytes);
if ff.bytes>f.bytes
    fprintf('b_full uses more memory.\n');
else
    fprintf('b uses more memory.\n');
end
tic;
x=b_full./a_full;
t1=toc;
fprintf('Solve a_full*x=b_full spent: %f seconds\n',t1);
tic;
x=b./a;
t2=toc;
fprintf('Solve a*x=b spent: %f seconds\n',t2);
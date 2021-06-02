n = input("Please enter n to calculate its Fibonacci number: ");
sum=0;
v1=1;
v2=1;
k=2; 
if n==1
    sum=1;
end
if n==2
    sum=1;
end
while k<n&&n~=1&&n~=2
sum = v1+v2;
v1 = v2;

v2 = sum;
k=k+1;
end
fprintf('f(%d)=%d',n,sum);
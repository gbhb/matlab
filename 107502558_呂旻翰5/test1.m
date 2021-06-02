n = input("Please input the number to calculate Lucas number.\n ");
sum=0;
v1=2;
v2=1;
k=1;

if n==0
    sum=2;
end
if n==1
    sum=1;
end
if n<0
    msg = 'ERROR_MESSAGE : Lucas number should greater than 0.';
    error(msg)
end
while k<n&&n~=0&&n~=1&&n>0
sum = v1+v2;
v1 = v2;

v2 = sum;
k=k+1;
end
fprintf('The Lucus number : %d',sum);
theta=input('Please input degree: ');
if cosd(theta)>1e-20
fprintf('Tan %d is %f',theta,sind(theta)/cosd(theta));
else
disp('ERROR!')
end
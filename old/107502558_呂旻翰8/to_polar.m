function [r,theta] = to_polar(c)
r=abs(c);
theta=rad2deg(angle(c));

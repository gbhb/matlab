function out = PoissonDistribution(k)
l=1.6;
t=1;
out = exp(-l*t)*((l*t).^k)/FactorialFun(k);
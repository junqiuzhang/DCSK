function x=logistic_map(Nsample)
x(1)=0.35;
mu=2;
for i=2:Nsample
    x(i)=1-mu*x(i-1)^2;
end
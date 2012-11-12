clear;
clc;
close all;
S=gen();
% Mixing matrix
A=[1 2 1 ; 3 4 5; 4 1 2];
x=A*S;
EX=(x*x')./length(x);
%Transform x so the covariance matrix E[xx*xx']=I, using the inverse square
%root.
Q=eigroot(EX);
xx=Q\x;

%Plot the original sources transformed for reference
hold on;
plot(S(1,1:100));
plot(S(2,1:100),'g');
plot(S(3,1:100),'r');
title('Original source signals');
W=makeplots(xx);
    





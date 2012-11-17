%Calculates a single step in the backwards Euler method, using fixed point
%iteration and the maxnorm as a measure of when appropriate accuracy is
%achieved

function [backwardt, i]=beuler(W,xx,step,iterations)
    backwardt=W;
    i=0;
    maxnorm=Inf;
    while (i<iterations && maxnorm> 1e-10)
        [Q,R]=qr(backwardt);
        backward=Q;
        temp=backwardt;
        backwardt=W-step*(gradphi(backward,xx)-backward*...
            ((gradphi(backward,xx))')*backward);
        i=i+1;
        maxnorm=max(max(abs(temp-backwardt)));    
    end
end
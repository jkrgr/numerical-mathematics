function [xx  x]= gen()
%Generating the sources (Doubles indicate tilde, f.eks. xx=x.tilde)
    tt=[0:0.1:100]; 
    vv=sin(1+tt*2/pi);
    w1=[-1:0.01:1-0.01];
    ww=[w1 w1 w1 w1 w1 1];
    uu=cos(1+tt.^2*2/pi);
    SS=[vv;ww;uu];

%Transform sources to mean=0
    myv=mean(vv);
    myu=mean(uu);
    myw=mean(ww);
    v=vv-myv;
    v=v/std(v);
    w=ww-myw;
    w=w/std(w);
    u=uu-myu;
    u=u/std(u);
    S=[v;w;u];
%Covariance matrices
    M=length(tt);
    ES=(S*S')./M;
%Plot the original sources transformed for reference
    subplot(3,1,1);
    plot(0:1000,S(1,:));
    title('Transformed source signals, \mu=0, \sigma^2=1');
    subplot(3,1,2);
    plot(0:1000,S(2,:));
    subplot(3,1,3);
    plot(0:1000,S(3,:));
    
% Mixing matrix
    A=[1 2 1 ; 3 4 5; 4 1 2];
    x=A*S;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    EX=(x*x')./length(x);
%Transform x so the covariance matrix E[xx*xx']=I, using the inverse square
%root.
    Q=eigroot(EX);
    xx=Q\x;
    figure;
    subplot(3,1,1);
    plot(0:1000,xx(1,:));
    title('Transformed microphone signals');
    subplot(3,1,2);
    plot(0:1000,xx(2,:));
    subplot(3,1,3);
    plot(0:1000,xx(3,:));
end
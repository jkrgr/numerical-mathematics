function S = gen()
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

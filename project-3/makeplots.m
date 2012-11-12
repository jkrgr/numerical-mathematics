function W=makeplots(xx)
%Creating I as the starting point for the Euler iterations.
I=eye(3);

steps=[0.3,0.3,0.05,0.05];
projectv=[true,false,true,false];
%As the derivative of gamma approaches 0, the max(phi)
%optimization problem will approach it's solution so we'll use the
%derivative as a measure of how many times to run the euler method.
for k=1:4
gammad=-Inf;
i=0;
W=I;
while (gammad<-1e-22)
    W=feuler(W,xx,projectv(k),steps(k));
    i=i+1;
    gammad=derivegamma(W,xx);
end
disp(W);
fprintf('%s%g, %s%i, %s%i\n','Forward Euler, step=',steps(k),'Projection=',projectv(k),'i=' ,i)
figure;
y=W'*xx;
hold on;
plot(y(1,1:100));
plot(y(2,1:100),'g');
plot(y(3,1:100),'r');
title(['estimated source feuler ',num2str(k)]);
end

for l=1:2
gammad=-Inf;
i=0;
W=I;
test=Inf;
while (test> eps)
    W=beuler(W,xx,steps(l+1),10);
    i=i+1;
    temp=gammad;
    gammad=derivegamma(W,xx);
    test=abs(gammad-temp);
end
W
fprintf('%s%g, %s%i\n','Backward Euler, step=',steps(l+1),'i=' ,i)
figure;
y=W'*xx;
hold on;
plot(y(1,1:100));
plot(y(2,1:100),'g');
plot(y(3,1:100),'r');
title(['estimated source beuler ',num2str(k)]);
end
function W=makeplots(xx)
%Creating I as the starting point for the Euler iterations.
I=eye(3);

steps=[0.1,0.01];
projectv=[true,true];
%As the derivative of gamma approaches 0, the max(phi)
%optimization problem will approach it's solution so we'll use the
%derivative as a measure of how many times to run the euler method.
for k=1
gammad=-Inf;
i=0;
W=I;
while (gammad<-1e-12 && i < 10000)
    W=feuler(W,xx,projectv(k),steps(k));
    i=i+1;
    gammad=derivegamma(W,xx)
end
disp(W);
fprintf('%s%g, %s%i, %s%i\n','Forward Euler, step=',steps(k),'Projection=',projectv(k),'i=' ,i)
y=W'*xx;
figure;
subplot(3,1,1);
plot(0:1000,y(1,:));
title(['estimated source feuler ',num2str(k)]);
subplot(3,1,2);
plot(0:1000,y(2,:));
subplot(3,1,3);
plot(0:1000,y(3,:));

end

% for k=1:2
% gammad=-Inf;
% i=0;
% W=I;
% test=Inf;
% while (test< eps)
%     W=beuler(W,xx,steps(k),10);
%     i=i+1;
%     temp=gammad;
%     gammad=derivegamma(W,xx)
%     test=abs(gammad-temp);
% end
% disp(W);
% fprintf('%s%g, %s%i\n','Backward Euler, step=',steps(k),'i=' ,i)
% y=W'*xx;
% figure;
% subplot(3,1,1);
% plot(0:1000,y(1,:));
% title(['estimated source beuler ',num2str(k+2)]);
% subplot(3,1,2);
% plot(0:1000,y(2,:));
% subplot(3,1,3);
% plot(0:1000,y(3,:));
% end
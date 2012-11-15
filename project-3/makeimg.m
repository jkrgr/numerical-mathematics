function W=makeimg(xx)
%Creating I as the starting point for the Euler iterations.
I=eye(3);

steps=[0.1];
projectv=[true];
%As the derivative of gamma approaches 0, the max(phi)
%optimization problem will approach it's solution so we'll use the
%derivative as a measure of how many times to run the euler method.
for k=1
gammad=-Inf;
i=0;
W=I;
while (gammad<-1e-2 && i < 1000)
    W=feuler(W,xx,projectv(k),steps(k));
    i=i+1;
    gammad=derivegamma(W,xx)
end
disp(W);
fprintf('%s%g, %s%i, %s%i\n','Forward Euler, step=',steps(k),'Projection=',projectv(k),'i=' ,i)
y=W'*xx;
subplot(3,3,7);
image(reshape(y(1,:),333,500));
imcontrast();
subplot(3,3,8);
image(reshape(y(2,:),333,500));
imcontrast();
subplot(3,3,9);
image(reshape(y(3,:),333,500));
imcontrast();
end

% for k=2
% gammad=-Inf;
% i=0;
% W=I;
% test=Inf;
% while (gammad< -eps)
%     W=beuler(W,xx,steps(k+1),10);
%     i=i+1;
%     temp=gammad;
%     gammad=derivegamma(W,xx)
%     test=abs(gammad-temp);
% end
% disp(W);
% fprintf('%s%g, %s%i\n','Backward Euler, step=',steps(k+1),'i=' ,i)
% figure;
% y=W'*xx;
% hold on;
% plot(y(1,1:100));
% plot(y(2,1:100),'g');
% plot(y(3,1:100),'r');
% title(['estimated source beuler ',num2str(k)]);
% end
function W=makeplots(xx)
%Creating I as the starting point for the Euler iterations.
    I=eye(3);
%Creates vectors that decides stepsize and if fuler uses the QR projection
    steps=[0.1,0.02,0.005];
    projectv=[true,true,true];
%As the derivative of gamma approaches 0, the max(phi)
%optimization problem will approach it's solution so we'll use the
%derivative as a measure of how many times to run the euler methods.
    for k=1:3
%Reset difference for each run
        clear difference;
        gammad=-Inf;
        i=0;    
        W=I;
        while (gammad<-1e-12 && i < 10000)
            i=i+1;
            temp=feuler(W,xx,projectv(k),steps(k));
            difference(i)=err(temp,W,xx);
            W=temp;
            gammad=derivegamma(W,xx);
        end
        disp(W);
%Plot the Error agains the number of iterations
%figure;
%plot(0:i-1,difference);
%title('E_k := |\phi(W_k) - \phi(W_{k-1})|')
%xlabel('k')
        fprintf('%s%g, %s%i, %s%i\n','Forward Euler, step=',steps(k),'Projection=',projectv(k),'i=' ,i)
        y=W'*xx;
        figure;
        subplot(3,1,1);
        plot(0:1000,y(1,:));
        title(['Estimated Source Forward Euler Method ',num2str(k)]);
        subplot(3,1,2);
        plot(0:1000,y(2,:));
        subplot(3,1,3);
        plot(0:1000,y(3,:));        
    end
%UNCOMMENT FOR BACKWARD EULER METHOD

    for k=1:3
        clear difference;
        gammad=-Inf;
        i=1;
        W=I;
        difference(i)=Inf;
        while (gammad<-1e-12 && i < 10000)
            i=i+1;
            temp=feuler(W,xx,projectv(k),steps(k));
            difference(i)=err(temp,W,xx);
            W=temp;
            gammad=derivegamma(W,xx);
        end
        disp(W);
        fprintf('%s%g, %s%i\n','Backward Euler, step=',steps(k),'i=' ,i)
        y=W'*xx;
        
%%%ERROR PLOT
%figure;
%plot(0:i-1,difference);
%title('E_k := |\phi(W_k) - \phi(W_{k-1})|')
%xlabel('k');
        figure;
        subplot(3,1,1);
        plot(0:1000,y(1,:));
        title(['Estimated Source Backward Euler Method ',num2str(k+2)]);
        subplot(3,1,2);
        plot(0:1000,y(2,:));
        subplot(3,1,3);
        plot(0:1000,y(3,:));
    end
end
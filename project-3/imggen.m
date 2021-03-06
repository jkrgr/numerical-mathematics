function xx = imggen()
%Generating the sources
%Turn the images into matlab vectors

    spock = double(imread('spock2.jpg'));
    vader = double(imread('vader.jpg'));
    eric = double(imread('eric.jpg'));

    spock=spock(:)';
    vader=vader(:)';
    eric=eric(:)';

%Transform sources to mean=0 and unit variance;
    spockm=mean(spock);
    benderm=mean(eric);
    r2d2m=mean(vader);
    spock=spock-spockm;
    spock=spock/std(spock);
    eric=eric-benderm;
    eric=eric/std(eric);
    vader=vader-r2d2m;
    vader=vader/std(vader);
    S=[spock;eric;vader];
    figure;
    colormap gray;
    subplot(3,3,1);
    imagesc(reshape(spock,333,500));
    
    subplot(3,3,2);
    imagesc(reshape(eric,333,500));
    subplot(3,3,3);
    imagesc(reshape(vader,333,500));
    

% Mixing matrix
%Signal matrix
    %A=[1 2 1 ; 3 4 5; 4 1 2];
%Semi-random matrix
    A= ceil(7*rand(3));
    x=A*S;
    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    EX=(x*x')./length(x);
%Transform x so the covariance matrix E[xx*xx']=I, using the inverse square
%root.

    Q=eigroot(EX);
    xx=Q\x;

    subplot(3,3,4);
    imagesc(reshape(xx(1,:),333,500));
    subplot(3,3,5);
    imagesc(reshape(xx(2,:),333,500));
    subplot(3,3,6);
    imagesc(reshape(xx(3,:),333,500));
end
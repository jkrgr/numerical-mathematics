%Calculates phi, a suitable measure for non-Gaussianity

function phi = phif2(W,xx)
    phi=0;
    n=length(W);
    for i = 1:n
        phi=kurtosis(((W(:,i))')*xx)+phi;
    end
    phi=0.25*phi;
end
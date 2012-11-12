%Calculates phi, a suitable measure for non-Gaussianity

function phi = phif(W,xx)
    phi=0;
    n=length(W);
    for i = 1:n
        phi=phi+mean((((W(:,i))')*xx).^4)-3*n;
    end
    phi=0.25*phi;
end
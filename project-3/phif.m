%Calculates phi, a suitable measure for non-Gaussianity

function phi = phif(W,xx)
    phi=0;
    n=length(W);
    for i = 1:n
        phi=phi+mean((((W(:,i))')*xx).^4);
    end
    phi=phi-3*n;
    phi=0.25*phi;
end
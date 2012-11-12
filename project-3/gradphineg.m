%Calculates the gradient of phi

function Ephi = gradphineg(W,xx)
    y=W'*xx;
    Ephi=-(xx*(y.^3)')/length(xx);
end


    
    

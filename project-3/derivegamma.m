%Calculates the derivative of gamma PS: I know that it's called
%differentiation and not derivation
function gammad = derivegamma(W,xx)
    gammad=trace((gradphi(W,xx))'*(-gradW(W,xx)));
end
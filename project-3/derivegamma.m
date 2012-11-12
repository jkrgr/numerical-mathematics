function gammad = derivegamma(W,xx)
    gammad=trace((gradphi(W,xx))'*(-gradW(W,xx)));
end
function grads = gradW(W,xx)
    grads=(gradphi(W,xx)*(W')-W*(gradphi(W,xx))')*W;
end
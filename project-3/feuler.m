%Takes a single step in the forward Euler Method

function forward = feuler(W,xx,project,step)
    forward=W-step*(gradphi(W,xx)-W*((gradphi(W,xx))')*W);
    if project
        [Q,R]=qr(forward);
        forward=Q;  
    end
end

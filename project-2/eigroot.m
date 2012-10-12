%Finds the root of matrix X

function rooted=eigroot(X)
    [V,D] = eig(X);
    rooted = V*(sqrt(D))*V';
end
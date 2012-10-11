%Builds the A(nxn) matrices
function Q2 = createQ2(n)
Q2=zeros(n);

for i = 1:n
    for j=1:n
        if i==j
            Q2(i,j)=-2;
        elseif abs(i-j)==1
            Q2(i,j)= 1;
        end
    end
end

Q2=eye(n)-(n^2)*Q2;
end

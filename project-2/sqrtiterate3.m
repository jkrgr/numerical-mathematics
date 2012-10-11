function list = sqrtiterate3(A,times)
Y=eye(length(A)); %Identity matrix
root=eigroot(A); %Solution of the root of A
list=zeros(times+1,1); %Creates an empty vector to store max norms
maxnorm=max(max(abs(root-Y)));
list(1,1)=maxnorm;

for x = 1:times
    tempcopy=0.5*(A+inv(Y)); %Iteration for P_k
    Y=0.5*(Y+inv(A)); %Iteration for Q_k
    A=tempcopy;
    maxnorm=max(max(abs(root-A))); %Calculates the error
    list(x+1)=maxnorm; %Adds it to the vector

end

end
function [ Q,U ] = CGS( A )

[m,n]=size(A);

U(1,1)=norm(A((1:m),1));
Q((1:m),1)=A((1:m),1)/U(1,1);
%Q((1:m),1)
for j=2:n
    for k=1:(j-1)
        U(k,j)=(Q((1:m),k))'*A((1:m),j);
    end
    sum=0;
    for k=1:(j-1)
        sum=sum+U(k,j)*Q((1:m),k);
    end
    U(j,j)=norm(A((1:m),j)-sum);
    Q((1:m),j)=(A((1:m),j)-sum)/(U(j,j));
end



function [Q,R] = MGS( A )
[m,n]=size(A);
%for k=1;n
    %a(1:m,1)=A((1:m),k);
%end
Q=A;
for k=1:(n-1)
    R(k,k)=abs(norm(Q(1:m,k)));
    Q((1:m),k)=(1/R(k,k))*Q((1:m),k);
    for j=(k+1):n
        R(k,j)=(Q((1:m),k))'*(Q((1:m),j));
        Q((1:m),j)=Q((1:m),j)-R(k,j)*Q((1:m),k);
    end
end
R(n,n)=abs(norm(Q((1:m),n)));
Q((1:m),n)=Q((1:m),n)/R(n,n);

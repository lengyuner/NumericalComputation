clear all;
TOL=1e-6;
MAX=50;
A=Tn(8);
[nrow,ncol]=size(A);

x0(1:nrow,1)=1:nrow;
x0=x0/norm(x0);
lambda=x0'*A*x0;

x(1:nrow,1)=x0;
x(1+nrow,1)=lambda;

for k=1:MAX
    f_656(1:nrow,1)=A*x(1:nrow,k)-x(nrow+1,k)*x(1:nrow,k);
    f_656(1+nrow,1)=x(1:nrow,k)'*x(1:nrow,k)-1;
    lambda=x(1+nrow,k);
    f1_656(1:nrow,1:ncol)=A-lambda*eye(nrow);
    for i1=1:nrow
        f1_656(i1,1+ncol)=-x(i1,k);
    end
    for j1=1:ncol
        f1_656(1+nrow,j1)=2*x(j1,k);
    end
    f1_656(1+nrow,1+ncol)=0;
%     f_656
%     f1_656
    y=-f1_656\f_656;
    x(1:(1+nrow),k+1)=x(1:(1+nrow),k)+y;
    if(norm(y)<TOL)
        break;
    end
end
X=x(1:nrow,k);
lambda=x(1+nrow,k);
% A*X-lambda*X
c=eig(A);
X'
lambda
c'












    
    
    







































% Tn*x-lambda*x
% x'*x-1
% jacobi

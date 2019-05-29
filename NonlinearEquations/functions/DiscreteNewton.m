function [ x ] = DiscreteNewton( X0 )
MAX=30;
TOL=1e-6;
h=1e-6;

[nrow,ncol]=size(X0);

for i1=1:nrow
    for j1=1:nrow
        H(i1,j1)=h;
    end
end

x(1:2,1)=X0;

for k=1:MAX
    x0=x(1:2,k);
    for i1=1:nrow
        for j1=1:nrow
            x1=x0;
            x1(j1)=x0(j1)+H(i1,j1);
            f1=f_654(x1);
            f0=f_654(x0);
            J(i1,j1)=(f1(i1)-f0(i1))/H(i1,j1);
        end
    end
    J
    y=inv(J)*f0;
    x(1:2,k+1)=x(1:2,k)-y;
    if(norm(y)<TOL)
        break;
    end
end






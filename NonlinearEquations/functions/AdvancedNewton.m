function [ x ] = AdvancedNewton( x0,M )
MAX=30;
TOL=1e-6;

MAX=10;
TOL=1e-6;
x(1:2,1)=x0(1:2,1);

for k=1:MAX
    f1=f1_654(x(1:2,k));
    xm(1:2,1)=x(1:2,k);
    for m=1:M
        f0=f_654(xm(1:2,m));
        y=-f1\f0;
        xm(1:2,m+1)=xm(1:2,m)+y;
    end
    x(1:2,k+1)=xm(1:2,m+1);
    err=x(1:2,k+1)-x(1:2,k);
    if(norm(y)<TOL)
        break;
    end
end






% xk0=xk
% xk,j=x,kj-1-[f1(x k)]^(-1)*f(x k,j-1)
% x k+1=x k,m
function [ x,k ] = SecantMethod( x0 )
TOL=1e-6;
MAX=1000;


x(1)=x0;
k=1;
x(2)=x(k)-(x(k)*x(k)*x(k)-x(k)*x(k)-8*x(k)+12)/(3*x(k)*x(k)-2*x(k)-8);





for k=2:MAX
    x(k+1)=x(k)-(x(k)-x(k-1))*f_651(x(k))/(f_651(x(k))-f_651(x(k-1)));
    
    if(abs(x(k+1)-x(k))<TOL)
        break;
    end
end
k=k+1;
%           f(x,y)
%           (x+3)(y*y-7)+18
%           sin(y*exp(x)-1)

%           f1(x,y)
%           y*y-7                       (x+3)(2*y)
%           cos(y*exp(x)-1)*y*exp(x)    cos(y*exp(x)-1)*exp(x)



% function [ x ] = Newton2( x0,y0 )
function [ x ] = Newton2( x0 )

MAX=10;
TOL=1e-6;

x(1:2,1)=x0(1:2,1);
% x(1,1)=x0;
% x(2,1)=y0;



for k=1:MAX
    
%     f0(1,1)=(x0+3)*(y0*y0-7)+18;
%     f0(2,1)=sin(y0*exp(x0)-1);
%     
%     f1(1,1)=y0*y0-7; 
%     f1(1,2)=(x0+3)*(2*y0);
%     
%     f1(2,1)=cos(y0*exp(x0)-1)*y0*exp(x0);
%     f1(2,2)=cos(y0*exp(x0)-1)*exp(x0);
    f0=f_653(x(1:2,k));
    f1=f1_653(x(1:2,k));
    
    y=-f1\f0;
    x(1:2,k+1)=x(1:2,k)+y;
    if(norm(y)<TOL)
        break;
    end
    
%     x0=x(1,k+1);
%     y0=x(2,k+1);
end



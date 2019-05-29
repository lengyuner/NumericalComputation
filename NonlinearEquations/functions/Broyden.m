function [ x ] = Broyden( x0 )
% x为列向量
TOL=1e-6;



MAX=100;

x(1:2,1)=x0(1:2,1);
% x0=x0(1,1);
% y0=x0(2,1);


A=f1_653(x0(1:2,1));
[nrow,ncol]=size(A);

v=f_653(x0(1:2,1));

% A(1,1)=y0*y0-7; 
% A(1,2)=(x0+3)*(2*y0);
% A(2,1)=cos(y0*exp(x0)-1)*y0*exp(x0);
% A(2,2)=cos(y0*exp(x0)-1)*exp(x0);

% v(1,1)=(x0+3)*(y0*y0-7)+18;
% v(2,1)=sin(y0*exp(x0)-1);

H=inv(A);
s=-H*v;
x(1:2,2)=x(1:2,1)+s;

for k=2:MAX
    w=v;
%     v(1,1)=(x0+3)*(y0*y0-7)+18;
%     v(2,1)=sin(y0*exp(x0)-1);
    v=f_653(x(1:2,k));
    y=v-w;
    z=-H*y;
    p=-s'*z;
    if(p==0)
        disp('Method Failed');
        break;
    end
    C=p*eye(ncol)+(s+z)*s';
    H=(1/p)*C*H;
    s=-H*v;
    x(1:2,k+1)=x(1:2,k)+s;
    if(norm(s)<TOL)
        break;
    end
end

    
    
    
    
    
    
    
    
    
    
    
    





end


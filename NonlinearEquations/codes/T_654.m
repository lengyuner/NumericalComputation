%	x+y-3=0
%	x*x+y*y-9=0

%	1 1
%	2*x 2*y


x0(1,1)=2;
x0(2,1)=4;
TOL=1e-6;
MAX=100;

x(1:2,1)=x0(1:2,1);

A=f1_654(x0(1:2,1));
[nrow,ncol]=size(A);

v=f_654(x0(1:2,1));

H=inv(A);
s=-H*v;
x(1:2,2)=x(1:2,1)+s;

for k=2:MAX
    w=v;
    v=f_654(x(1:2,k));
    y=v-w;
    z=-H*y;
    p=-s'*z;
    if(p==0)
        disp('Method Failed');
        break;
    end
    C=p*eye(ncol)+(s+z)*s';
    H=(1/p)*C*H;
     disp('B');k
    inv(H)
    s=-H*v;
    x(1:2,k+1)=x(1:2,k)+s;
%     s
    if(norm(s)<TOL)
        break;
    end
end

x
plot(x','-*')
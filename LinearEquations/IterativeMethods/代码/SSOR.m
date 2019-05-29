function K = SSOR( A,b,x0,TOL,MAX,w )
ncol=length(b);
X([1:ncol],1)=1;
D=diag(diag(A));
L=tril(A,-1);
Q=(D+w*L)*((1/16)*D)*(D+w*L)';%E=((1/2)*D)+w*L*((1/8)*D);%E1=inv(E);
Q1=inv(Q);
r0=A*x0-b;
z0=Q1*r0;
p0=-z0;

for k=1:MAX
    a=(r0'*z0)/(p0'*A*p0);
    x=x0+a*p0;
    r=r0+a*A*p0;
    %r
    z=Q1*r;
    b=(r'*z)/(r0'*z0);
    p=-z+b*p0;
    
    err=abs(norm(x-X));
    x0=x;
    %x'
    if(err<TOL)
        break;
    end
    x0=x;
    r0=r;
    p0=p;
    z0=z;
end
K=k;
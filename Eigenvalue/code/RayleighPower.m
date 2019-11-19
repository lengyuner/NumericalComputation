function  [b,u,BK0,UK0]   = RayleighPower( A,u0,MAX )

[nrow,ncol]=size(A);
%ncol=size(A,1);
u0(1:ncol,1)=1;
%u0(1,1)=2;

[V,D]=eig(A);
d=D(nrow,ncol);
Vn=V(1:nrow,ncol);
K0=1;


TOL=1e-9;
% MAX=100000;
%[nrow,ncol]=size(A);
k=1;
u=u0;
b=norm(u);
v=u/b;
m0=(v'*A*v)/(v'*v);
for k=1:MAX%(k<=MAX)
    u=A*v;
    b=norm(u);
    v=u/b;
    if(b==0)
        disp('eifenvecter');
        %u
        return%break;
    end
    m1=(v'*A*v)/(v'*v);
    
    
%     ERR=abs(m0-m1);
    ERR=sqrt(abs(1-(u'*Vn)*(u'*Vn)));
    
    m0=m1;
    if(ERR<TOL)
        %b
        %u
        %return%break;
    end
    if(mod(k,10)==0)
        BK0(K0)=b;
        UK0(K0)=ERR;
        K0=K0+1;
    end
    %k=k+1;
%     if(mod(k,10000)==0)
%         m1
%     end
end





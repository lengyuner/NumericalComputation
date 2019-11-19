function  [b,u,BK0,UK0]   = SimplePower( A,u0,MAX )

[nrow,ncol]=size(A);
% % %ncol=size(A,1);
% % u0(1:ncol,1)=1;
% % %u0(1,1)=2;

[V,D]=eig(A);
d=D(nrow,ncol);
Vn=V(1:nrow,ncol);
K0=1;

TOL=1e-9;
%MAX=100000;
%[nrow,ncol]=size(A);

u=u0;
b=max(u);
u=u/b;


for k=1:MAX%(k<=MAX)
    v=A*u;
    b=max(v);
    if(b==0)
        disp('eifenvecter');
        u;
        return
    end
    w=v/b;
    ERR=sqrt(1-(u'*Vn)*(u'*Vn));
    %ERR=norm(u-w);
    u=w;
    if(ERR<TOL)
        %b
        %u
        %return%
        %break;
    end
    %k=k+1;
    if(mod(k,10)==0)
        BK0(K0)=b;
        UK0(K0)=ERR;
        K0=K0+1;
    end
end




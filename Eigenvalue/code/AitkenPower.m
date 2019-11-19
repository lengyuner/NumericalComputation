function  [b,u,BK0,UK0]   = AitkenPower( A,u0,MAX )

[nrow,ncol]=size(A);
%ncol=size(A,1);
% u0(1:ncol,1)=1;
%u0(1,1)=2;


[V,D]=eig(A);
d=D(nrow,ncol);
Vn=V(1:nrow,ncol);
K0=1;



TOL=1e-9;
% MAX=100000;
%[nrow,ncol]=size(A);
%step1
k=1;
u=u0;
b0=0;
b1=0;
%step2
b=max(u);

u=u/b;
for k=1:MAX%(k<=MAX)
    v=A*u;
    %step6
    b=max(v);
    b2=b0-(b1-b0)*(b1-b0)/(b-2*b1+b0);
    
    
    if(b==0)
        disp('eifenvecter');
        u
        return%break;
    end
    w=v/b;
    ;%ERR=norm(u-w);
    u=w;
    ERR=sqrt(abs(1-(u'*Vn)*(u'*Vn)));
    %step9
    if(ERR<TOL&&k>=4)
        %break;
    end
    %step10
    %k=k+1;
    b0=b1;
    b1=b;
%     %k=k+1;
%     if(mod(k,10000)==0)
%         b
%     end
    if(mod(k,10)==0)
        BK0(K0)=b2;
        UK0(K0)=ERR;
        K0=K0+1;
    end
end





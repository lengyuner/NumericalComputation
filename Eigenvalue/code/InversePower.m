function [ b,v,k,ERR ] = InversePower( A,q )

[nrow,ncol]=size(A);
v(1:ncol,1)=1;
% v(1,1)=2;
TOL=1e-5;
E=eye(ncol);
MAX=10;


% 
% d=eig(A);
% mi=d(1)-q;
% k_mi=1;
% for k=1:ncol
%     if(abs(d(k)-q)<abs(mi))
%         mi=d(k)-q;
%         k_mi=k;
%     end
% end


% q=v'*A*v/(v'*v);
c1=0;
for k1=1:ncol
    if(abs(v(k1))>abs(c1))
        c1=v(k1);
    end
end
b=c1;
    
%b=max(abs(v));
v=v/b;
for k=1:MAX
    r=rank(A-q*E);
    if(r>=nrow)
        u=(A-q*E)\v;
%         disp('norm((A-q*E)*u-v)');
%         norm((A-q*E)*u-v)
    else
        b;
        v';
        ERR(k)=0;
        break;
    end
    c2=0;
    for k1=1:ncol
        if(abs(u(k1))>abs(c2))
            c2=u(k1);
        end
    end
    u';
    b=c2;
% %     disp('(1/b)+q');
% %     (1/b)+q
% %     %b=max(abs(u));
% %     disp('(err');
    ERR(k)=1/b+q;
    %ERR(k)=abs(b-d(k_mi));
    v=(1/b)*u;
    
    if(ERR(k)<TOL)
        b=(1/b)+q;
        disp('err---------------------------------');
        break;
    end
end
% if(ERR(k)>=TOL)
%     b=(1/b)+q;
% end
b=(1/b)+q;
    

ERR=abs(ERR-ERR(k));

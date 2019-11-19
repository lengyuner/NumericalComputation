function [ D ] = sametime( A )

[nrow,ncol]=size(A);
MAX=10000;
TOL=1e-7;

randomA=rand(ncol);
[Q,R]=qr(randomA);

m=2;
D0=eye(3);

V=R(1:nrow,1:m);
%size(V')
for k=1:MAX
    U=A*V;
    B=V'*U;
%     if(k<3)
%         k
%         disp('V')
%         size(V)
%         disp('U')
%         size(U)
%         disp('B')
%         size(B)
%     end
    [W0,D0]=eig(B);
    
    D1=flip(D0,1);
    D=flip(D1,2);
    
    
    W1=flip(W0,1);
    W=flip(W1,2);
%     if(k<3)
%         disp('W')
%         size(W)
%         disp('D')
%         size(D)
%     end
    
    
    
    UW=U*W;
%     if(k<3)
%         disp('UW')
%         size(UW)
%     end
    [V1,R]=qr(UW);
    V=V1(1:nrow,1:m);
%     if(k<3)
%         disp('V')
%         size(V)
%         
%         
%     end
    
    ERR=norm(D-D0);
    if(ERR<TOL)
        break;
    end
    D0=D;
    
end

    
    
    
%     c=eig(B);
%     
%     [c1,c2]=sort(abs(c));
%     c(c2(1))
    
    
    
    
    
    
    
    
end


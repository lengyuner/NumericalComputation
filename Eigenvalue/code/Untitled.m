clear all;


A=Tn(30);
D=MaxJacobi( A );
d=diag(D);
d1=sort(d')
e=eig(A);
sort(e')











% A=Tn(5);
% 
% [nrow,ncol]=size(A);
% MAX=1000;
% TOL=1e-7;
% 
% randomA=rand(ncol);
% [Q,R]=qr(randomA);
% 
% m=2;
% D0=eye(3);
% 
% V=R(1:nrow,1:m);
% %size(V')




% 
% U=A*V;
% B=V'*U;
% 
% 
% disp('V')
% size(V)
% disp('U')
% size(U)
% disp('B')
% size(B)
% 
% [W0,D0]=eig(B);
% D0
% D1=flip(D0,1);
% D=flip(D1,2);
% D
% 
% W1=flip(W0,1);
% W=flip(W1,2);
% 
% disp('W')
% size(W)
% disp('D')
% size(D)
% 
% 
% UW=U*W
% 
% disp('UW')
% size(UW)
%     
% [V,R]=qr(UW)
% k=1;
% if(k<3)
%     disp('V')
%     size(V)
%     V
% 
% end
% 
% ERR=norm(D-D0);
% if(ERR<TOL)
%     break;
% end
% D0=D;

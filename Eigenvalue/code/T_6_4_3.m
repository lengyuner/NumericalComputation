% % %幂法和降维技巧
% clear all;
% A=Tn(100);
% [m,n]=size(A);
% c=eig(A);
% c(n-1:n)
% u0(1:n,1)=1;
% u0(1,1)=2;
% MAX=10000;
% [b1,u,BK0,UK0]=SimplePower( A,u0,MAX );
% b1
% b1-c(n)
% (u(1:10))'
% 
% B=jiangwei( A );
% clear u0;
% u0(1:n-1,1)=1;
% [b2,u,BK0,UK0]=SimplePower( B,u0,MAX );
% b2
% b2-c(n-1)
% (u(1:10))'
% 





% % % %同时迭代法
% % % %同时迭代法
% % %同时迭代法
clear all;
A=Tn(100);
[nrow,ncol]=size(A);
d1=sametime( A )
%c1=sort(diag(D1))

D2=diag(eig(A));
d2=D2((nrow-1):nrow,(ncol-1):ncol)
d1(1,1)
d1(1,1)-d2(2,2)
d1(2,2)-d2(1,1)

d1(1,1)
d1(1,1)-d2(1,1)
d1(2,2)-d2(2,2)






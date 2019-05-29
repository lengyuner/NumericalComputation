clear all;
%A=10*randn(10);
%A=[3 0 0;2 3 0; 1 2 3];
%A=[1 3; 1 3; 1 1; 1 1]
%Householder(A);
%[m,n]=size(A)
k=1;
%A(1:n,k)'*A(1:n,k)


A1=rand(30);
   %A=A1(1:30,1:29);
   A=A1;
%A=[1 3; 1 3; 1 1; 1 1]
[Q,U]=Householder(A);
[m,n]=size(A);
%Q000000=Q;
%U000000=U
E000=Q'*Q;
E0=E000(m-3:m,n-3:n)
B=Q*U-A;
B(m-3:m,n-3:n)
%E(1:9,1:9)
%size(Q);
%size(U);

%B(1:9,1:9)
%norm(B)

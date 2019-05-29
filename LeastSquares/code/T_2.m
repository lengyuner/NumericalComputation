clear all;
K0=1;
for K=100%:10:50
    clear A;
    
    tim=clock;
    
    A=Ann1(K);
    [nrow,ncol]=size(A);
    clear b;
    b(1)=1+1/nrow;
    for k=2:(ncol-2)
        b(k)=k/nrow;
    end
    b(nrow-1)=1+(nrow-1)/nrow;
    b(nrow)=0;
    b=b';
    %clear X;
    X(1:ncol)=1;
    clear B;
    B=rand(nrow);
    B=2*pi*(B-0.5);

    for k=1:(nrow*nrow)
        clear G;
        G=eye(nrow);
        %size(G)
        i=floor(nrow*rand(1))+1;
        j=floor(nrow*rand(1))+1;
        c=cos(B(i,j));
        s=sin(B(i,j));
        G(i,i)=c;
        G(i,j)=s;
        G(j,i)=-s;
        G(j,j)=c;
        G;
        %G(1:9,1:9)
        %A

        A=G*A;
        b=G*b;
    end
    G=eye(nrow);
    i=floor(nrow*rand(1))+1;
    c=cos(B(i,nrow));
    s=sin(B(i,nrow));G(i,i)=c;G(i,nrow)=s;G(nrow,i)=-s;G(nrow,nrow)=c;
    A=G*A;
    b=G*b;

    %A
    [m,n]=size(A);
%     A;
%     clear Q;
%     clear R;
    
    
    %[Q_G,R_G]=Givens(A);
    %y_G=Q_G\b;
    t_F=clock;
    x_F=(A'*A)\(A'*b);
    et_F(K0)=etime(clock,t_F);
    ERR_F(K0)=norm(x_F'-X);
    
    t_MGS=clock;
    [Q_MGS,R_MGS]=MGS(A);
    y_MGS=Q_MGS\b;
    x_MGS=R_MGS\y_MGS;
    et_MGS(K0)=etime(clock,t_MGS);
    ERR_MGS(K0)=norm(x_MGS'-X);
    
    t_H=clock;
    [Q_H,R_H]=Householder(A);
    y_H=Q_H\b;
    x_H=R_H\y_H;
    et_H(K0)=etime(clock,t_H);
    ERR_H(K0)=norm(x_H'-X);
    
    t_G=clock;
    [Q_G,R_G]=Givens(A);
    y_G=Q_G\b;
    x_G=R_G\y_G;
    et_G(K0)=etime(clock,t_G);
    ERR_G(K0)=norm(x_G'-X);
    
    
    %Q1=Q(1:m-1,1:m-1);
    %A1=A(1:m-1,1:n-1);
    %Q1'*Q1
    
    %R1=R(1:m-1,1:n-1);
    %Q'*Q
    %T=Q*R-A
    
    %t(K0)=etime(clock,tim);
    K0=K0+1;
end
% % % x_G'-X
% % % et_F
% % % et_MGS
% % % et_H
% % % et_G
% % % 
% % % ERR_F
% % % ERR_MGS
% % % ERR_H
% % % ERR_G
% 
% 
% T(1:4,1:3)
% T=rand(4)-A;
% C=T(1:4,1:3);
% C
% [Q,R]=Givens(C)
% Q*R-C
% 
% clear all;
% A=[2 -1; -1 2; 0 -1];
% [Q,R]=Givens(A);
% Q*R-A
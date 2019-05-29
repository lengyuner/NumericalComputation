clear all;
K0=1;
Kn=300;
for K=K0:Kn

    %A=[1 2 3; 1 1 2; 1 0 1];
    A=rand(25);
    E=eye(25);
%     A1=A+power(10,-15)*E;
    
    t_CGS=clock;
    [Q_CGS,U_CGS]=CGS(A);
    et_CGS(K-K0+1)=etime(clock,t_CGS);
    d_CGS(K-K0+1)=norm(Q_CGS'*Q_CGS-E);
    
    d1_CGS(K-K0+1)=norm(Q_CGS*U_CGS-A);
% %     
% %     [Q1_CGS,U1_CGS]=CGS(A1);

%     Q(1:3,1:3)
%     U(1:3,1:3)
%     B_CGS=Q_CGS*U_CGS-A;
%     %B_CGS(1:9,1:9)
%     norm(B_CGS)

    t_MGS=clock;
    [Q_MGS,U_MGS]=MGS(A);
    et_MGS(K-K0+1)=etime(clock,t_MGS);
    d_MGS(K-K0+1)=norm(Q_MGS'*Q_MGS-E);
    d1_MGS(K-K0+1)=norm(Q_MGS*U_MGS-A);
%     
%     [Q1_MGS,U1_MGS]=MGS(A1);
%     d1_MGS(K-K0+1)=norm(Q_MGS-Q1_MGS);
%     
    
    B_MGS=Q_MGS*U_MGS-A;
    %B_MGS(1:9,1:9)
    norm(B_MGS);

    t_H=clock;
    [Q_H,U_H]=Householder(A);
    et_H(K-K0+1)=etime(clock,t_H);
    d_H(K-K0+1)=norm(Q_H'*Q_H-E);
    
    D00=Q_H*U_H-A;
    
    D000=D00(1:24,1:24)
    d1_H(K-K0+1)=norm(D000);
%     d1_H(K-K0+1)=norm(Q_H*U_H-A);
% 
%     [Q1_H,U1_H]=Householder(A1);
%     d1_H(K-K0+1)=norm(Q_H-Q1_H);
%     
    
    
    t_G=clock;
    [Q_G,U_G]=Householder(A);
    et_G(K-K0+1)=etime(clock,t_G);
    d_G(K-K0+1)=norm(Q_G'*Q_G-E);
    d1_G(K-K0+1)=norm(Q_CGS*U_CGS-A);
end

strl=['D:\MATLAB\2\21\CGS'];
plot(K0:Kn,et_CGS,'-.k*');
saveas(gca,[strl],'jpg');
close

strl=['D:\MATLAB\2\21\MGS'];
plot(K0:Kn,et_MGS,'-.k*');
saveas(gca,[strl],'jpg');
close

strl=['D:\MATLAB\2\21\H'];
plot(K0:Kn,et_H,'-.k*');
saveas(gca,[strl],'jpg');
close

strl=['D:\MATLAB\2\21\G'];
plot(K0:Kn,et_G,'-.k*');
saveas(gca,[strl],'jpg');
close



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

strl=['D:\MATLAB\2\21\d_CGS'];
plot(K0:Kn,d_CGS,'-.k*');
saveas(gca,[strl],'jpg');
close

strl=['D:\MATLAB\2\21\d_MGS'];
plot(K0:Kn,d_MGS,'-.k*');
saveas(gca,[strl],'jpg');
close

strl=['D:\MATLAB\2\21\d_H'];
plot(K0:Kn,d_H,'-.k*');
saveas(gca,[strl],'jpg');
close

strl=['D:\MATLAB\2\21\d_G'];
plot(K0:Kn,d_G,'-.k*');
saveas(gca,[strl],'jpg');
close

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
strl=['D:\MATLAB\2\21\d1_CGS'];
plot(K0:Kn,d1_CGS,'-.k*');
saveas(gca,[strl],'jpg');
close

strl=['D:\MATLAB\2\21\d1_MGS'];
plot(K0:Kn,d1_MGS,'-.k*');
saveas(gca,[strl],'jpg');
close

strl=['D:\MATLAB\2\21\d1_H'];
plot(K0:Kn,d1_H,'-.k*');
saveas(gca,[strl],'jpg');
close

strl=['D:\MATLAB\2\21\d1_G'];
plot(K0:Kn,d1_G,'-.k*');
saveas(gca,[strl],'jpg');
close

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mean(et_CGS)
mean(et_MGS)
mean(et_H)
mean(et_G)
% % plot(K0:Kn,et_H,'-.k*')
% % mean(et_H)
%Q*U-A
%B=Q*U-A;
%B(1:9,1:9)

%[Q,R]=MGS(A);
%Q*R-A
%Q*R-A
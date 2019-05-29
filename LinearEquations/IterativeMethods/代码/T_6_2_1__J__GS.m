%jacobi
clear all;
disp('默认最多迭代次数为1000');
n=1000;
TOL=1e-6;
%  
choice=input('请选择停机标准. 1: 残量, 2: 相邻误差, 3:后验误差    ');
for K=3:10
    clear A;
    A=An(K);
    clear ncol;
    ncol=size(A,1);
    clear N;
    N=ncol;
    clear X;
    X([1:ncol],1)=1;
    clear b;
    b=A*X;
    clear x1;
    for i=1:N
        x1(i)=0;
    end
    clear x0;
    x0=x1';
    
    [J_K(K),J_ERR(K)]=KofJ(A,b,x0,1e-6,1000,choice);
    %J_ERR(K)=err(k);
    [GS_K(K),GS_ERR(K)]=KofGS(A,b,x0,1e-6,1000,choice);
    %GS_ERR(K)=err(k);
end
strl1=['D:\MATLAB\621\k3'];
plot(3:K,J_K(3:K),3:K,GS_K(3:K))
%plot(3:K,J_ERR(3:K),3:K,GS_ERR(3:K));
saveas(gca,[strl1],'jpg');
close




















%strl2=['D:\MATLAB\621\err1'];
%b=plot(3:K,J_ERR(3:K),3:K,GS_ERR(3:K));
%saveas(b,[strl2],'jpg');
%plot(K,J_K)


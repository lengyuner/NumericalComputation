function k1=KofSOR(A,b,x0,w,TOL,M)
%M=1000;
%M为最大迭代次数
ncol=length(b);
X([1:ncol],1)=1;
if(w<=0 || w>=2)
    %k1=M;
    error;
    return;
end
D=diag(diag(A)); %求A的对角矩阵
L=-tril(A,-1); %求A的下三角阵
U=-triu(A,1); %求A的上三角阵
B=inv(D-L*w)*((1-w)*D+w*U);
f=w*inv((D-L*w))*b;
x=B*x0+f;
n=1; %迭代次数
while norm(x-X)>=TOL
    x0=x;
    x=B*x0+f;
    %n
    %x'
    n=n+1;
    if(n>=M)
        fprintf('>MAX');
        %fprintf('Warning: 迭代次数太多，可能不收敛！');
        return;
    end
    k1=n;
end 
%x'


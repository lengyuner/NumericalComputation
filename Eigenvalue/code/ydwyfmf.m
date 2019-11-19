function [x,r,k]=ydwyfmf(A,x0,r0,eps,M)
%带原点移位的反幂法求按模最小特征值和特征向量
%r是按模最小特征值，x为相应特征向量
%A目标矩阵；x0为初始向量；r0为某特征值的近似值
%eps为误差限；M为迭代的最大次数
if nargin==2
    r0= 0;     %若不指定，则指定其为0
    eps= 1.0e-6;%若未指定，则取默认值
    M = 10000; %若未指定，则取默认值
elseif nargin ==3
    eps= 1.0e-6;%若未指定，则取默认值
    M = 10000; %若未指定，则取默认值
elseif nargin ==3
    M = 10000; %若未指定，则取默认值
elseif nargin<2
    error('参数不足');
    return
end
[n,m]=size(A);
%当方程组行与列的维数不相等时，停止计算，并输出出错信息
if n~=m
    error('矩阵A行数和列数必须相等!');
    return;
end
I=eye(n);
B=zeros(n,n);
B=A-r0*I;
k=0;
u=1;
tol=1;
x=x0;
a = max(abs(x));
while tol>=eps
    y = x/a;
    [L,U,x]=Lu_x(B,y);    %迭代步数
    a = max(abs(x));
    b = a;
    tol = abs((1/b)-(1/u));%前后两步迭代结果的误差
    u = b;
    k = k+1;
    if(k>=M)
        disp('Warning: 迭代次数太多，输出失败！');
        return;
    end
end
r = r0 +(1/b);
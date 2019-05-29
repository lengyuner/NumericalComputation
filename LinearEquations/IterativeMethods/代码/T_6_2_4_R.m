clear all;
A=An(30);
ncol=size(A,1);
X([1:ncol],1)=1;
b=A*X;
TOL=1e-6;
m=3;%循环指标
MAX=1000;

x0([1:ncol],1)=0;
%Richardson( A,b,x0,TOL,MAX,2 );

%strl_R=['D:\MATLAB\pic\R\pic_R_m='];
for m=1:20
    k(m)=Richardson( A,b,x0,TOL,MAX,m );
end
l=k(2:20);
strl1=['D:\MATLAB\624\k_An(30)'];
plot(2:20,k(2:20));
saveas(gca,[strl1],'jpg');
close


%先把 循环指标 m 固定，看误差曲线和残差曲线的变化
%循环指标 m 变化时，迭代次数的变化
%循环指标 m 变化时，误差曲线和残差曲线的变化
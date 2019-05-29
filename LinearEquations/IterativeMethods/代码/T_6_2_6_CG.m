clear all;
A=An(30);
ncol=size(A,1);
N=ncol;
X([1:ncol],1)=1;
b=A*X;
x0([1:ncol],1)=0;
TOL=1e-6;
MAX=1000;
err30=ConjurateGraient(A,b,x0,TOL,MAX);


A=An(31);
ncol=size(A,1);
N=ncol;
X([1:ncol],1)=1;
b=A*X;
x0([1:ncol],1)=0;
TOL=1e-6;
MAX=1000;
err312=ConjurateGraient(A,b,x0,TOL,MAX);


A=An(32);
ncol=size(A,1);
N=ncol;
X([1:ncol],1)=1;
b=A*X;
x0([1:ncol],1)=0;
TOL=1e-6;
MAX=1000;
err322=ConjurateGraient(A,b,x0,TOL,MAX);

len=length(err30);
length(err312);
err31=err312(1:len);
err32=err322(1:len);
plot(1:len,-log(err30),1:len,-log(err31));
%绿的是31奇数
strl='D:\MATLAB\626\CG_n=30_31真实误差';
saveas(gca,strl,'jpg');
close;




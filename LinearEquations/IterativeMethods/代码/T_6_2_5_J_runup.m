clear all;
A=An(3);
ncol=size(A,1);
N=ncol;
X([1:ncol],1)=1;
b=A*X;
x0(1:ncol,1)=0;
TOL=1e-5;
n=sqrt(ncol);

%Ñ­»·Ö¸±ê
m=5;
%Jacobi_run_up( A,b,TOL,m );

for m=1:10
    k(m)= Jacobi_run_up( A,b,TOL,m );
end


%[xy,yx]=meshgrid(1:n);
%strl_J_runup=['D:\MATLAB\pic\J\pic_J_A(30)_'];
%k1=1;
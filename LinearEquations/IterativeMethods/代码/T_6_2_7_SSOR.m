clear all;
A=An(30);
ncol=size(A,1);
X([1:ncol],1)=1;
x0([1:ncol],1)=0;
b=A*X;
TOL=1e-6;
MAX=1000;






w=1.2:0.05:1.9;    
for k=1:length(w)
    K(k)=SSOR( A,b,x0,TOL,MAX,w(k) );
end
plot(w,K)
axis( [ 1.1 2 18 28 ] )
strl='D:\MATLAB\627\SSOR';
saveas(gca,strl,'jpg')
close

%strl='D:\MATLAB\626\CG_n=30_31’Ê µŒÛ≤Ó';
%saveas(gca,strl,'jpg');
%close;


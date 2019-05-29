%先做出一个 n*n 矩阵的二维三维图像
%做出一种方法 对应的 误差曲线和残量曲线
%做出三种方法合在一起的误差曲线和残量曲线（采用半对数坐标系）
%支出迭代次数和矩阵阶数的关系
%

%把 n^2 向量化为一个方阵

clear all;
A=An(30);
ncol=size(A,1);
N=ncol;
X([1:ncol],1)=1;
b=A*X;
x0(1:ncol,1)=0;
%x0=x0';%变成列矩阵
TOL=1e-5;
n=sqrt(ncol);

[xy,yx]=meshgrid(1:n);
strl_J=['D:\MATLAB\623\J\pic_J_A(30)_'];
strl_GS=['D:\MATLAB\623\GS\pic_GS_A(30)_'];
strl_SOR=['D:\MATLAB\623\SOR\pic_SOR_A(30)_'];
k1=1;

MAX=500;%最大迭代次数


%%%%%%%%%%%%%%%%%
%    Jacobi
%%%%%%%%%%%%%%%%%
for k=1:MAX
	for j=1:N
        x(j)=(b(j)-A(j,[1:j-1,j+1:N])*x0([1:j-1,j+1:N]))/A(j,j);
    end
    ERR(1:ncol,k)=x';
    err=abs(norm(x'-X));
    x0=x';  
    if(mod(k-1,20)==0)
        Z=reshape(-log(x),n,n);
        %figure;
        a=surf(xy,yx,Z);
        %a=surf(xy,yx,Z);
        axis([1 n 1 n 0 10 ]);
        saveas(a,[strl_J,num2str(k1)],'jpg');
        close;
        k1=k1+1;%imwrite (a,[strl num2str(k) '.jpg']);
    end
    if(err<TOL)
        break;
    end
end
K=k;


%%%%%%%%%%%%
%     GS
%%%%%%%%%%%%
clear x;
k1=1;
for k=1:MAX
    for j=1:N
        if j==1
            x(1)=(b(1)-A(1,2:N)*x0(2:N))/A(1,1);
        elseif j==N
            x(N)=(b(N)-A(N,1:N-1)*(x(1:N-1))')/A(N,N);
        else 
            x(j)=(b(j)-A(j,1:j-1)*(x(1:j-1)')-A(j,j+1:N)*x0(j+1:N))/A(j,j);
        end
    end
    %
    ERR(1:ncol,k)=x';
    err=abs(norm(x'-X));
    x0=x';  
    if(mod(k-1,20)==0)
        Z=reshape(-log(x),n,n);%figure;
        a=surf(xy,yx,Z);
        axis([ 1 n 1 n 0 1 ]);
        saveas(a,[strl_GS,num2str(k1)],'jpg');
        close;
        k1=k1+1;
    end
    if(err<TOL)
        break;
    end
end


%%%%%%%%%%%%%
%      SOR
%%%%%%%%%%%%%
clear x;
w=1.819;
k1=1;

D=diag(diag(A)); %求A的对角矩阵
L=-tril(A,-1); %求A的下三角阵
U=-triu(A,1); %求A的上三角阵
B=inv(D-L*w)*((1-w)*D+w*U);
f=w*inv((D-L*w))*b;

for k=1:MAX
    x=B*x0+f;
    x=x';
    ERR(1:ncol,k)=x';
    err=abs(norm(x'-X));
    x0=x';  
    if(mod(k-1,5)==0)
        Z=reshape(-log(x),n,n);%figure;
        a=surf(xy,yx,Z);
        axis([1 n 1 n 0 10 ]);
        saveas(a,[strl_SOR,num2str(k1)],'jpg');
        close;
        k1=k1+1;
    end
    if(err<TOL)
        break;
    end
end








    %z=ERR(1:ncol,k);
    %Z=reshape(z,n,n);
    %figure
    %a(1)=mesh(xy,yx,Z);
    





%plot3(xy,xy,Y)


%for k=1:K
    %y=ERR(1:ncol,10);
    %Y=reshape(y,n,n);
    %plot3(Y);
    %PofERROR=plot(y);
    %savas
%end




%%%%%for k=1:ncol
 %   xy(k)=mod(k,n);
  %  if(xy(k)==0)
   %     xy(k)=n;
  %  end
 %   yx(k)=(k-xy(k))/n+1;
%end
%xy
%yx
%Y=reshape(X,n,n);
%Y;
%figure
%plot3(xy,yx,X)

%Z=reshape(X,n,n);
%[x,y]=meshgrid(1:n);
%mesh(x,y,Z)
%n=10;

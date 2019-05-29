clear all;
%两点序列割线法
MAX=20;
TOL=1e-6;
x0(1,1)=2;
x0(2,1)=4;
[nrow,ncol]=size(x0);
% P=eye(nrow);
% for i1=2:nrow
%     P(i1-1,i1)=-1;
% end

x(1:2,1)=x0
f0=f_654(x(1:2,1));
f1=f1_654(x(1:2,1));
x(1:2,2)=x(1:2,1)-f1\f0;

for k=2:MAX
% for j1=1:nrow
%     x1(j)=x(1:2,k)+
%     H(1:nrow,k)
    for i1=1:nrow
        for j1=i1:nrow
            Hk(i1,j1)=x(i1,k-1)-x(i1,k);
        end
    end
%     for j1=1:ncol
%         xk(1:nrow,j1)=
%     end
    xk1(1,1)=x(1,k-1);
    xk1(2,1)=x(2,k);
%     xk1(1)=xk1(1)+x(1,k-1)-x(1,k);
    xk2=x(:,k-1);
    Tk=[ f_654(xk1)-f_654(x(1:2,k)) f_654(xk2)-f_654(x(1:2,k)) ];
    
    A1=Hk*inv(Tk);
    yk=-A1*f_654(x(1:nrow,k));
    x(1:nrow,k+1)=x(1:nrow,k)+yk;
    
    err=norm(yk);
    if(err<TOL)
        break;
    end
    
    
end

x
    
plot(x','-*')
    
    
    
    
    
    
    
    
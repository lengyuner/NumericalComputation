function [k2,err2]=KofGS(A,b,x0,TOL,n,choice)
%n=input('请选择最大迭代次数:');
%choice=input('请选择停机标准. 1: 残量, 2: 相邻误差, 3:后验误差    ');
N=length(b);
X0([1:N],1)=1;
for k=1:n
    for j=1:N
        if j==1
            x(1)=(b(1)-A(1,2:N)*x0(2:N))/A(1,1);
        elseif j==N
            x(N)=(b(N)-A(N,1:N-1)*(x(1:N-1))')/A(N,N);
        else 
            x(j)=(b(j)-A(j,1:j-1)*(x(1:j-1)')-A(j,j+1:N)*x0(j+1:N))/A(j,j);
        end
    end
    %残量
    if(choice==1) 
        err(k)=abs(norm(A*(x')-b));
    end
    %相邻差量
    if(choice==2) 
        err(k)=abs(norm(x'-x0));
    end 
    %后验误差
    if(choice==3) temp3(k)=abs(norm(x'-x0));
        if(k>1)
            err(k)=abs(temp3(k)*temp3(k)/(temp3(k-1)-temp3(k)));    
        end      
    end
    
    x0=x';
    %fprintf('err(%d)=%f\t',k,err(k));
    %if(mod(k,10)==0)
    %    disp('\n');
    %end
    err(1)=1;
    if(err(k)<TOL)
        break;
    end
    k2=k;
    err2=abs(norm(x'-X0));
end
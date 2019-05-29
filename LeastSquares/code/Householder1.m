function A =Householder1( A0 )
%[ A ,d ] = Householder( A0 )
A=A0;
[m,n]=size(A)
for k=1:n-1
    sigma=sqrt(A(1:n,k)'*A(1:n,k))
    
    if(A(k,k)>=0)
        sigma=-sigma;
    end
    h=sigma-A(k,k);
    A(k,k)=-h;
    d(k)=sigma;
    b=d(k)*h;
    for j=(k+1):n
        sum=0;
        for i1=(k+1):m
            sum=sum+A(i1,k)*A(i1,j);
        end
        sigma=(A(k,j)*h-sum)/b;
        A(k,j)=A(k,j)-h;
        for i2=(k+1):m
            A(i2,j)=A(i2,j)+sigma*A(i2,k);
        end
    end
end
if(m==n)
    d(n)=A(n,n);
    return;
end
sum=0;
for i3=n:m
    sum=sum+A(i3,n)*A(i3,n);
end
sigma=sqrt(sum);
if(A(n,n)>0)
    d(n)=-sigma;
else
    d(n)=sigma;
end
A(n,n)=A(n,n)-d(n);
A
d'





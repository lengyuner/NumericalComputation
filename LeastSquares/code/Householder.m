function [ Q,R ] =Householder( A0 )
%[ A ,d ] = Householder( A0 )
A=A0;
[m,n]=size(A);
for k=1:(n-1)
    sigma=sqrt(A(k:m,k)'*A(k:m,k));
    
    if(A(k,k)>=0)
        sigma=-sigma;
    end
    h=sigma-A(k,k);
    A(k,k)=-h;
    d(k)=sigma;
    b=d(k)*h;
    for j=(k+1):n
        %sum=0;
        %for i1=(k+1):m
        %    sum=sum+A(i1,k)*A(i1,j);
        %end
        sigma=(A(k,j)*h-(A((k+1):m,k))'*A((k+1):m,j))/b;
        %sigma=(A(k,j)*h-sum)/b;
        A(k,j)=A(k,j)-sigma*h;
        for i2=(k+1):m
            A(i2,j)=A(i2,j)+sigma*A(i2,k);
        end
    end
end
if(m==n)
    d(n)=A(n,n);
    %return;
else
    %sum=0;
    %for i3=n:m
    %   sum=sum+A(i3,n)*A(i3,n);
    %end
    %sigma=sqrt(sum);
    sigma=sqrt((A(n:m,n))'*A(n:m,n));
    if(A(n,n)>=0)
        d(n)=-sigma;
    else
        d(n)=sigma;
    end
    A(n,n)=A(n,n)-d(n);
end
    %A
    %d'


A(m-3:m,n-3:n)
d(n-3:n)
R(1:m,1:n)=0;
for i=1:n
    R(i,i)=d(i);
    for j=(i+1):n
        R(i,j)=A(i,j);
    end
end
R(m-3:m,n-3:n)


u=A(1:m,1);
%u*u';
H=eye(m)-u*u'/(u'*u/2);
for i=2:n
    clear u;
    u=A(i:m,i);
    clear Ei;
    Ei=eye(i-1);
    clear Eni;
    Eni=eye(m-i+1)-u*u'/(u'*u/2);
    clear w;
    w(1:(m-i+1),1:(i-1))=0;
    clear w1;
    w1=w(1:(m-i+1),1:(i-1));
    clear H1;
    H1=[Ei w1';w1 Eni];
    H=H1*H;
end

Q=H';


%

%sum=0;
%for i3=n:m
%    sum=sum+A(i3,n)*A(i3,n);
%end
%sigma=sqrt(sum);
%if(A(n,n)>0)
%    d(n)=-sigma;
%else
%    d(n)=sigma;
%end
%A(n,n)=A(n,n)-d(n);
%A
%d'
%
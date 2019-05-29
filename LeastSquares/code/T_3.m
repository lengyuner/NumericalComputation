
n=80;
D(1:n,1:n)=0;
for i=1:n
    D(i,i)=power(1/2,i);
end
A1=rand(n);
B1=orth(A1);

A2=rand(n);
B2=orth(A2);

%E=B'*B;
%E(1:5,1:5)
%E(n-3:n,n-3:n)
C=B1*D*B2;
C(n-3:n,n-3:n)


[Q,U]=MGS(C);
[V,]MGS(R');

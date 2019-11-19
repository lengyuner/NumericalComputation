function [ B ] = jiangwei( A )

[nrow,ncol]=size(A);

[V,lambda]=eig(A);


v=V(1:nrow,ncol);



alpha=-sign(v(1))*norm(v);
b=alpha*alpha-alpha*v(1);
v(1)=v(1)-alpha;
H=eye(nrow)-(1/b)*v*v';
H*v;
A1=H*A*H';
B=A1(2:nrow,2:ncol);

A1(1,1)-lambda(nrow,ncol);




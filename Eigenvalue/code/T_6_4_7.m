A=[ 1e40 1e29 1e19 ; 1e29 1e20 1e9 ; 1e19 1e9 1]
MAX=100000;
D=MaxJacobi647( A,MAX );
d=diag(D);
d(1)
d(2)
d(3)

c=eig(A);
c(1)
c(2)
c(3)
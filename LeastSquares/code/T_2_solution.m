clear all;

A=rand(4);
[nrow,ncol]=size(A);
X(1:ncol,1)=1;
b=A*X;



[Q,R]=CGS(A);
y=Q\b;
x=R\y;
x'

[Q,R]=MGS(A);
y=Q\b;
x=R\y;
x'

[Q,R]=Householder(A);
y=Q\b;
x=R\y;
x'

[Q,R]=Givens(A);
y=Q\b;
x=R\y;
x'




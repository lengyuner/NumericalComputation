clear all;
A=Tn(101);
MAX=100;
TOL=1e-14;
% Au=triu(A);
% Al=tril(A);

for k=1:MAX
    [Qk,Rk]=qr(A);
    A1=Rk*Qk;
    A=A1;
    A1=A-diag(diag(A));
    if(norm(A1)<TOL)
        break;
    end
end
A
b1=diag(A);
b=sort(b1');
b(1:8)
c1=sort(eig(A));
c=c1';
c(1:8)

norm(A)
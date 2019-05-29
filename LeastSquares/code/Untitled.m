A=ones(3);
n=3;
%H=eye(n);
u=A(1:n,1);
H=eye(n)-u*u'

for i=2:n
    u=A(i:n,i);
    Ei=eye(i-1);
    Eni=eye(n-i+1)-u*u'/(u'*u/2);
    w(1:(n-i+1),1:(i-1))=0;
    w1=w(1:(n-i+1),1:(i-1));
    u
    Ei
    w1'
    w1
    Eni
    H1=[Ei w1';w1 Eni]
    H=H1*H;
end
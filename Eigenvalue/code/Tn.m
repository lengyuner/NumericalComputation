function A = Tn(N)
%TN Summary of this function goes here
%   Detailed explanation goes here
for i=1:N
    A(i,i)=2;
    if(i<N)
        A(i,i+1)=-1;
        A(i+1,i)=-1;
    end
end
A;

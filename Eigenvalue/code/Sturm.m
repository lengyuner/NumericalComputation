function [ s,p ] = Sturm( A,x )
n=size(A);
MIN=-1e15;
% p(0)=1;
p(1)=A(1,1)-x;

for k=2:n
    if(p(k-1)==0)
        p(k)=MIN-1;
    else
        if(p(k-1)<MIN)
            p(k)=A(k,k)-x;
        else
            p(k)=A(k,k)-x-A(k,k-1)*A(k-1,k)/(p(k-1));
        end
    end
    
end

s=0;
for k=1:n
    if(p(k)>=0)
        s=s+1;
    end
end



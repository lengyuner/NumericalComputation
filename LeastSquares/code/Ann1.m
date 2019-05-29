function A = Ann1( n )
A(1:n,1:(n-1))=0;
for k=1:n
    if(k<n)
        A(k,k)=2;
    end
    if(k>1)
        A(k,k-1)=-1;
    end
    if(k<(n-1))
        A(k,k+1)=-1;
    end
end
function A= An(n)
for i=1:n*n
    A(i,i)=4;
     if(i>1)
        A(i,i-1)=-1;
        A(i-1,i)=-1;
    end
    if(i>n)
        A(i,i-n)=-1;
        A(i-n,i)=-1;
        if(mod(i,n)==1);
        A(i,i-1)=0;
        A(i-1,i)=0;
    end
    end
   
    
end
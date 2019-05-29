function [ c,s ] = given( a,b )
if(a==0)
    c=1;
    s=0;
else
    xi=abs(a);
    xj=abs(b);
    if(xi>xj)
        t=a/b;
        s=1/(sqrt(1+t*t));
        c=s*t;
    else
        t=b/a;
        c=1/(sqrt(1+t*t));
        s=c*t;
    end
end

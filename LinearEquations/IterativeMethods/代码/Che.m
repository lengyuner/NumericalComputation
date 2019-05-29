function y= Che( k,x )
y0=1;
y1=x;
if(k==0)
    y=0;
    return;
end
if(k==1)
    y=x;
    return;
end
if(k>=2)
    for i=2:k
        y=2*x*y1-y0;
        y0=y1;
        y1=y;
    end
end
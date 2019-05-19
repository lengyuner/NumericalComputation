function u = u0_b(x)
if( x>=0 && x<=pi )
    u=pi-x;
end
if( x>=-pi && x<0 )
    u=pi+x;
end
if( x<-pi || x>pi)
    u=0;
end


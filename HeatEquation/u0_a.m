function u = u0_a(x)
if( x>=-pi/2 && x<=pi/2 )
    u=1;
end
if( x>=-pi && x<-pi/2 )
    u=0;
end
if( x>pi/2 && x<=pi)
    u=0;
end
if( x<-pi || x>pi)
    u=0;
end


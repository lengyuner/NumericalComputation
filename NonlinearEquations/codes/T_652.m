clear all;






[ x,k ] = SecantMethod( 0 );
x
k

f_651(x(k));
-log(abs(x-2));
plot(-log(abs(x-2)),'-*')


close
for k=1:length(x)-1
    e(k)=abs(x(k)-2)/abs(x(k+1)-2);
end

plot(e)



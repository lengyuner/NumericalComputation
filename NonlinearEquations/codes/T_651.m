clear all;



% x0=-100:0.1:100;
% k_x0=length(x0);
% 
% for k=1:k_x0
%     y(k)=f_651(x0(k));
% end
% plot(y)
% 
% f_651(2)

[x,k]=Newton(0);

f_651(x(k))
-log(abs(x-2))
plot(1:length(x),-log(abs(x-2)),'-*')
close
for k=1:length(x)-1
    e(k)=abs(x(k)-2)/abs(x(k+1)-2);
end

x
plot(e)
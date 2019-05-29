

%_____________________________________________________________
clear all;
h=1e-3;
N=1/h;
for n=1:N
    t=n*h;
    y0(n)=(t^3+3*t)/(3*(t^2 + 1));
end

% plot(y0)
y0(N)



for n=1:3
    t=n*h;
    y(n)=(t^3+3*t)/(3*(t^2 + 1));
    fn(n)=f_751(t,y(n));
end
for n=3:(N-1)
    t=n*h;
    fn(n)=f_751(t,y(n));
    
    %y01=y(n)+h*(23*fn(n)-16*fn(n-1)+5*fn(n-2))/12;
    %y(n+1)=y(n)+h*(9*f_751(t,y01)+19*fn(n)-5*fn(n-1)+fn(n-2))/24;
    y(n+1)=y(n)+h*(23*fn(n)-16*fn(n-1)+5*fn(n-2))/12;
end
y(N)


clear fn;
h1=h/2;
N1=1/h1;
for n=1:7
    t=n*h1;
    y1(n)=(t^3+3*t)/(3*(t^2 + 1));
    fn(n)=f_751(t,y1(n));
end

for n=7:(N1-1)
    t=n*h1;
    fn(n)=f_751(t,y1(n));
    %y01=y1(n)+h1*(23*fn(n)-16*fn(n-1)+5*fn(n-2))/12;
    %y1(n+1)=y1(n)+h1*(9*f_751(t,y01)+19*fn(n)-5*fn(n-1)+fn(n-2))/24;
    y1(n+1)=y1(n)+h1*(23*fn(n)-16*fn(n-1)+5*fn(n-2))/12;
end

y1(N1)
length(y0)
length(y)
length(y1)
for n=1:N
    delta2(n)=abs(y(n)-y0(n))/abs(y1(2*n)-y0(n));
end
abs(y(n)-y0(n))
abs(y1(2*n)-y0(n))
abs(y1(2*n)-y(n))
delta2=log2(delta2);
plot(h:h:1,delta2)
axis([0 1 2.9 3.1 ])
saveas(gca,'755_Adams_alpha','jpg');


















% 
% for n=1:N
%     px(n)=log(h);
%     py(n)=log(abs(y(n)-y0(n)));
% end


% 
% p1=log(abs(y-y0))/log(h);
% p1(N-10:N)
% plot(h:h:1 p1)










% plot(log(y-y0))


% en=h^4
% plot(log(h),log(abs(y-y0)))

% for n=1:N
%     e(n)=abs(y(n)-y0(n));
%     p(n)=log(h)-log(e(n));
% end
% plot(p)












% t=0;
% K1=f_751(t,0);
% K2=f_751(t+h/2,0+h*K1/2);
% K3=f_751(t+h/2,0+h*K2/2);
% K4=f_751(t+h,0+h*K3);
% y(1)=0+h*(K1+2*K2+2*K3+K4)/6;
% for n=1:2
%     t=n*h;
%     K1=f_751(t,y(n));
%     K2=f_751(t+h/2,y(n)+h*K1/2);
%     K3=f_751(t+h/2,y(n)+h*K2/2);
%     K4=f_751(t+h,y(n)+h*K3);
%     fn(n)=(K1+2*K2+2*K3+K4)/6;
%     y(n+1)=y(n)+h*fn(n);
% end



% t=0;
% K1=f_751(t,0);
% K2=f_751(t+h1/2,0+h1*K1/2);
% K3=f_751(t+h1/2,0+h1*K2/2);
% K4=f_751(t+h1,0+h1*K3);
% y1(1)=0+h1*(K1+2*K2+2*K3+K4)/6;
% for n=1:2
%     t=n*h1;
%     K1=f_751(t,y1(n));
%     K2=f_751(t+h1/2,y1(n)+h1*K1/2);
%     K3=f_751(t+h1/2,y1(n)+h1*K2/2);
%     K4=f_751(t+h1,y1(n)+h1*K3);
%     fn(n)=(K1+2*K2+2*K3+K4)/6;
%     y1(n+1)=y1(n)+h1*fn(n);
% end

%_____________________________________________________________
clear all;
h=1e-3;
N=1/h;
y0(1)=0;
for n=1:N
    t=n*h;
    y0(n)=(t^3+3*t)/(3*(t^2 + 1));
end
y0(N)


clear y;
t=0;
K1=f_751(t,0);
K2=f_751(t+h/2,0+h*K1/2);
K3=f_751(t+h/2,0+h*K2/2);
K4=f_751(t+h,0+h*K3);
y(1)=0+h*(K1+2*K2+2*K3+K4)/6;

for n=1:(N-1)
    t=n*h;
    K1=f_751(t,y(n));
    K2=f_751(t+h/2,y(n)+h*K1/2);
    K3=f_751(t+h/2,y(n)+h*K2/2);
    K4=f_751(t+h,y(n)+h*K3);
    y(n+1)=y(n)+h*(K1+2*K2+2*K3+K4)/6;
end
% p3=plot(h:h:1,-log(abs(y-y0)))
% saveas(p3,'7553','jpg')
% close
y(N)



p1=log(abs(y-y0))/log(h);
p1(N-10:N)
plot(p1)





h1=h/2;
N1=1/h1;

t=0;
K1=f_751(t,0);
K2=f_751(t+h1/2,0+h1*K1/2);
K3=f_751(t+h1/2,0+h1*K2/2);
K4=f_751(t+h1,0+h1*K3);
y1(1)=0+h1*(K1+2*K2+2*K3+K4)/6;


for n=1:(N1-1)
    t=n*h1;
    K1=f_751(t,y1(n));
    K2=f_751(t+h1/2,y1(n)+h1*K1/2);
    K3=f_751(t+h1/2,y1(n)+h1*K2/2);
    K4=f_751(t+h1,y1(n)+h1*K3);
    y1(n+1)=y1(n)+h1*(K1+2*K2+2*K3+K4)/6;
end

y1(N1)

for n=1:N
    delta2(n)=abs(y(n)-y0(n))/abs(y1(2*n)-y0(n));
end
abs(y(n)-y0(n))
abs(y1(2*n)-y0(n))
delta2=log2(delta2);
plot(h:h:1,delta2)
% axis([0 1 1.9999 2.0001])
saveas(gca,'755_RK4_alpha','jpg');






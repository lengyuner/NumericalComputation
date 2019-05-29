
%_____________________________________________________________
clear all;
h=1e-4;
N=1/h;
y0(1)=0;
for n=1:N
    t=n*h;
    y0(n)=(t^3+3*t)/(3*(t^2 + 1));
end
% p0=plot(h:h:1,y0);
% saveas(p0,'7550','jpg');
% close;
y0(N)



%_____________________________________________________________
%   ti xing fa

t=1*h;

yn0=0+h*f_751(0,0);
y(1)=(yn0+0+h*f_751(0+h,yn0))/2;
for n=1:(N-1)
    t=n*h;
    yn0=y(n)+h*f_751(t,y(n));
    y(n+1)=(yn0+y(n)+h*f_751(t+h,yn0))/2;
end
%plot(y)
y(N)

h1=h/2;
N1=1/h1;
yn0=0+h1*f_751(0,0);
y1(1)=(yn0+0+h1*f_751(0+h1,yn0))/2;
for n=1:(N1-1)
    t=n*h1;
    yn0=y1(n)+h1*f_751(t,y1(n));
    y1(n+1)=(yn0+y1(n)+h1*f_751(t+h1,yn0))/2;
    %y1(n+1)=y1(n)+h1*(f_751(t,y1(n))+f_751(t+h1,y01))/2;
end
% plot(y1)
y1(N1)

for n=1:N
    delta2(n)=abs(y(n)-y0(n))/abs(y1(2*n)-y0(n));
end
abs(y(n)-y0(n))
abs(y1(2*n)-y0(n))
delta2=log2(delta2);
plot(h:h:1,delta2)
axis([0 1 1.9999 2.0001])
saveas(gca,'755_ti_xing_alpha','jpg');

% max(delta2)
% min(delta2)
% max(delta2)-min(delta2)








% 
% 
% h2=h1/2;
% N2=1/h2;
% y2(1)=0;
% for n=1:(N2-1)
%     t=n*h2;
%     y02=y2(n)+h2*f_751(t,y2(n));
%     y2(n+1)=y2(n)+h2*(f_751(t,y2(n))+f_751(t+h2,y02))/2;
% end
% plot(y2)
% y2(N2)
% 
% for n=1:N
%     delta2(n)=abs(y1(2*n)-y0(n))/abs(y2(4*n)-y0(n));
% end
% delta2=log2(delta2);
% delta2(N-10:N)
% plot(delta2)
% 
% 



%     t=n*h;
%     yn2=0;
%     for k=1:MAX
%         
%         yn0=y1(n)+h1*f_751(t,y1(n));
%         
%         yn1=(yn0+y1(n)+h1*f_751(t+h1,yn0))/2;
%         
%         %y(n)+h*(f_751(t,y(n))+f_751(t+h,y01))/2;
%         if(abs(yn1-yn2)<TOL)
%             break;
%         end
%         yn2=yn1;
%     end
%     y1(n+1)=yn2;
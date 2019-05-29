
%_____________________________________________________________
clear all;
h=1e-3;
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
%   Euler 
y(1)=0;
for n=1:(N-1)
    t=n*h;
    y(n+1)=y(n)+h*f_751(t,y(n));
end
% p1=plot(h:h:1,-log(abs(y-y0)))
% saveas(p1,'7551','jpg')
% close
y(N)


h1=h/2;
N1=1/h1;
y1(1)=0;
for n=1:(N1-1)
    t=n*h1;
    y1(n+1)=y1(n)+h1*f_751(t,y1(n));
end
for n=1:N
    delta1(n)=abs(y(n)-y0(n))/abs(y1(2*n)-y0(n));
end
delta1=log2(delta1);
delta1(N-10:N)
plot(delta1)
axis([1 N 0.995 1.005])
saveas(gca,'7511n','jpg')
close



% h2=h1/2;
% N2=1/h2;
% y2(1)=0;
% for n=1:(N2-1)
%     t=n*h2;
%     y2(n+1)=y2(n)+h2*f_751(t,y2(n));
% end
% for n=1:N
%     delta2(n)=abs(y1(2*n)-y0(n))/abs(y2(4*n)-y0(n));
% end
% y0(n)
% y1(2*n)
% y2(4*n)
% % delta2=log2(delta2);
% delta2(N-10:N)
% plot(log2(delta2))
% axis([1 N 0 1.1])






% % 
% % %_____________________________________________________________
% % %   ti xing fa
% % clear y;
% % y(1)=0;
% % for n=1:(N-1)
% %     t=n*h;
% %     y0=y(n)+h*f_751(t,y(n));
% %     y(n+1)=y(n)+h*(f_751(t,y(n))+f_751(t+h,y0))/2;
% % end
% % p2=plot(h:h:1,-log(abs(y-y0)))
% % saveas(p2,'7552','jpg')
% % close
% % y(N)
% % 
% % 
% % h1=h/2;
% % N1=1/h1;
% % y1(1)=0;
% % for n=1:(N1-1)
% %     t=n*h;
% %     y0=y(n)+h*f_751(t,y(n));
% %     y(n+1)=y(n)+h*(f_751(t,y(n))+f_751(t+h,y0))/2;
% % end
% % 
% % for n=1:N
% %     delta2(n)=abs(y(n)-y0(n))/abs(y1(2*n)-y0(n));
% % end
% % delta2=log2(delta2);
% % delta2(N-10:N)
% % plot(delta2)




% % 
% % %_____________________________________________________________
% % %RK3
% % clear y;
% % y(1)=0;
% % for n=1:(N-1)
% %     t=n*h;
% %     K1=f_751(t,y(n));
% %     K2=f_751(t+h/2,y(n)+h*K1/2);
% %     K3=f_751(t+3*h/4,y(n)+3*h*K2/4);
% %     y(n+1)=y(n)+h*(2*K1+3*K2+4*K3)/9;
% % end
% % p3=plot(h:h:1,-log(abs(y-y0)))
% % saveas(p3,'7553','jpg')
% % close
% % y(N)
% % 
% % 







% % %_____________________________________________________________
% % %RK4
% % clear y;
% % y(1)=0;
% % for n=1:(N-1)
% %     t=n*h;
% %     K1=f_751(t,y(n));
% %     K2=f_751(t+h/2,y(n)+h*K1/2);
% %     K3=f_751(t+h/2,y(n)+h*K2/2);
% %     K4=f_751(t+h,y(n)+h*K3);
% %     y(n+1)=y(n)+h*(K1+2*K2+2*K3+K4)/6;
% % end
% % plot(h:h:1,y)
% % p4=plot(h:h:1,-log(abs(y-y0)));
% % saveas(p4,'7554','jpg')
% % close
% % y(N)
% % 
% % 
% % 
% % 






% % %_____________________________________________________________
% % %Adams(3,3)
% % clear y;
% % y(1)=0;
% % for n=1:3
% %     t=n*h;
% %     K1=f_751(t,y(n));
% %     K2=f_751(t+h/2,y(n)+h*K1/2);
% %     K3=f_751(t+h/2,y(n)+h*K2/2);
% %     K4=f_751(t+h,y(n)+h*K3);
% %     fn(n)=(K1+2*K2+2*K3+K4)/6;
% %     y(n+1)=y(n)+h*fn(n);
% % end
% % for n=3:(N-1)
% %     t=n*h;
% %     
% %     fn(n)=f_751(t,y(n));
% %     y0=y(n)+h*(23*fn(n)-16*fn(n-1)+5*fn(n-2))/12;
% %     y(n+1)=y(n)+h*(9*f_751(t,y0)+19*fn(n)-5*fn(n-2)+fn(n-2))/24;
% % end
% % p5=plot(h:h:1,-log(abs(y-y0)))
% % saveas(p5,'7555','jpg')
% % close
% % y(N)





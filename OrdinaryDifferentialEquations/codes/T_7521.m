
%_____________________________________________________________
clear all;
h=1e-1;
TOL=1e-5;

N=1/h;
y0(1)=2;
for n=1:N
    t=n*h;
    y0(n)=2;
end
p0=plot(h:h:1,y0,'-*');

saveas(p0,'7520','jpg');
close;
y0(N)

%_____________________________________________________________
%   Euler 
y(1)=2+TOL;
for n=1:(N-1)
    t=n*h;
    y(n+1)=y(n)+h*f_752(t,y(n));
end

%%p1=plot(h:h:1,log(abs(y-2)),'-*');
p1=plot(h:h:1,abs(y-2-TOL),'-*');%p1=plot(h:h:1,y,'-*');
saveas(p1,'7521','jpg')
%close
y(N)-2








%_____________________________________________________________
%   ti xing fa
clear y;
y(1)=2+TOL;
for n=1:(N-1)
    t=n*h;
    y0=y(n)+h*f_752(t,y(n));
    y(n+1)=y(n)+h*(f_752(t,y(n))+f_752(t+h,y0))/2;
end
%p2=plot(h:h:1,log(abs(y-2)),'-*');
p2=plot(h:h:1,abs(y-2-TOL),'-*');
%%p2=plot(h:h:1,y,'-*');
saveas(p2,'7522','jpg')
close
y(N)-2

% 
% 

% 
% 
% %_____________________________________________________________
% %RK3
% clear y;
% y(1)=2+TOL;
% for n=1:(N-1)
%     t=n*h;
%     K1=f_752(t,y(n));
%     K2=f_752(t+h/2,y(n)+h*K1/2);
%     K3=f_752(t+3*h/4,y(n)+3*h*K2/4);
%     y(n+1)=y(n)+h*(2*K1+3*K2+4*K3)/9;
% end
% %p3=plot(h:h:1,log(abs(y-2)),'-*');%plot(h:h:1,y,'-*');
% p3=plot(h:h:1,abs(y-2-TOL),'-*');
% saveas(p3,'7523','jpg')
% close
% y(N)-2
% % 
% 
% 
% 
% 
% 
% 
% 
% 
% %_____________________________________________________________
% %RK4
% clear y;
% y(1)=2+TOL;
% for n=1:(N-1)
%     t=n*h;
%     K1=f_752(t,y(n));
%     K2=f_752(t+h/2,y(n)+h*K1/2);
%     K3=f_752(t+h/2,y(n)+h*K2/2);
%     K4=f_752(t+h,y(n)+h*K3);
%     y(n+1)=y(n)+h*(K1+2*K2+2*K3+K4)/6;
% end
% p4=plot(h:h:1,log(abs(y-2)),'-*');%plot(h:h:1,y,'-*');
% saveas(p4,'7524','jpg')
% close
% y(N)-2
% 
% 
% 
% 
% 
% 
% %_____________________________________________________________
% %Adams(3,3)
% clear y;
% y(1)=2+TOL;
% for n=1:3
%     t=n*h;
%     K1=f_752(t,y(n));
%     K2=f_752(t+h/2,y(n)+h*K1/2);
%     K3=f_752(t+h/2,y(n)+h*K2/2);
%     K4=f_752(t+h,y(n)+h*K3);
%     fn(n)=(K1+2*K2+2*K3+K4)/6;
%     y(n+1)=y(n)+h*fn(n);
% end
% for n=3:(N-1)
%     t=n*h;
%     fn(n)=f_752(t,y(n));
% %     y0=y(n)+h*(23*fn(n)-16*fn(n-1)+5*fn(n-2))/12;
% %     y(n+1)=y(n)+h*(9*f_752(t,y0)+19*fn(n)-5*fn(n-2)+fn(n-2))/24;
%     y(n+1)=y(n)+h*(23*fn(n)-16*fn(n-1)+5*fn(n-2))/12;
% end
% p5=plot(h:h:1,log(abs(y-2)),'-*');%plot(h:h:1,y,'-*');
% saveas(p5,'7525','jpg')
% close
% y(N)-2
% 
% 
% 
% 

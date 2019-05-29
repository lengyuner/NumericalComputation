%Dp=a*p+b*p*q;
%Dq=c*q+d*p*q;
%写完程序再看QQ
%明天记得买礼物


clear all;
a=-1;
b=0.01;
c=0.25;
d=-0.01;
p(1)=30-1;
q(1)=80-1;
h=1e-1;
N=1/h;
MAX=10000;

  
    
    
for n=1:3
    K1=f_p(p(n),q(n));
    L1=f_q(p(n),q(n));
    K2=f_p(p(n)+h*K1/2,q(n)+h*L1/2);
    L2=f_q(p(n)+h*K1/2,q(n)+h*L1/2);
    K3=f_p(p(n)+h*K2/2,q(n)+h*L2/2);
    L3=f_q(p(n)+h*K2/2,q(n)+h*L2/2);
    K4=f_p(p(n)+h*K3,q(n)+h*L3);
    L4=f_q(p(n)+h*K3,q(n)+h*L3);
    p(n+1)=p(n)+h*(K1+2*K2+2*K3+K4)/6;
    q(n+1)=q(n)+h*(L1+2*L2+2*L3+L4)/6;
    
    fp(n)=f_p(p(n),q(n));
    fq(n)=f_q(p(n),q(n));
end
for n=3:MAX*N
    fp(n)=f_p(p(n),q(n));
    fq(n)=f_q(p(n),q(n));
    p(n+1)=p(n)+h*(23*fp(n)-16*fp(n-1)+5*fp(n-2))/12;
    q(n+1)=q(n)+h*(23*fq(n)-16*fq(n-1)+5*fq(n-2))/12;
end
plot(p,q)
xlabel('161110014 董冀峥')
saveas(gca,'admas__h_1e-1__T_10000','jpg');

% % for n=1:MAX*N
% % 
% %     K1=f_p(p(n),q(n));
% %     L1=f_q(p(n),q(n));
% %     
% %     K2=f_p(p(n)+h*K1/2,q(n)+h*L1/2);
% %     L2=f_q(p(n)+h*K1/2,q(n)+h*L1/2);
% %     
% %     K3=f_p(p(n)+h*K2/2,q(n)+h*L2/2);
% %     L3=f_q(p(n)+h*K2/2,q(n)+h*L2/2);
% %     
% %     K4=f_p(p(n)+h*K3,q(n)+h*L3);
% %     L4=f_q(p(n)+h*K3,q(n)+h*L3);
% %     
% %     p(n+1)=p(n)+h*(K1+2*K2+2*K3+K4)/6;
% %     q(n+1)=q(n)+h*(L1+2*L2+2*L3+L4)/6;
% % end
% % plot(p,q);
% % 
% % 
% % saveas(gca,'RK4__h_1e-1 T_100000','jpg')



% for n=1:MAX*N
%     t=n*h;
%     K1=f_p(p(n),q(n));
%     L1=f_q(p(n),q(n));
%     
%     K2=f_p(p(n)+h*K1/2,q(n)+h*L1/2);
%     L2=f_q(p(n)+h*K1/2,q(n)+h*L1/2);
%     
%     K3=f_p(p(n)+3*h*K2/4,q(n)+3*h*L2/4);
%     L3=f_q(p(n)+3*h*K2/4,q(n)+3*h*L2/4);
%     
%     p(n+1)=p(n)+h*(2*K1+3*K2+4*K3)/9;
%     q(n+1)=q(n)+h*(2*L1+3*L2+4*L3)/9;
%     
% end
% plot(p,q);
% saveas(gca,'h_1e-1 T_100000','jpg')


% % 
% % % %_____________________________________________________________
% % % %   tixing  
% % for n=1:MAX*N
% %     t=n*h;
% %     p0=p(n)+h*f_p(p(n),q(n));
% %     q0=q(n)+h*f_q(p(n),q(n));
% %     p(n+1)=p(n)+h*(f_p(p(n),q(n))+f_p(p0,q0))/2; 
% %     q(n+1)=q(n)+h*(f_q(p(n),q(n))+f_q(p0,q0))/2;
% % end
% % plot(p,q);
% % %saveas(gca,'h_1e-1 T_1000','jpg')






% % % %_____________________________________________________________
% % % %   Euler 
% % % for n=1:MAX*N
% % %     t=n*h;
% % %     p(n+1)=p(n)+h*(a*p(n)+b*p(n)*q(n));
% % %     q(n+1)=q(n)+h*(c*q(n)+d*p(n)*q(n));
% % %     %disp('Happy Holidays!');
% % % end
% % % plot(p,q);
% % % saveas(gca,'h_1e-4 T_300','jpg')

    
    
    
    
    
    
    
    
    
    
    
    


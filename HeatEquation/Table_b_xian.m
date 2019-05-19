function err_b_xian=Table_b_xian(a,T,J,mu)



% %function
% clear all;
% a=1;
% T=1;
% J=18;  % 36,72...
% mu=0.4;  % mu=(△t)/((△x)^2）
deta_t=mu*(pi/J)*(pi/J);
N_t=floor(T/deta_t)+1;
for j=(-J):(J)    
    x0(j+J+1)=j*pi/J; 
end
for n=1:N_t
    if( n==1 )
        for j=(-J):(J)
            u1_a(j+J+1,n)=u0_b(j*pi/J);            
        end
    end
    if( n>1 && n<N_t )
        for j = (-J):(J)
            if j==-J
                u1_a(1,n)=(1-2*mu*a)*u1_a(1,n-1)+mu*a*(u1_a(2,n-1)+u1_a(2*J,n-1));
            elseif j==J
                u1_a(j+J+1,n)=u1_a(1,n);%(1-2*mu*a)*u1_a(j+J+1,n-1)+mu*a*(u1_a(1,n-1)+u1_a(j+J,n-1));
            else
                u1_a(j+J+1,n)=(1-2*mu*a)*u1_a(j+J+1,n-1)+mu*a*(u1_a(j+J+2,n-1)+u1_a(j+J,n-1));
            end
        end
    end
    if( n==N_t)
        deta_t_N = T - deta_t*(N_t-1);
        mu_N=mu*deta_t_N/deta_t;
        for j = (-J):(J)
            if j==-J
                u1_a(1,n)=(1-2*mu_N*a)*u1_a(1,n-1)+mu_N*a*(u1_a(2,n-1)+u1_a(2*J,n-1));
            elseif j==J
                u1_a(j+J+1,n)=u1_a(1,n);%(1-2*mu*a)*u1_a(j+J+1,n-1)+mu*a*(u1_a(1,n-1)+u1_a(j+J,n-1));
            else
                u1_a(j+J+1,n)=(1-2*mu_N*a)*u1_a(j+J+1,n-1)+mu_N*a*(u1_a(j+J+2,n-1)+u1_a(j+J,n-1));
            end
        end
    end
end
out=u1_a(:,n);
[X,Y]=meshgrid(1:N_t,1:(2*J+1));
surf(Y,X,u1_a);
saveas(gcf,'连续边界条件 全显格式.jpg');
close;

K=J;
for k=-K:K%-10000:10000    
    u1(k+K+1,1)=u1_b( 1,k*pi/K );
end
%(u0-out)'
% plot(-K:K,u1,-K:K,out)
% 


deta_x=(2*pi)/(2*K);
%err_a_xian=0;
err=u1(:,1)-u1_a(:,n);
err_b_xian=sqrt(err'*err*deta_x);

end







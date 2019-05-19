function err_a_xian=Table_a_xian(a,T,J,mu)


% 误差估计和收敛估计
% 显示格式
% 隐式格式

% 初值
%clear all;

%a=1;
%T=1;
%J=18;  % 36,72...
%mu=0.4;  % mu=(△t)/((△x)^2）
deta_t=mu*(pi/J)*(pi/J);
N_t=floor(T/deta_t)+1;
for j=(-J):(J)
    x0(j+J+1)=j*pi/J;
end

%mu=1
% 全显格式
for n=1:N_t
    if( n==1 )
        for j=(-J):(J)
            u_a(j+J+1,n)=u0_a(j*pi/J);            
        end
    end
    if( n>1 && n<N_t )
        for j = (-J):(J)
            if j==-J
                u_a(1,n)=(1-2*mu*a)*u_a(1,n-1)+mu*a*(u_a(2,n-1)+u_a(2*J,n-1));
            elseif j==J
                u_a(j+J+1,n)=u_a(1,n);%(1-2*mu*a)*u1_a(j+J+1,n-1)+mu*a*(u1_a(1,n-1)+u1_a(j+J,n-1));
            else
                u_a(j+J+1,n)=(1-2*mu*a)*u_a(j+J+1,n-1)+mu*a*(u_a(j+J+2,n-1)+u_a(j+J,n-1));
            end
        end
    end
    if( n==N_t)
        deta_t_N = T - deta_t*(N_t-1);
        mu_N=mu*deta_t_N/deta_t;
        for j = (-J):(J)
            if j==-J
                u_a(1,n)=(1-2*mu_N*a)*u_a(1,n-1)+mu_N*a*(u_a(2,n-1)+u_a(2*J,n-1));
            elseif j==J
                u_a(j+J+1,n)=u_a(1,n);%(1-2*mu*a)*u1_a(j+J+1,n-1)+mu*a*(u1_a(1,n-1)+u1_a(j+J,n-1));
            else
                u_a(j+J+1,n)=(1-2*mu_N*a)*u_a(j+J+1,n-1)+mu_N*a*(u_a(j+J+2,n-1)+u_a(j+J,n-1));
            end
        end
    end
end
out=u_a(:,n);
%out'
[X,Y]=meshgrid(1:N_t,1:(2*J+1));
surf(Y,X,u_a)
saveas(gcf,'离散边界条件 全显格式.jpg')
close;


K=J;
for k=-K:K%-10000:10000    
    u0(k+K+1,1)=u1_a( 1,k*pi/K );
end
%(u0-out)'

%plot(-K:K,u0',-K:K,out)

deta_x=(2*pi)/(2*K);
err_a_xian=0;
err=u0(:,1)-u_a(:,n);
err_a_xian=sqrt(err'*err*deta_x);

end










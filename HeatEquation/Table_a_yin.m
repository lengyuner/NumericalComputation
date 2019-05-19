function err_a_yin=Table_a_yin(a,T,J,mu)


% clear all;
% a=1;
% T=1;
% J=18;  % 36,72...
% mu=0.4;  % mu=(△t)/((△x)^2）

deta_t=mu*(pi/J)*(pi/J)
%T/deta_t
N_t=floor(T/deta_t)+2;


% for j=(-J):(J)
%     x0(j+J+1)=j*pi/J;
% end
for k1=1:(2*J+1)
    B1(k1,k1)=1+2*mu*a;
    if k1==1
        B1(k1,2*J+1)=-mu*a;
    else
        B1(k1,k1-1)=-mu*a;
    end
    if k1==2*J+1
        B1(k1,1)=-mu*a;
    else
        B1(k1,k1+1)=-mu*a;
    end
end
B=inv(B1);

% A=[1 2 ; 3 4] 
% b(1,1)=3
% b(2,1)=7
% A\b;
%mu=1
% 全隐格式
for n=1:N_t
    if( n==1 )
        for j=(-J):(J)
            u2_a(j+J+1,n)=u0_a(j*pi/J);
        end
    end
    
    if( n>1 && n<N_t )
        u2_a(:,n)=B*u2_a(:,n-1);
    end
    
    if( n==N_t)
        deta_t_N = T - deta_t*(N_t-2)
        mu_N=mu*deta_t_N/deta_t;               
        for k1=1:(2*J+1)
            B3(k1,k1)=1+2*mu_N*a;
            if k1==1
                B3(k1,2*J+1)=-mu_N*a;
            else
                B3(k1,k1-1)=-mu_N*a;
            end
            if k1==2*J+1
                B3(k1,1)=-mu_N*a;
            else
                B3(k1,k1+1)=-mu_N*a;
            end
        end
        %B4=inv(B3);
        u2_a(:,n)=B3\u2_a(:,n-1);        
    end
end
%u2_a(:,1)
%B3


out=u2_a(:,n);

%out'
 [X,Y]=meshgrid(1:N_t,1:(2*J+1));
 surf(Y,X,u2_a)
 saveas(gcf,'离散边界条件 全隐格式.jpg')
 close;
%u2_a(:,1)'

K=J;
for k=-K:K%-10000:10000    
    u1(k+K+1,1)=u1_a( 1,k*pi/K );
    %u1(k+K+1,1)=u1_a( deta_t*N_t,k*pi/K );
end
%(u0-out)'

%plot(-K:K,u1,-K:K,out)



deta_x=(2*pi)/(2*K);
%err_b_yin=0;
err=u1(:,1)-u2_a(:,n);
%err=u1(4:(2*J-2),1)-u2_a(4:(2*J-2),n);
err_a_yin=sqrt(err'*err*deta_x);


end






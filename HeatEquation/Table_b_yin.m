function err_b_yin=Table_b_yin(a,T,J,mu)

% '�����߽����� ȫ����ʽ
% clear all;
% a=1;
% T=1;
% J=18;  % 36,72...
% mu=0.4;  % mu=(��t)/((��x)^2��
deta_t=mu*(pi/J)*(pi/J)
N_t=floor(T/deta_t)+2;

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
%mu=1
% ȫ����ʽ
for n=1:N_t
    if( n==1 )
        for j=(-J):(J)
            u2_a(j+J+1,n)=u0_b(j*pi/J);
        end
    end    
    if( n>1 && n<N_t )
        u2_a(:,n)=B1\u2_a(:,n-1);
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
out2_a=u2_a(:,n);
%out'
 [X,Y]=meshgrid(1:N_t,1:(2*J+1));
 surf(Y,X,u2_a)
 saveas(gcf,'�����߽����� ȫ����ʽ.jpg')
 close;

K=J;
for k=-K:K%-10000:10000    
    u1(k+K+1,1)=u1_b( 1,k*pi/K );
    %u1(k+K+1,1)=u1_b( deta_t*N_t,k*pi/K );
end
%(u0-out)'

%plot(-K:K,u1',-K:K,out2_a)
%saveas(gcf,'�����߽����� ȫ����ʽ1.jpg')
%close;

deta_x=(2*pi)/(2*K);
%err_b_yin=0;
%err=u1(4:(2*J-2),1)-u2_a(4:(2*J-2),n);
err=u1(:,1)-u2_a(:,n);
err_b_yin=sqrt(err'*err*deta_x);

end









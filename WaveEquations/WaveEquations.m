




clear all;   
0;% ut+aux=0
1;% 迎风格式
2;% Lax-Wendroff 格式
3;% Lax-Friedrichs 格式
4;% 蛙跳格式
5;% 盒子格式
N=100;
for k =1:N
    u0(1,k)=0;
end
for k =1:N
    u0(1,k+N)=k/N;
end
for k=1:2*N
    u0(1,k+2*N)=1-k/N;
end
for k=1:2*N
    u0(1,k+4*N)=1-k/N;
end
for k=1:2*N
    u0(1,k+6*N)=-1;
end
for k=1:2*N
    u0(1,k+8*N)=1;
end
for k=1:20*N
    u0(1,k+10*N)=0;
end

delta_x=1/(30*N);
u00(1,1:30*N)=0;
u00(1,(5*N+1):15*N)=u0(1,1:10*N);

plot(delta_x:delta_x:1,u00);
axis([0,1,-2,2]);
saveas(gcf, 'u0_真解', 'png')
close;  %plot(delta_x:delta_x:12,u0)  %axis(0 60 -10 10)  %va=1/2;    % △x=0.001
L_x=length(u0);
va=1/2;
N_t=1000;


u1(1,:)=u0;
for n = 1:N_t
    u1(n+1,1)=u1(n,1);
    for j = 2:L_x        
        u1(n+1,j)=u1(n,j)-va*(u1(n,j)-u1(n,j-1));
    end
end
u=u1(N_t+1,:);
plot(delta_x:delta_x:1,u);
axis([0,1,-2,2]);
saveas(gcf, 'u1_迎风格式', 'png')
close;


u2(1,:)=u0;
for n = 1:N_t
    u2(n+1,1)=u2(n,1);
    u2(n+1,L_x)=u2(n,L_x);
    for j = 2:(L_x-1)        
        u2(n+1,j)=u2(n,j)-va*(u2(n,j+1)-u2(n,j-1))/2+va*va*(u2(n,j-1)+u2(n,j+1)-2*u2(n,j))/2;
    end
end
u=u2(N_t+1,:);
plot(delta_x:delta_x:1,u);
axis([0,1,-2,2]);
saveas(gcf, 'u2_LW格式', 'png')
close;


u3(1,:)=u0;
for n = 1:N_t
    u3(n+1,1)=u3(n,1);    
    u2(n+1,L_x)=u2(n,L_x);
    for j = 2:(L_x-1)         
        u3(n+1,j)=(u3(n,j+1)+u3(n,j-1))/2-va*(u3(n,j+1)-u3(n,j-1))/2;
    end
end
u=u3(N_t+1,:);
plot(delta_x:delta_x:1,u);
axis([0,1,-2,2]);
saveas(gcf, 'u3_LF格式', 'png')
close;


u4(1,:)=u0;
n=1;
u4(n+1,1)=u4(n,1);
for j = 2:L_x        
        u4(2,j)=u4(n,j)-va*(u4(n,j)-u4(n,j-1));
end
for n = 2:N_t
    u4(n+1,1)=u4(n,1); 
    u4(n+1,L_x)=u4(n,L_x);
    for j = 2:(L_x-1)
        u4(n+1,j)=u4(n-1,j)-va*(u4(n,j+1)-u4(n,j-1));
    end
end
u=u4(N_t+1,:);
plot(delta_x:delta_x:1,u);
axis([0,1,-2,2]);
saveas(gcf, 'u4_蛙跳格式', 'png')
close;


u5(1,:)=u0;
for n = 1:N_t
    u5(n+1,1)=u5(n,1); 
    for j = 1:(L_x-1)
        u5(n+1,j+1)=u5(n,j)+(1-va)*(u5(n,j+1)-u5(n+1,j))/(1+va);
    end
end
u=u5(N_t+1,:);
plot(delta_x:delta_x:1,u)%,delta_x:delta_x:1,u00);
axis([0,1,-2,2]);
saveas(gcf, 'u5_盒子格式', 'png')
close;






























    
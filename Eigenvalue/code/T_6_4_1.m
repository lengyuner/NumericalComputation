clear all;
% 
% 
% MAX=10000;
% 
% A100=Tn(100);
% d100=eig(A100);
% D100=max(d100)
% [nrow100,ncol100]=size(A100);
% u1(1:ncol100,1)=1;
% u1(1,1)=2;
% [b100,u100,B100,U100]= SimplePower(A100,u1,MAX);
% b100
% ERR100=-log(abs(B100-D100));
% 
% A101=Tn(101);
% d101=eig(A101);
% D101=max(d101)
% [nrow101,ncol101]=size(A101);
% u1(1:ncol101,1)=1;
% [b101,u101,B101,U101]= SimplePower(A101,u1,MAX);
% b101
% ERR101=-log(abs(B101-D101));
% %这个收敛很快，线性收敛
% K0=MAX/10;
% strl_lambda=['D:\MATLAB\641\SimplePower_lambda'];
% plot(1:K0,ERR100,1:K0,ERR101);
% saveas(gca,[strl_lambda],'jpg');
% close;
% 
% strl_lambda=['D:\MATLAB\641\SimplePower_vector'];
% plot(1:K0,U100,1:K0,U101);
% saveas(gca,[strl_lambda],'jpg');
% close;




MAX=100000;

A100=Tn(100);
d100=eig(A100);
D100=max(d100)
[nrow100,ncol100]=size(A100);
u1(1:ncol100,1)=1;
[b100,u100,B100,U100]= AitkenPower(A100,u1,MAX);
b100
ERR100=-log(abs(B100-D100));

A101=Tn(101);
d101=eig(A101);
D101=max(d101)
[nrow101,ncol101]=size(A101);
u1(1:ncol101,1)=1;
[b101,u101,B101,U101]= AitkenPower(A101,u1,MAX);
b101
ERR101=-log(abs(B101-D101));
%这个收敛很快，线性收敛
K0=MAX/10;
strl_lambda=['D:\MATLAB\641\AitkenPower_lambda'];
plot(1:K0,ERR100,1:K0,ERR101);
saveas(gca,[strl_lambda],'jpg');
close;

strl_vector=['D:\MATLAB\641\AitkenPower_vector'];
plot(1:K0,U100,1:K0,U101);
saveas(gca,[strl_vector],'jpg');
close;





















% MAX=100000;
% 
% A100=Tn(100);
% d100=eig(A100);
% D100=max(d100)
% [nrow100,ncol100]=size(A100);
% u1(1:ncol100,1)=1;
% [b100,u100,B100,U100]= RayleighPower(A100,u1,MAX);
% b100
% ERR100=-log(abs(B100-D100));
% 
% A101=Tn(101);
% d101=eig(A101);
% D101=max(d101)
% [nrow101,ncol101]=size(A101);
% u1(1:ncol101,1)=1;
% [b101,u101,B101,U101]= RayleighPower(A101,u1,MAX);
% b101
% ERR101=-log(abs(B101-D101));
% %这个收敛很快，线性收敛
% K0=MAX/10;
% strl_lambda=['D:\MATLAB\641\RayleighPower_lambda'];
% plot(1:K0,ERR100,1:K0,ERR101);
% saveas(gca,[strl_lambda],'jpg');
% close;
% 
% strl_vector=['D:\MATLAB\641\RayleighPower_vector'];
% plot(1:K0,U100,1:K0,U101);
% saveas(gca,[strl_vector],'jpg');
% close;



























% 
% 
% 
% MAX=100000;
% 
% A100=Tn(100);
% d100=eig(A100);
% D100=max(d100)
% [nrow100,ncol100]=size(A100);
% u1(1:ncol100,1)=1;
% [b100,u100,B100,U100]= SimplePower(A100,u1,MAX);
% b100
% ERR100=-log(abs(B100-D100));
% 
% A101=Tn(101);
% d101=eig(A101);
% D101=max(d101)
% [nrow101,ncol101]=size(A101);
% u1(1:ncol101,1)=1;
% [b101,u101,B101,U101]= SimplePower(A101,u1,MAX);
% b101
% ERR101=-log(abs(B101-D101));
% %这个收敛很快，线性收敛
% K0=MAX/10;
% strl_lambda=['D:\MATLAB\641\SimplePower_vector'];
% plot(1:K0,U100,1:K0,U101);
% saveas(gca,[strl_lambda],'jpg');
% close;
% 
% 
% 
% % u12(1:ncol100,1)=1;
% % u12(1,1)=2;
% 
% 
% 
% %         
% % [nrow,ncol]=size(A);
% % D=eig(A);
% % disp('the last five number is ');
% % D((nrow-5):nrow)
% % 
% % ncol=size(A,1);
% % u0(1:ncol,1)=1;
% % TOL=1e-7;
% % MAX=1000;
% 
% % [b,u,BK0,]= SimplePower(A);
% % u1=u(1:10);
% % e22=A*u-b*u;
% % e22(1:10)
% 
% 
% 
% 
% % %  [b,u]  = AitkenPower(A);
% % %  b
% % %  u1=u(1:10);
% % %  u1'
% % %  e22=A*u-b*u;
% % %  e22(1:10)
% 
% 
% % % %  [b,u]  = RayleighPower(A);
% % % %  b
% % % %  u1=u(1:10);
% % % %  u1'
% % % %  e22=A*u-b*u;
% % % %  e22(1:10)

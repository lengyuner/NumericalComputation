clear all;

% 
% MAX=10000;
% A100=Tn(100);
% d100=eig(A100);
% D100=max(d100)
% [nrow100,ncol100]=size(A100);
% u1(1:ncol100,1)=1;
% [B100]= SimpleJacobi(A100,MAX);
% 
% strl_100=['D:\MATLAB\644\SimpleJacobi_100'];
% B=B100(1:100,1:30);
% surf(1:30,1:100,B);
% % [xy,yx]=meshgrid(1:100);
% % surf(xy,yx,B100);
% saveas(gca,[strl_100],'jpg');
% close;

% MAX=10100;
% A101=Tn(101);
% d101=eig(A101);
% D101=max(d101)
% [nrow101,ncol101]=size(A101);
% u1(1:ncol101,1)=1;
% [B101]= SimpleJacobi(A101,MAX);
%  
% strl_101=['D:\MATLAB\644\SimpleJacobi_101'];
% B=B101(1:100,1:30);
% surf(1:30,1:100,B);
% % [xy,yx]=meshgrid(1:101);
% % surf(xy,yx,B101);
% saveas(gca,[strl_101],'jpg');
% close;






















% MAX=10000;
% A100=Tn(100);
% d100=eig(A100);
% D100=max(d100)
% [nrow100,ncol100]=size(A100);
% u1(1:ncol100,1)=1;
% [B100]= RouteJacobi(A100,MAX);
% size(B100)
% 
% strl_100=['D:\MATLAB\644\RouteJacobi_100_2'];
% B=B100(1:100,1:100);
% surf(1:100,1:100,B);
% % [xy,yx]=meshgrid(1:100);
% % surf(xy,yx,B100);
% saveas(gca,[strl_100],'jpg');
% close;
% 
% MAX=10100;
% A101=Tn(101);
% d101=eig(A101);
% D101=max(d101)
% [nrow101,ncol101]=size(A101);
% u1(1:ncol101,1)=1;
% [B101]= RouteJacobi(A101,MAX);
%  
% strl_101=['D:\MATLAB\644\RouteJacobi_101_2'];
% B=B101(1:100,1:100);
% surf(1:100,1:100,B);
% % [xy,yx]=meshgrid(1:101);
% % surf(xy,yx,B101);
% saveas(gca,[strl_101],'jpg');
% close;
% 




























MAX=10000;
A100=Tn(100);
d100=eig(A100);
D100=max(d100)
[nrow100,ncol100]=size(A100);
u1(1:ncol100,1)=1;
[B100]= MaxJacobi(A100,MAX);

strl_100=['D:\MATLAB\644\MaxJacobi_100_2'];
B=B100(1:100,1:100);
surf(1:100,1:100,B);
% [xy,yx]=meshgrid(1:100);
% surf(xy,yx,B100);
saveas(gca,[strl_100],'jpg');
close;

MAX=10100;
A101=Tn(101);
d101=eig(A101);
D101=max(d101)
[nrow101,ncol101]=size(A101);
u1(1:ncol101,1)=1;
[B101]= MaxJacobi(A101,MAX);
 
strl_101=['D:\MATLAB\644\MaxJacobi_101_2'];
B=B101(1:100,1:100);
surf(1:100,1:100,B);
saveas(gca,[strl_101],'jpg');
close;














% % % % 
% % % % 
% % % % % MAX=100*101;
% % % % % A101=Tn(101);
% % % % % d101=eig(A101);
% % % % % D101=max(d101)
% % % % % [nrow101,ncol101]=size(A101);
% % % % % u1(1:ncol101,1)=1;
% % % % % [B101]= SimpleJacobi(A101,MAX);
% % % % 
% % % % 
% % % % 
% % % % % 
% % % % % strl_101=['D:\MATLAB\644\SimpleJacobi_101'];
% % % % % plot(1:K0,U100,1:K0,U101);
% % % % % saveas(gca,[strl_lambda],'jpg');
% % % % % close;
% % % % 
% % % % 
% % % % 
% % % % 
% % % % % MAX=100000;
% % % % % 
% % % % % A100=Tn(100);
% % % % % d100=eig(A100);
% % % % % D100=max(d100)
% % % % % [nrow100,ncol100]=size(A100);
% % % % % u1(1:ncol100,1)=1;
% % % % % [b100,u100,B100,U100]= AitkenPower(A100,u1,MAX);
% % % % % b100
% % % % % ERR100=-log(abs(B100-D100));
% % % % % 
% % % % % A101=Tn(101);
% % % % % d101=eig(A101);
% % % % % D101=max(d101)
% % % % % [nrow101,ncol101]=size(A101);
% % % % % u1(1:ncol101,1)=1;
% % % % % [b101,u101,B101,U101]= AitkenPower(A101,u1,MAX);
% % % % % b101
% % % % % ERR101=-log(abs(B101-D101));
% % % % % %这个收敛很快，线性收敛
% % % % % K0=MAX/10;
% % % % % strl_lambda=['D:\MATLAB\641\AitkenPower_lambda'];
% % % % % plot(1:K0,ERR100,1:K0,ERR101);
% % % % % saveas(gca,[strl_lambda],'jpg');
% % % % % close;
% % % % % 
% % % % % strl_vector=['D:\MATLAB\641\AitkenPower_vector'];
% % % % % plot(1:K0,U100,1:K0,U101);
% % % % % saveas(gca,[strl_vector],'jpg');
% % % % % close;
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % % 
% % % % % 
% % % % % 
% % % % % 
% % % % % 
% % % % % 
% % % % % MAX=100000;
% % % % % 
% % % % % A100=Tn(100);
% % % % % d100=eig(A100);
% % % % % D100=max(d100)
% % % % % [nrow100,ncol100]=size(A100);
% % % % % u1(1:ncol100,1)=1;
% % % % % [b100,u100,B100,U100]= RayleighPower(A100,u1,MAX);
% % % % % b100
% % % % % ERR100=-log(abs(B100-D100));
% % % % % 
% % % % % A101=Tn(101);
% % % % % d101=eig(A101);
% % % % % D101=max(d101)
% % % % % [nrow101,ncol101]=size(A101);
% % % % % u1(1:ncol101,1)=1;
% % % % % [b101,u101,B101,U101]= RayleighPower(A101,u1,MAX);
% % % % % b101
% % % % % ERR101=-log(abs(B101-D101));
% % % % % %这个收敛很快，线性收敛
% % % % % K0=MAX/10;
% % % % % strl_lambda=['D:\MATLAB\641\RayleighPower_lambda'];
% % % % % plot(1:K0,ERR100,1:K0,ERR101);
% % % % % saveas(gca,[strl_lambda],'jpg');
% % % % % close;
% % % % % 
% % % % % strl_vector=['D:\MATLAB\641\RayleighPower_vector'];
% % % % % plot(1:K0,U100,1:K0,U101);
% % % % % saveas(gca,[strl_vector],'jpg');
% % % % % close;
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % 
% % % % % A=Tn(10);
% % % % % D=MaxJacobi( A );
% % % % % d=diag(D);
% % % % % d1=sort(d')
% % % % % e=eig(A);
% % % % % e1=sort(e')
% % % % % e1-d1
% % % % 
% % % % 
% % % % % A=Tn(30);
% % % % % D=RouteJacobi( A );
% % % % % d=diag(D);
% % % % % d1=sort(d')
% % % % % e=eig(A);
% % % % % sort(e')
% % % % 
% % % % 
% % % % 
% % % % 
% % % % % A=Tn(100);
% % % % % D=SimpleJacobi( A );
% % % % % d=diag(D);
% % % % % d1=sort(d')
% % % % % e=eig(A);
% % % % % sort(e')

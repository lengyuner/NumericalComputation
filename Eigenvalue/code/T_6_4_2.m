clear all;
A=Tn(100);
[ b,v,k,ERR ]=InversePower( A,2 );
b
% v1=v(1:10);
% v1'
% 
% b
% %v'
% k
% ERR;


strl_100=['D:\MATLAB\642\3_InversePower_A(100)'];
plot(1:k,ERR);
saveas(gca,[strl_100],'jpg');
close;
% 
% 
% clear all;
% A=Tn(101);
% [ b,v,k,ERR ]=InversePower( A,2 );
% strl_101=['D:\MATLAB\642\InversePower_A(101)'];
% plot(1:k,ERR);
% saveas(gca,[strl_101],'jpg');
% close;


clear all;

for K=50:10:160
    A=Tn(K);
    [ b,v,k,ERR ]=InversePower( A,2 );
    strl_K='D:\MATLAB\642\3_InversePower_';
    plot(1:k,ERR);
    axis=[ 0 1 ];
    saveas(gca,[strl_K,num2str(K)],'jpg');%[strl_J,num2str(k1)]
    close;
end



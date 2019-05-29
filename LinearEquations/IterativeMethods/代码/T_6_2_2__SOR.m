clear all;
A=An(30);
ncol=size(A,1);
X((1:ncol),1)=1;
b=A*X;
x0([1:ncol],1)=0;
%KofSOR(A,b,x0,0.3,1e-6,1000)

w=0:0.1:2;
for k=2:(length(w)-1)
    %n=KofSOR(A,b,x0,w(k),1e-6,10000);
    %fprintf('w=%f n=%d\t',w(k),n);
    if(mod(k,5)==0)    
    %    disp('\n');
    end
end
%w=0.1:0.1:1.9;
%w=1.71:0.01:1.95;
w=1.81:0.001:1.85;
for k=1:length(w)
    n(k)=KofSOR(A,b,x0,w(k),1e-6,1000);
    if(mod(n,10))
        fprintf('\n');
    end
    fprintf('w=%f n=%d \t',w(k),n(k));
    %if(mod(k,5)==0)    
    %    disp('\n');
    %end
end
%n

strl=['D:\MATLAB\622\w_n_180_185'];
plot(w,n)
saveas(gca,strl,'jpg')
close


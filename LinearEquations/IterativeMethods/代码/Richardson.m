function K=Richardson(A,b,x0,TOL,MAX,m)
K=0;
strl_R=['D:\MATLAB\pic\R\pic_R_m='];
%[k123,err123]=Richardson(A,b,x0,TOL,MAX,m)
D=eig(A);
ncol=size(A,1);
X([1:ncol],1)=1;
%x=x0;
%求最大及最小特征值
max=D(1,1);
min=D(1,1);
for k=2:ncol
	if D(k,1)>=max
		max=D(k,1);
	end
	if D(k,1)<=min
		min=D(k,1);
	end
end
%max
%最大特征值
%min
%最小特征值
for k=1:m
    theta(k)=(2*k-1)*pi/(2*m);
    temp=(max-min)*cos(theta(k))/2+(max+min)/2;
    t(k)=1/temp;
end
%for k=1:m
%    fprintf('t(%d)=%f\t',k,t(k));
%end
%k123
for k=1:MAX
    %x1=x0;
    for j=1:m
        x=x0+t(j)*(b-A*x0);
        %x'
        x0=x;
        K=K+1;
    end
    %误差
    err1(k)=abs(norm(x-X));
    %残量
    err2(k)=abs(norm(A*x-b));
    %fprintf('err(%d)=%f',i,err);
    if(err1(k)<TOL)
        break;
    end
    %ERR(1:ncol,k)=x;
end
%k123=k;
figure;
x_axis=1:k;
%plot(x_axis,-log(err1));
%grid onxlabel(&#39;循环次数&#39;) 
%ylabel(&#39;误差曲线和残差曲线&#39;)

plot(x_axis,-log(err1),x_axis,-log(err2));
q1=-log(err1(k));
q2=-log(err2(k));
if(q1>q2)
    q=q1;
else
    q=q2;
end
title123=['循环指标 m=',num2str(m)];
title(title123);
xlabel('循环次数');
ylabel('误差曲线和残差曲线');
text(k/3,q*2/3,'误差');
text(2*k/3,q/3,'残差');
saveas(gca,[strl_R,num2str(m)],'jpg');
close

%K=k;



%title(&#39;&#39;)
%text(300,10,&#39;误差曲线&#39;)
%text(600,6,&#39;残差曲线&#39;)

%hold on;
%k,err
%x=x';

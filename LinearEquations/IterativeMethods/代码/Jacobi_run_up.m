function j= Jacobi_run_up( A,b,TOL,m )

D=eig(A);
ncol=size(A,1);

D1=zeros(ncol);
D2=diag(A);
%D2'
for i=1:ncol
    D1(i,i)=D2(i);
end
D3=inv(D1);

B=eye(ncol)-D3*A;
%B
g=D3*b;


%求最大及最小特征值
max=B(1,1);
min=B(1,1);
for i=2:ncol
	if B(i,1)>=max
		max=B(i,1);
	end
	if B(i,1)<=min
		min=B(i,1);
	end
end

v=2/(2-max-min);
l1=(2-max-min)/(max-min);

x0([1:ncol],1)=0;
x1=B*x0+g;
X([1:ncol],1)=1;
for j=1:100
    %y0=x0;
    %y1=x1;
    y=x0;
    for k=1:m
        p(k+1)=2*l1*Che(k,l1)/Che(k+1,l1);
        x=p(k+1)*(v*(B*x1+g)+(1-v)*x1)+(1-p(k+1))*x0;
        x0=x1;
        %y0=x0'
        x1=x;
        %y1=x';
    end

    err1(j)=abs(norm(x-X));
    err2(j)=abs(norm(x-y));
    if(err1(j)<TOL)
        break;
    end
end
%y=x';


    
strl_J_runup=['D:\MATLAB\625\pic_R_m='];
figure;
x_axis=1:j;
plot(x_axis,-log(err1),x_axis,-log(err2));
q1=-log(err1(k));
q2=-log(err2(k));
title123=['循环指标 m=',num2str(m)];
title(title123);
xlabel('迭代次数');
ylabel('误差曲线和残差曲线');
saveas(gca,[strl_J_runup,num2str(m)],'jpg');
close
















end


function [k1,err1]=KofJ(A,b,x0,TOL,n,choice)
%n=input('��ѡ������������:');
%choice=input('��ѡ��ͣ����׼. 1: ����, 2: �������, 3:�������    ');
N=length(b);
X([1:N],1)=1;
for k=1:n
	for j=1:N
        x(j)=(b(j)-A(j,[1:j-1,j+1:N])*x0([1:j-1,j+1:N]))/A(j,j);%x(j)=(b(j)-A(j,[1:j-1,j+1:N])*P([1:j-1,j+1:N]))/A(j,j);
	end
    
    %����
    if(choice==1) 
        err(k)=abs(norm(A*(x')-b));
    end
    %���ڲ���
    if(choice==2) 
        err(k)=abs(norm(x'-x0));
    end 
    %�������
    if(choice==3)
        temp3(k)=abs(norm(x'-x0));
        if(k>1)
            err(k)=abs(temp3(k)*temp3(k)/(temp3(k-1)-temp3(k)));    
        end
    end
    err(1)=1;
    x0=x';%fprintf('err(%d)=%f\t',k,err(k)); %if(mod(k,10)==0)%    disp('\n');%end
    if(err(k)<TOL) 
        break;
    end
    %
    k1=k;
    err1=abs(norm(x'-X));%err1=err(k);
    %x
    %X0'
end
%k,err
%plot(log(err))

        



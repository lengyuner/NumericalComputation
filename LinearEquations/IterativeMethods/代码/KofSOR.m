function k1=KofSOR(A,b,x0,w,TOL,M)
%M=1000;
%MΪ����������
ncol=length(b);
X([1:ncol],1)=1;
if(w<=0 || w>=2)
    %k1=M;
    error;
    return;
end
D=diag(diag(A)); %��A�ĶԽǾ���
L=-tril(A,-1); %��A����������
U=-triu(A,1); %��A����������
B=inv(D-L*w)*((1-w)*D+w*U);
f=w*inv((D-L*w))*b;
x=B*x0+f;
n=1; %��������
while norm(x-X)>=TOL
    x0=x;
    x=B*x0+f;
    %n
    %x'
    n=n+1;
    if(n>=M)
        fprintf('>MAX');
        %fprintf('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
    k1=n;
end 
%x'


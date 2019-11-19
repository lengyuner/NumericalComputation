function [x,r,k]=ydwyfmf(A,x0,r0,eps,M)
%��ԭ����λ�ķ��ݷ���ģ��С����ֵ����������
%r�ǰ�ģ��С����ֵ��xΪ��Ӧ��������
%AĿ�����x0Ϊ��ʼ������r0Ϊĳ����ֵ�Ľ���ֵ
%epsΪ����ޣ�MΪ������������
if nargin==2
    r0= 0;     %����ָ������ָ����Ϊ0
    eps= 1.0e-6;%��δָ������ȡĬ��ֵ
    M = 10000; %��δָ������ȡĬ��ֵ
elseif nargin ==3
    eps= 1.0e-6;%��δָ������ȡĬ��ֵ
    M = 10000; %��δָ������ȡĬ��ֵ
elseif nargin ==3
    M = 10000; %��δָ������ȡĬ��ֵ
elseif nargin<2
    error('��������');
    return
end
[n,m]=size(A);
%�������������е�ά�������ʱ��ֹͣ���㣬�����������Ϣ
if n~=m
    error('����A�����������������!');
    return;
end
I=eye(n);
B=zeros(n,n);
B=A-r0*I;
k=0;
u=1;
tol=1;
x=x0;
a = max(abs(x));
while tol>=eps
    y = x/a;
    [L,U,x]=Lu_x(B,y);    %��������
    a = max(abs(x));
    b = a;
    tol = abs((1/b)-(1/u));%ǰ������������������
    u = b;
    k = k+1;
    if(k>=M)
        disp('Warning: ��������̫�࣬���ʧ�ܣ�');
        return;
    end
end
r = r0 +(1/b);
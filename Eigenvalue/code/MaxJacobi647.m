function [ A0 ] = MaxJacobi647( A0,MAX )

[nrow,ncol]=size(A0);
TOL=1e-14;

Fnorm=0;
for i=1:(nrow-1)
    for j=(i+1):ncol
        Fnorm=Fnorm+A0(i,j)*A0(i,j);
    end
end
Fnorm=sqrt(2*Fnorm);
maxA=Fnorm/ncol;

for k=1:MAX
    
    ch=0;
    %Ѱ�ҳ�����ֵ��Ԫ��A(p,q)
    p=1;
    q=2;
    for i=1:(nrow-1)
        for j=(i+1):ncol
            if(abs(A0(i,j))>abs(maxA))
                p=i;
                q=j;
                ch=1;
                break;
            end
        end
        if(ch==1)
            break;
        end
    end
    %fprintf('A(%d,%d)=%f \n',p,q,maxA);
    
    b=(A0(p,p)-A0(q,q))/(2*A0(p,q));
    
    if(b>=0)
        t=1/(abs(b)+sqrt(1+b*b));
    else
        t=-1/(abs(b)+sqrt(1+b*b));
    end
  
    c=1/sqrt(1+t*t);
    s=t*c;
    
    
    A(p,p)=A0(p,p)+t*A0(p,q);
    A(q,q)=A0(q,q)-t*A0(p,q);
    %disp('cry kawayi');
    A(p,q)=0;
    A(q,p)=0;
    
    
    for i=1:nrow
        if(i~=p&&i~=q)
            A(i,p)=c*A0(i,p)+s*A0(i,q);
            A(i,q)=-s*A0(i,p)+c*A0(i,q);
        end
    end
    
    for j=1:ncol
        if(j~=p&&j~=q)
            A(p,j)=c*A0(p,j)+s*A0(q,j);
            A(q,j)=-s*A0(p,j)+c*A0(q,j);
        end
    end
    
    
    for i=1:nrow
        for j=1:ncol
            if(i~=p&&i~=q)
                if(j~=p&&j~=q)
                    A(i,j)=A0(i,j);
                end
            end
        end
    end
    
    
    A0=A;
    
    
    
	if(abs(maxA)<TOL)
        break;
    end
    
    
    if(ch==0)
%         maxA;
%         disp('11111111111111111111111111111111111111');
        maxA=maxA/ncol;
    end
    
    
    
    
    
    
end

   
    




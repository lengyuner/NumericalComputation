function [ B ] = RouteJacobi( A0,MAX )


K0=1;
[nrow,ncol]=size(A0);
MAX1=3000;
TOL=1e-14;



ch=0;
k1=0;
for k=1:MAX1
    %寻找超过阈值的元素A(p,q)
    
    
    for p=1:(nrow-1)
        for q=(p+1):ncol
            k1=k1+1;
            
            b=(A0(p,p)-A0(q,q))/(2*A0(p,q));
            
            if(b>=0)
                t=1/(abs(b)+sqrt(1+b*b));
            else
                t=-1/(abs(b)+sqrt(1+b*b));
            end
            
            c=1/sqrt(1+t*t);
            s=t*c;
            
            A=A0;
            
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
            Au=A0-tril(A0);
            if(k1>MAX)
                ch=1;
                break;
            end
            %             if(norm(Au)<TOL)
            %                 ch=1;
            %                 break;
            %             end
            
            if(mod(k1,100)==0)
                B(1:nrow,K0)=diag(A0);
                %B1=sort(diag(A0));
                %B(1:nrow,K0)=abs(B1-B0);
                K0=K0+1;
            end
            
            
        end
        if(ch==1)
            break;
        end
        
    end
    
    if(ch==1)
        break;
    end
end



Sa=diag(A0);
[s1,s2]=sort(Sa);
[mrow,mcol]=size(B);
for k=1:mrow
    B1(k,1:mcol)=B(s2(k),1:mcol);
end

B=B1;



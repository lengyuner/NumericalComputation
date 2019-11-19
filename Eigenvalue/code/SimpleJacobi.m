function [ B ] = SimpleJacobi( A0,MAX )


K0=1;
[nrow,ncol]=size(A0);
% MAX=300000;
TOL=1e-14;



% [V,D]=eig(A0);
% B0=diag(D);
% d=D(nrow,ncol);
% v=V(1:nrow,ncol);


for k=1:MAX
    %寻找绝对值最大的元素A(p,q)
    maxA=0;
    p=1;
    q=1;
    for i=1:(nrow-1)
        for j=(i+1):ncol
            if(abs(A0(i,j))>abs(maxA))
                p=i;
                q=j;
                maxA=A0(i,j);
            end
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
    
% 	if(abs(maxA)<TOL)
%         break;
%     end
    
    
    if(mod(k,100)==0)
        B(1:nrow,K0)=diag(A0);
        %B1=sort(diag(A0));
        %B(1:nrow,K0)=abs(B1-B0);
        K0=K0+1;
    end
    
end


Sa=diag(A0);
[s1,s2]=sort(Sa);
[mrow,mcol]=size(B);
for k=1:mrow
    B1(k,1:mcol)=B(s2(k),1:mcol);
end
    
B=B1;
   
    
       
% % %     for j=1:ncol
% % %         for i=1:nrow
% % %             if(i~=p&&j~=q)
% % %                 A(p,j)=c*A0(p,j)+s*A0(q,j);
% % %                 A(q,j)=-s*A0(p,j)+c*A0(q,j);
% % % 
% % %                 A(i,p)=c*A0(i,p)+s*A0(i,q);
% % %                 A(i,q)=-s*A0(i,p)+c*A0(i,q);
% % %                 A(i,j)=A0(i,j);
% % %             end
% % %         end
% % %     end



%     if(30*abs(A0(p,q))<abs(A0(p,p)-A0(q,q)))
%         t=1/(2*b);
%     else
%         if(b>=0)
%             t=1/(abs(b)+sqrt(1+b*b));
%         else
%             t=-1/(abs(b)+sqrt(1+b*b));
%         end
%     end
%     
function [ lambda ] = Dichotomy( A,a,b )


TOL=1e-14;
MAX=10000;

Sb=Sturm(A,b)
% 50
Sa=Sturm(A,a)
% 67
lambda(1:Sa-Sb)=0;

for K=Sb:(Sa-1)
    a=1;
    b=2;
    c=(a+b)/2;
    for k=1:MAX
        c=(a+b)/2;
        Sc=Sturm(A,c);
        if(Sc>=(K+1))
            a=c;
            c=(a+b)/2;
            Sc=Sturm(A,c);
        end

        if(Sc<=K)
            b=c;
            c=(a+b)/2;
            Sc=Sturm(A,c);
        end

        if(K==Sa)
            b
            Sturm(A,b)
            a
            Sturm(A,a)
        end
        if(abs(b-a)<TOL)
            lambda(Sa-K)=c;
            break;
        end
    end
   
end









% for K=Sa:Sb
%     for k=1:MAX
%         c=(a+b)/2;
%         Sc=Sturm(A,c);
%         if(Sc>=K+1)
%             b=c;
%         end
%         
%         c=(a+b)/2;
%         Sc=Sturm(A,c);
%         
%         if(Sc<=K)
%             a=c;
%         end
%         
%         c=(a+b)/2;
%         if(abs(b-a)<TOL)
%             lambda(K-Sa+1)=c;
%             break;
%         end
%     end
% end


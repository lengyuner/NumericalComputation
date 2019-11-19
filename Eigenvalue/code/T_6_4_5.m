clear all;


A=Tn(100);
b=2;
a=1;
Sturm(A,b);
Sturm(A,a);

[ lambda ] = Dichotomy( A,a,b )
k_lambda=length(lambda)

% for k=1:k_lambda
for k=1:k_lambda
    lambda(k)
    [ new_lambda(k),v,k,ERR ]=InversePower(A,lambda(k));
    new_lambda(k)
end
new_lambda
lambda-new_lambda
% ccc=log(lambda-new_lambda)
% ccc1'


% 
% d=eig(A);
% k1=1;
% 
% 
% for k=1:length(d)
%     if(d(k)>=a&&d(k)<=b)
%         d1(k1)=d(k);
%         k1=k1+1;
%     end
% end
% 
% 
% d1
% lambda-d1;

        















% A=Tn(5);
% eig(A)
% x=4.7;
% [s,p]=Sturm(A,x)


% 
% k=0;
% if(k>1)
%     disp('k>1');
% else if(k==1)
%         disp('k=1');
%     else
% 	disp('k<1');
% end
% end
    
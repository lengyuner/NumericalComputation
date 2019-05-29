%function [ output_args ] = Untitled2( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%x=ConjurateGraient(A,b,TOL,x0,n,p,delta0,delta1,k)

function ERR=ConjurateGraient(A,b,x0,TOL,MAX)
k=1;
x=x0;
ncol=length(b);
X([1:ncol],1)=1;
r=A*x-b;
p=-r;
delta0=r'*r;

while(k<=MAX)
    if(k==MAX+1)
        disp('Maximum number of iterations exceeded');
        return;
    end
    k=k+1;
    a=delta0/(p'*A*p);
    x=x+a*p;
    r=A*x-b;
    delta1=r'*r;
    beta=delta1/delta0;
    delta0=delta1;
    p=-r+beta*p;
    
    %ERR(k)=delta1;
    ERR(k)=abs(norm(x-X));
    if(ERR(k)<TOL&&k>=50)
        break;
    end
end
K=k;
%plot(1:K,-log(ERR));
%ncol=sqrt(ncol);
%strl=['D:\MATLAB\pic\CG_n=' num2str(ncol)];
%saveas(gca,strl,'jpg');
%close;
x=x';



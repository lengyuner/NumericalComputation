function [ A ] = f1_653( x )


x0=x(1);
y0=x(2);

A(1,1)=y0*y0-7; 
A(1,2)=(x0+3)*(2*y0);
A(2,1)=cos(y0*exp(x0)-1)*y0*exp(x0);
A(2,2)=cos(y0*exp(x0)-1)*exp(x0);
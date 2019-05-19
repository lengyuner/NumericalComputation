function [ u ] = u1_b( t,x )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

fun1 = @(y) (pi+y).*exp(-(y-x).^2./(4*t));
fun2 = @(y) (pi-y).*exp(-(y-x).^2./(4*t));

xmin1 = -pi;
xmax1 = pi;
q = integral(fun1,xmin1,0);
p = integral(fun2,0,xmax1);

u = q+p;
u1 = u;

for k = 1:10000
    fun1 = @(y) (pi+(y-k*2*pi)).*exp(-(y-x).^2./(4*t));
    fun2 = @(y) (pi-(y-k*2*pi)).*exp(-(y-x).^2./(4*t));

    xmin1 = k*2*pi-pi;
    xmax1 = k*2*pi;
    q = integral(fun1,xmin1,xmax1);
    xmin1 = k*2*pi;
    xmax1 = k*2*pi+pi;
    p = integral(fun2,xmin1,xmax1);

    u = u+q+p;
    
    fun1 = @(y) (pi+(y+k*2*pi)).*exp(-(y-x).^2./(4*t));
    fun2 = @(y) (pi-(y+k*2*pi)).*exp(-(y-x).^2./(4*t));
    
    xmin1 = -k*2*pi-pi;
    xmax1 = -k*2*pi;
    q = integral(fun1,xmin1,xmax1);
    xmin1 = -k*2*pi;
    xmax1 = -k*2*pi+pi;
    p = integral(fun2,xmin1,xmax1);
    u = u+q+p;
    if abs(u-u1)<1e-9
        break;
    end
    u1 = u;
end
u = u/(2*sqrt(pi*t));  
end
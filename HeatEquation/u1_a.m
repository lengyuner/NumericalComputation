function [ u ] = u1_a( t,x )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
fun = @(y) exp(-(y-x).^2./(4*t));
xmin1 = -pi/2;
xmax1 = pi/2;
q = integral(fun,xmin1,xmax1);
u = q;
u1 = u;

for k = 1:50
    xmin1 = k*2*pi-pi/2;
    xmax1 = k*2*pi+pi/2;
    q = integral(fun,xmin1,xmax1);
    u = u+q;
    xmin2 = -k*2*pi-pi/2;
    xmax2 = -k*2*pi+pi/2;
    q = integral(fun,xmin2,xmax2);
    u = u+q;    
    u1 = u;
end
u = u/(2*sqrt(pi*t));

% K=10000;
% u1=integral(fun,-K*2*pi-pi/2,K*2*pi+pi/2);
% u = u1/(2*sqrt(pi*t));

end


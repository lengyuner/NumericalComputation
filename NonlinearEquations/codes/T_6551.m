

x0(1,1)=2;
x0(2,1)=4;

M=5;


for M=2:8
    x=AdvancedNewton(x0,M);
    x
end


clear all;
x0(1,1)=2;
x0(2,1)=4;
x=AdvancedNewton(x0,2);
plot(x','-*')


clear all;
x0(1,1)=2;
x0(2,1)=4;
x=AdvancedNewton(x0,3);
plot(x','-*')



clear all;
x0(1,1)=2;
x0(2,1)=4;
x=AdvancedNewton(x0,4);
plot(x','-*')





clear all;
x0(1,1)=2;
x0(2,1)=4;
x=AdvancedNewton(x0,5);
plot(x','-*')












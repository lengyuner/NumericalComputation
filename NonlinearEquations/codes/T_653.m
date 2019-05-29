x0=[-0.15,1.4];
x0=x0';

 [ x1 ] = Newton2( x0 )
 [ x2 ] = Broyden( x0 ) 
 
 
%  plot(1:length(x1),x1,'-*',1:length(x1),x1,'-*')
%  plot(1:length(x1),-log(abs(x1(1,:))),'-*',1:length(x1),-log(abs(x1(2,:)-1)),'-*')
 
%  plot(1:length(x2),x2,'-*',1:length(x2),x2,'-*')
%  plot(1:length(x2),-log(abs(x2(1,:))),'-*',1:length(x2),-log(abs(x2(2,:)-1)),'-*')
 
 [ x3 ] = Newton2( [0,1]' )
 x3
 
%  plot(1:length(x3),-log(abs(x3(1,:))),'-*',1:length(x3),-log(abs(x3(2,:)-1)),'-*')
 
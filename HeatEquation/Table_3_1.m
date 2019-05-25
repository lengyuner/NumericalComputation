
clear all;
a=1;
T=1;
J=18;  % 36,72...
mu=0.4;

for k=1:3
    ERROR(k,1)=Table_a_yin(a,T,J,mu);    
    ERROR(k,3)=Table_b_yin(a,T,J,mu);
        
    ERROR(k,5)=Table_a_xian(a,T,J,mu);   
    ERROR(k,7)=Table_b_xian(a,T,J,mu);
    
    %ERROR(k,9)=Table_sin_xian(a,T,J,mu)
    J=J*2;
    ERROR(k,:)
end
     
for k=2:3 
    ERROR(k,2)=(log(ERROR(k-1,1))-log(ERROR(k,1)))/log(2);
    ERROR(k,4)=(log(ERROR(k-1,3))-log(ERROR(k,3)))/log(2);
        
    ERROR(k,6)=(log(ERROR(k-1,5))-log(ERROR(k,5)))/log(2);
    ERROR(k,8)=(log(ERROR(k-1,7))-log(ERROR(k,7)))/log(2);   
end
disp('隐式格式 离散边值的误差 误差阶   连续边值的误差 误差阶 ')
ERROR(:,1:4)
disp('显式格式 离散边值的误差 误差阶   连续边值的误差 误差阶 ')
ERROR(:,5:8)











%随机构造 20 -30 阶的可逆方阵，分别用
% CGS MGS Householder Givens
%给出相应的 QR 分解，比较上述四种方法
%关于列向量的正交性、CPU时间和向后稳定性表现

clear all;

A=rand(3);
%A=[]
%a=A(1:100,1);
%givens(1,1,a);
C=A(1:3,1:2);
[Q,R]=Givens(C);
E=Q'*Q
%E(1:8,1:8)
B=Q*R-C
%B(1:8,1:8)

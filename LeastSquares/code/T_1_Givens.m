%������� 20 -30 �׵Ŀ��淽�󣬷ֱ���
% CGS MGS Householder Givens
%������Ӧ�� QR �ֽ⣬�Ƚ��������ַ���
%�����������������ԡ�CPUʱ�������ȶ��Ա���

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

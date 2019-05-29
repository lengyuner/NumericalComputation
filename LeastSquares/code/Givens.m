function [ Q,R ] = Givens( A )
[m,n]=size(A);
R=A;

Q0=eye(m,m);


time=0;
for i=1:n
    for j=(i+1):m
        Q1=eye(m,m);
        [c,s]=given(R(i,i),R(j,i));
        Q1(i,i)=c;
        Q1(i,j)=-s;
        Q1(j,i)=s;
        Q1(j,j)=c;
        %R(i,i)=sqrt(R(i,i)*R(i,i)+R(j,i)*R(j,i));
        %R(j,i)=0;
        size(Q1);
        size(R);
        R=Q1'*R;
        size(Q0);
        Q0=Q0*Q1;
        time=time+1;
    end
end
Q=Q0;





%for i=1:n
    %for j=i
        %for k=(j+1):m
            %Q1=eye(m,n);
            %[c,s]=given(R(j,i),R(k,i));
            %[c,s]=givens(j,k,R(1:m,i));
            %Q1(j,j)=c;
            %Q1(j,k)=s;
            %Q1(k,j)=-s;
            %Q1(k,k)=c;
            
            %R(j,i)=sqrt(R(j,i)*R(j,i)+R(k,i)*R(k,i));
            %R(k,i)=0;
            
            %Q0=Q0*Q1;
        %end
    %end
%end
%Q=Q0;




%18 def givens_rotation(A):
%19     """Givens变换"""
%20     (r, c) = np.shape(A)
%21     Q = np.identity(r)
%22     R = np.copy(A)
%23     (rows, cols) = np.tril_indices(r, -1, c)
%24     for (row, col) in zip(rows, cols):
%25         if R[row, col] != 0:  # R[row, col]=0则c=1,s=0,R、Q不变
%26             r_ = np.hypot(R[col, col], R[row, col])  # d
%27             c = R[col, col]/r_
%28             s = -R[row, col]/r_
%29             G = np.identity(r)
%30             G[[col, row], [col, row]] = c
%31             G[row, col] = s
%32             G[col, row] = -s
%33             R = np.dot(G, R)  # R=G(n-1,n)*...*G(2n)*...*G(23,1n)*...*G(12)*A
%34             Q = np.dot(Q, G.T)  # Q=G(n-1,n).T*...*G(2n).T*...*G(23,1n).T*...*G(12).T
%35     return (Q, R)
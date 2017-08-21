
syms aa bb;
c=[aa bb]';
A=f_data;
B=cumsum(A);  %原始数据累加
n=length(A);
for i=1:(n-1)
    C(i)=(B(i)+B(i+1))/2; %生成累加矩阵
end
%计算待定参数的值
D=A;D(1)=[];
D=D';
E=[-C;ones(1,n-1)];
cc=inv(E*E')*E*D;
cc=cc';
aa=cc(1);bb=cc(2);
%预测后续数据
F=[];F(1)=A(1);
for i=2:(n+10)  %只推测后10个数据，可以从此修改
    F(i)=(A(1)-bb/aa)/exp(aa*(i-1))+bb/aa;
end
G=[];G(1)=A(1);
for i=2:(n+10)  %只推测后10个数据，可以从此修改
    G(i)=F(i)-F(i-1);  %得到预测出来的数据
end
plot(G);
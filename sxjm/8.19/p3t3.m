
syms aa bb;
c=[aa bb]';
A=f_data;
B=cumsum(A);  %ԭʼ�����ۼ�
n=length(A);
for i=1:(n-1)
    C(i)=(B(i)+B(i+1))/2; %�����ۼӾ���
end
%�������������ֵ
D=A;D(1)=[];
D=D';
E=[-C;ones(1,n-1)];
cc=inv(E*E')*E*D;
cc=cc';
aa=cc(1);bb=cc(2);
%Ԥ���������
F=[];F(1)=A(1);
for i=2:(n+10)  %ֻ�Ʋ��10�����ݣ����ԴӴ��޸�
    F(i)=(A(1)-bb/aa)/exp(aa*(i-1))+bb/aa;
end
G=[];G(1)=A(1);
for i=2:(n+10)  %ֻ�Ʋ��10�����ݣ����ԴӴ��޸�
    G(i)=F(i)-F(i-1);  %�õ�Ԥ�����������
end
plot(G);
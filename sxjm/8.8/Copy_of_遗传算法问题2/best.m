%-------------����˵��---------------- 

% ��������� 

% pop : ��Ⱥ

% fitvalue �� ��Ⱥ��Ӧ�� 

%

% ���������

% bestindividual �� ��Ѹ��壨˳����룩

% bestfit �� �����Ӧ��ֵ

%---------------------------------------

function [bestindividual,bestfit]=best(pop,fitvalue)

[px,py,pz]=size(pop);

bestindividual = pop(:,:,1);

bestfit = fitvalue(1);

for i=2:pz

if fitvalue(i)>bestfit

bestindividual = pop(:,:,i);

bestfit = fitvalue(i);

end

end

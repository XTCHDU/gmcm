%-------------����˵��---------------- 

% ���������

% pop:������Ⱥ

% pc������ĸ���

% ���������

% newpop����������Ⱥ�� (��������)

%---------------------------------------

function [newpop]=crossover(pop,pc)

[px,py,pz]=size(pop);

newpop = zeros(size(pop));

for i=1:pz

if(rand<pc)


[newpop1 newpop2]=CycleCrossover(pop(:,:,i),pop(:,:,randi([1,pz])));

newpop(:,:,i)=newpop1;

else

newpop(:,:,i)=pop(:,:,i);

end

end

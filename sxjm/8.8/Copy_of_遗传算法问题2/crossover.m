%-------------函数说明---------------- 

% 输入变量：

% pop:父代种群

% pc：交叉的概率

% 输出变量：

% newpop：交叉后的种群数 (数量不定)

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

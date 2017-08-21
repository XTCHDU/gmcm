%-------------函数说明---------------- 

% 输入变量： 

% pop : 种群

% fitvalue ： 种群适应度 

%

% 输出变量：

% bestindividual ： 最佳个体（顺序编码）

% bestfit ： 最佳适应度值

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

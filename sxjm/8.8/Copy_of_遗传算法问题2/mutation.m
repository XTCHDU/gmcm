%-------------函数说明---------------- 

% 输入变量：

% pop ： 种群

% pm ： 变异概率

% 输出变量：

% newpop ： 变异以后的种群

%---------------------------------------

function [newpop] = mutation(pop,pm)

[px,py,pz] = size(pop);

newpop = zeros(size(pop));

process_time=[3 4 1 2 6 1 4 7 5];

for i=1:pz

if(rand<pm)

mpoint1 = randi([1,py],1);
mpoint2 = randi([1,py],1);

newpop(:,:,i)=pop(:,:,i);
newpop(1,mpoint2,i) =pop(1,mpoint1,i);
newpop(1,mpoint1,i) =pop(1,mpoint2,i);
position=randi([1,9],1);
newpop(2,position,i)=randi([1,process_time(position)],1);
else

newpop(:,:,i)=pop(:,:,i);

end

end


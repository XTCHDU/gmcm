%-------------函数说明---------------- 

% 输入变量：

% pop ： 二进制种群

% fitvalue ： 适应度值

% 输出变量：

% newpop：选择以后的二进制种群

%---------------------------------------

function [newpop] = selection(pop,fitvalue)

%构造轮盘

[px,py,pz]=size(pop); 

totalfit = sum(fitvalue);

p_fitvalue = fitvalue/totalfit; 

p_fitvalue = cumsum(p_fitvalue);%概率求和排序

%-------

ms = sort(rand(pz,1));%从小到大排列

fitin = 1;

newin = 1;

while newin<=pz

if (ms(newin))<p_fitvalue(fitin)

newpop(:,:,newin)=pop(:,:,fitin);

newin=newin+1;

else fitin=fitin+1;

end

end
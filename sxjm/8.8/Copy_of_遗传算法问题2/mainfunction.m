clear
clc

ans=[23 22 1 4 21 9 19 20 2 3 5 6 7 8 24 10 11 25 12 13 14 15 16 26 17 18;
     3  4  1 2  6 1  4  7 5 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0  0  0];
 
popsize = 1000; %种群大小

chromlength = 26; %二进制编码长度

pc = 0.6; %交叉概率

pm = 0.3; %变异概率

pop = initpop(popsize,chromlength); %初始种群

for i=1:10

    newpop(:,:,i)=ans;
end

alpha=1;
profit=0;
bestscheme=zeros(1,chromlength);

for i=1:1000

 [newpop] = crossover(newpop,pc); %交叉操作

[newpop] = mutation(newpop,pm); %变异操作

pop = newpop; %更新种群

[objvalue fit_ability]=cal_objvalue(pop,alpha); %计算适应度值（函数值）

fitvalue = objvalue;

[bestindividual,bestfit]=best(pop,objvalue);%寻找最优解

[newpop] = selection(pop,fit_ability); %选择操作

if profit<bestfit
    bestscheme=bestindividual;
    profit=bestfit;
end

end

bestscheme;
[scheme profit]=transform(bestscheme);
scheme
profit


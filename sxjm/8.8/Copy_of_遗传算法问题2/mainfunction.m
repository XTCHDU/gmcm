clear
clc

ans=[23 22 1 4 21 9 19 20 2 3 5 6 7 8 24 10 11 25 12 13 14 15 16 26 17 18;
     3  4  1 2  6 1  4  7 5 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0  0  0];
 
popsize = 1000; %��Ⱥ��С

chromlength = 26; %�����Ʊ��볤��

pc = 0.6; %�������

pm = 0.3; %�������

pop = initpop(popsize,chromlength); %��ʼ��Ⱥ

for i=1:10

    newpop(:,:,i)=ans;
end

alpha=1;
profit=0;
bestscheme=zeros(1,chromlength);

for i=1:1000

 [newpop] = crossover(newpop,pc); %�������

[newpop] = mutation(newpop,pm); %�������

pop = newpop; %������Ⱥ

[objvalue fit_ability]=cal_objvalue(pop,alpha); %������Ӧ��ֵ������ֵ��

fitvalue = objvalue;

[bestindividual,bestfit]=best(pop,objvalue);%Ѱ�����Ž�

[newpop] = selection(pop,fit_ability); %ѡ�����

if profit<bestfit
    bestscheme=bestindividual;
    profit=bestfit;
end

end

bestscheme;
[scheme profit]=transform(bestscheme);
scheme
profit


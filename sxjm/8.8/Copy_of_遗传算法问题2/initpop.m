%-------------函数说明----------------

% 初始化种群大小

% 输入变量：

% popsize:种群大小

% chromlength：染色体长度--》顺序编码


% 输出变量：
%格式：产品批次号
%      对应产品生产顺序
%      对应产品生产几天
% pop：种群

%---------------------------------------

function pop = initpop(popsize,chromlength)

pop=zeros(2,chromlength,popsize);
process_time=[3 4 1 2 6 1 4 7 5];
for i=1:popsize    
    ans=rand(1,chromlength);
    [X ,Y]=sort(ans);
    pop(1,:,i)=Y;
    for s=1:9
        pop(2,s,i)=randi([1,process_time(s)],1);
    end
end

%-------------����˵��----------------

% ��ʼ����Ⱥ��С

% ���������

% popsize:��Ⱥ��С

% chromlength��Ⱦɫ�峤��--��˳�����


% ���������
%��ʽ����Ʒ���κ�
%      ��Ӧ��Ʒ����˳��
%      ��Ӧ��Ʒ��������
% pop����Ⱥ

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

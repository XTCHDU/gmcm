%-------------����˵��---------------- 

% ���������

% pop �� ��������Ⱥ

% fitvalue �� ��Ӧ��ֵ

% ���������

% newpop��ѡ���Ժ�Ķ�������Ⱥ

%---------------------------------------

function [newpop] = selection(pop,fitvalue)

%��������

[px,py,pz]=size(pop); 

totalfit = sum(fitvalue);

p_fitvalue = fitvalue/totalfit; 

p_fitvalue = cumsum(p_fitvalue);%�����������

%-------

ms = sort(rand(pz,1));%��С��������

fitin = 1;

newin = 1;

while newin<=pz

if (ms(newin))<p_fitvalue(fitin)

newpop(:,:,newin)=pop(:,:,fitin);

newin=newin+1;

else fitin=fitin+1;

end

end
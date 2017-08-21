function [newpop1 newpop2]=CycleCrossover(pop1,pop2)
newpop1=zeros(size(pop1));
newpop2=zeros(size(pop1));

count=0;
state=zeros(1,size(pop1,2));

for k=1:size(pop1,2)
    if state(k)==0
        ii=k;
        if mod(count,2)==0
            
            newpop1(:,ii)=pop1(:,ii);
            newpop2(:,ii)=pop2(:,ii);
            while pop2(1,ii)~=pop1(1,k)
                state(ii)=1;
                ii=find(pop1(1,:)==pop2(1,ii));
                newpop1(:,ii)=pop1(:,ii);
                newpop2(:,ii)=pop2(:,ii);
            end
            state(ii)=1;
        else
            
            newpop2(:,ii)=pop1(:,ii);
            newpop1(:,ii)=pop2(:,ii);
            while pop1(1,ii)~=pop2(1,k)
                 state(ii)=1;
                 ii=find(pop2(1,:)==pop1(1,ii));
                 newpop2(:,ii)=pop1(:,ii);
                 newpop1(:,ii)=pop2(:,ii);
            end
            state(ii)=1;
        end
        count=count+1;
    end 
end
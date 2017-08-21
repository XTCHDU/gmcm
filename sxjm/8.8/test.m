ans1=sum(data(:,4));
maxans=0;
k=0;
s=0;
for ii=1:36
    if ((ans1-min(f(50,61,ii,:)))>maxans)
        maxans=ans1-min(f(50,61,ii,:));
        k=ii-1;
        [zz,s]=min(f(50,61,ii,:));
    end
end
[maxans k s-1]
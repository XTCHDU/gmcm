function count=sweep(x,y)
global map;
count=0;
for ii=x-9.5:x+9.5
    for jj=y-9.5:y+9.5
        if (map(ii,jj)==0)
            map(ii,jj)=1;
            count=count+1;
        end
    end
end
            
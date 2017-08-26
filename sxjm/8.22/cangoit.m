function s=cangoit(x,y)
global map;
for ii=x-9.5:x+9.5
    for jj=y-9.5:y+9.5
        if (map(ii,jj)==-1)
            s=0;
            return;
        end
    end
end
s=1;
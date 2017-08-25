function ss=check(x,y,d,flag)
dy=[0,1,0,-1];
dx=[-1,0,1,0];

global map;
if (flag<4)
if (d==1 || d==3)
    xx=x+dx(d)*9.5;
    if (xx<=0 || xx>=702)
        ss=2;
        return ;
    end
    for yy=y-9.5:y+9.5
        if (map(xx,yy)==-1 )
            ss=2;
            return ;
        end
    end
    if (sum(map(xx,y-9.5:y+9.5))==20)
        ss=0;
        return;
    else
        if (map(xx,y-9.5)~=map(xx,y+10.5))
            ss=0;
            return;
        end
    end
else
    yy=y+dy(d)*9.5;
     if (yy<=0 || yy>=402)
        ss=2;
        return ;
    end
    for xx=x-9.5:x+9.5
        if (map(xx,yy)==-1 )
            ss=2;
            return ;
        end
    end
    if (sum(map(x-9.5:x+9.5,yy))==20)
        ss=0;
        return;
    else
        if (map(x-9.5,yy)~=map(x+10.5,yy))
            ss=0;
            return;
        end
    end
end

ss=1;
else
    if (d==1 || d==3)
    xx=x+dx(d)*9.5;
    if (xx<=0 || xx>=702)
        ss=2;
        return ;
    end
    for yy=y-8.5:y+8.5
        if (map(xx,yy)==0 )
            ss=1;
            return ;
        end
    end
    else
    yy=y+dy(d)*9.5;
     if (yy<=0 || yy>=402)
        ss=2;
        return ;
    end
    for xx=x-8.5:x+8.5
        if (map(xx,yy)==0 )
            ss=1;
            return ;
        end
    end
    end

ss=0;
end
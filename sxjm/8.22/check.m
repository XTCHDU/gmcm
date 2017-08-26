function ss=check(x,y,d,flag,pred)
dy=[0,1,0,-1];
dx=[-1,0,1,0];
global bx;
global by;
ss=1;
% if (dy(pred)>0)
%     y2=1;
% else
%     if (dy(pred)<0)
%         y1=-1;
%     end
% end
% if (dx(pred)>0)
%     x2=1;
% else
%     if (dx(pred)<0)
%         x1=-1;
%     end
% end
global map;

if (d==1 || d==3)
    xx=x+dx(d)*9.5;
    if (xx<=0 || xx>=bx)
        ss=2;
        return ;
    end
    for yy=y-9.5:y+9.5
        if (map(xx,yy)==-1 )
            ss=2;
            
        end
    end
    if (sum(map(xx,y-9.5:y+9.5))==20)
        ss=0;
        
    else
        if (sum(map(xx,y-9.5:y+9.5))==0 && ss~=2)
            ss=1;
        else
        if (ss~=2 && ((map(xx,y-10.5)~=0 && map(xx,y+9.5)~=0)|| (map(xx,y-9.5)~=0 && map(xx,y+10.5)~=0) )  )
            ss=3;
        else
            if ( ismember(0,map(xx,y-9.5:y+9.5)) )
                if (d~=pred)
                    ss=4;
                else
                    ss=5;
                end
            end
            
        end
        end
    end
else
    yy=y+dy(d)*9.5;
     if (yy<=0 || yy>=by)
        ss=2;
       
    end
    for xx=x-9.5:x+9.5
        if (map(xx,yy)==-1 )
            ss=2;
           
        end
    end
    if (sum(map(x-9.5:x+9.5,yy))==20)
        ss=0;
    else
         if (sum(map(x-9.5:x+9.5,yy))==0 && ss~=2)
            ss=1;
         else
    if (ss~=2 && ((map(x-10.5,yy)~=0 && map(x+9.5,yy)~=0) ||  (map(x-9.5,yy)~=0 && map(x+10.5,yy)~=0))  )
        ss=3;
    else
        if ( ismember(0,map(x-9.5:x+9.5,yy)) )
            if (d~=pred)
                ss=4;
            else
                ss=5;
            end
        end
    end
    end
    end
end
    



% else
%     if (d==1 || d==3)
%     xx=x+dx(d)*9.5;
%     if (xx<=0 || xx>=702)
%         ss=2;
%         return ;
%     end
%     for yy=y-8.5:y+8.5
%         if (map(xx,yy)==0 )
%             ss=1;
%             return ;
%         end
%     end
%     else
%     yy=y+dy(d)*9.5;
%      if (yy<=0 || yy>=402)
%         ss=2;
%         return ;
%     end
%     for xx=x-8.5:x+8.5
%         if (map(xx,yy)==0 )
%             ss=1;
%             return ;
%         end
%     end
%     end
% 
% ss=0;
% end
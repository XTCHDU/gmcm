dy=[0,1,0,-1];
dx=[-1,0,1,0];
%1ио 2ср
global map;
% map=zeros(700,400);
% map(1:700,1)=2;
% map(1:700,400)=2;
% map(1,1:400)=2;
% map(700,1:400)=2;
map=qj;
ssss=702*402+sum(sum(map));
nowx=11.5;
nowy=11.5;
sweeped=sweep(nowx,nowy);
direct=3;
square=698*398;
visit=zeros(1000,1000,4);
way=zeros(280000,2);
count=0;
steptime=0;
clear ansx;
clear ansy;
ansx(1)=nowx;
ansy(1)=nowy;
crazymode=1;
visit(nowx+0.5,nowy+0.5,direct)=1;
boom=0;
while(sweeped<ssss*0.98)
    boom=boom+crazymode;
    crazymode=1;
    temp=mod(direct,4)+1;
    lastdirect=direct;
%     if (nowx==671.5 && nowy==81.5)
% 
% 	end
    if (check(nowx+dx(temp),nowy+dy(temp),temp,0))
        direct=temp;
    end
    newx=nowx+dx(direct);
    newy=nowy+dy(direct);
    flag=0;
  
    while ((check(newx,newy,direct,flag)~=1)  )
%         if (flag>=8)
%                 findway(nowx,nowy,)
%             end
        flag=flag+1;
%        if (flag>=30 && (check(newx,newy,direct,flag)~=2)&& visit(newx+0.5,newy+0.5,direct)~=1     )
%            break;
%        end
        direct=direct-1;
        if (direct==0) direct=4; end
        newx=nowx+dx(direct);
        newy=nowy+dy(direct);
    end
   
    visit(newx+0.5,newy+0.5,direct)=1;
    if (lastdirect~=direct)
        count=count+1;
        ansx(count+1)=nowx;
        ansy(count+1)=nowy;
%         way(count,1)=lastdirect;
%         way(count,2)=steptime;
%         steptime=0;
%          [way(count,1) way(count,2)];
        imagesc(map)
        hold on;
        plot(nowy,nowx,'go-');
         
    end
    steptime=steptime+1;
    sweeped=sweeped+sweep(newx,newy)
    nowx=newx;
    nowy=newy;
   
end
  plot(ansx,ansy)
clear all;
dy=[0,1,0,-1];
dx=[-1,0,1,0];
%1ио 2ср
yxj=[3,0,1,2,4,5];

load('tu2.mat');
load('tu1.mat');
global map;
% map=zeros(700,400);
% map(1:700,1)=2;
% map(1:700,400)=2;
% map(1,1:400)=2;
% map(700,1:400)=2;
map=qj;
global bx;
global by
[bx,by]=size(map);
ssss=bx*by+sum(sum(map));
nowx=11.5;
nowy=11.5;
sweeped=sweep(nowx,nowy);
direct=3;
visit=zeros(1000,1000,4);
way=zeros(280000,2);
count=1;
steptime=0;
clear ansx;
clear ansy;
ansx(1)=nowx;
ansy(1)=nowy;
way(1,1)=direct;
way(1,2)=0;
crazymode=1;
visit(nowx+0.5,nowy+0.5,direct)=1;
boom=0;
ptime=0;
while(sweeped<ssss-60)
    boom=boom+1;
    crazymode=1;
    found=0;
    ff=6;
    fx=0;
    fy=0;
    fd=0;
    temp=mod(direct,4)+1;
    lastdirect=direct;
    if (nowx==401.5 && nowy==289.5)

    end
    kk=check(nowx+dx(temp),nowy+dy(temp),temp,0,lastdirect);
    if (kk==1 || kk==3)
        direct=temp;
        found=1;
    end
    if (kk==4 && cangoit(nowx+dx(lastdirect),nowy+dy(lastdirect)))
        if (crazy==0)
        newx=nowx+dx(lastdirect);
        newy=nowy+dy(lastdirect);
        direct=lastdirect;
        else
            newx=nowx+dx(direct);
            newy=nowy+dy(direct);
        end
        found=1;
    else
    newx=nowx+dx(direct);
    newy=nowy+dy(direct);
    flag=0;
    kk=check(newx,newy,direct,flag,lastdirect);
    if (kk==2)
        ptime=ptime+1;
    end
     if (kk==5)
          ff=kk;
                    fd=direct-1;
                    if (fd==0) 
                        fd=4;
                    end
                    fx=nowx+dx(fd);
                    fy=nowy+dy(fd);
                    if (cangoit(fx,fy))
                        found=1;
                    end
      end
    if (kk==1 || kk==3 || kk==4)
            if (yxj(kk)<yxj(ff))
                ff=kk;
                fx=newx;
                fy=newy;
                fd=direct;
                found=1;
               
            end
        end
    crazy=0;
    while ( found~=1)
        if (flag>=4)
              nowx=ansx(count-crazy);
              nowy=ansy(count-crazy);
              crazy=crazy+1;
              direct=way(count-crazy,1);
              lastdirect=direct;
             flag=0;
             boom=boom+way(count-crazy,2);
       

                
        end
        flag=flag+1;
%        if (flag>=30 && (check(newx,newy,direct,flag)~=2)&& visit(newx+0.5,newy+0.5,direct)~=1     )
%            break;
%        end
        changedirect=direct;
%          if (flag==1)
%              direct=mod(direct,4)+2;
%          end
        direct=direct-1;
        if (direct==0) direct=4; end
        newx=nowx+dx(direct);
        newy=nowy+dy(direct);
        kk=check(newx,newy,direct,flag,lastdirect);
        if (kk==2)
            ptime=ptime+1;
        end
        if (kk==1 || kk==3 || kk==4)
            if (yxj(kk)<yxj(ff))
                ff=kk;
                fx=newx;
                fy=newy;
                fd=direct;
                found=1;
            end
        end
                
                
    end
 
    if (ff==4)
         if (crazy==0)
        newx=nowx+dx(lastdirect);
        newy=nowy+dy(lastdirect);
        direct=lastdirect;
        else
            newx=nowx+dx(direct);
            newy=nowy+dy(direct);
        end
        
    else
        newx=fx;
        newy=fy;
        direct=fd;
    end
    end
    visit(newx+0.5,newy+0.5,direct)=1;
    if (lastdirect~=direct )
        count=count+1;
        ansx(count)=nowx;
        ansy(count)=nowy;
        way(count,1)=lastdirect;
        way(count,2)=steptime;
        steptime=0;
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
  boom/25+ptime
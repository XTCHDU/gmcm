point=576;%观测点数
k=4;
mon=[31,28,31,30,31,30,31,31,30,31,30,31];
f=zeros(20,1000);
for ii=1:point;
    p=dhfl(ii,k-1);
    f(p,800)=f(p,800)+1;
    f(p,f(p,800))=ii;
end
L=3;
f_data=zeros(1,3285);
count=0;
for ii=1:3287
    if (ii==425 || ii==1886) 
        continue;
    end
    count=count+1;
    for jj=1:f(L,800)
        
        f_data(count)=f_data(count)+hzw(ii,f(L,jj));
    end
    f_data(count)=f_data(count)/f(L,800);
end
ans1=zeros(1,12);
monmax=zeros(1,12);
monmin=zeros(1,12)+9999;
posmin=zeros(9,12)+9999;
posmax=zeros(9,12);

    for ii=1:12
        for kk=1:9
            temp=0;
        for jj=1:mon(ii)
            temp=temp+f_data(sum(mon(1:ii-1))+(kk-1)*365+jj);
            posmin(kk,ii)=min(posmin(kk,ii),f_data(sum(mon(1:ii-1))+(kk-1)*365+jj));
            posmax(kk,ii)=max(posmax(kk,ii),f_data(sum(mon(1:ii-1))+(kk-1)*365+jj));
            %ans1(ii)=ans1(ii)+f_data(sum(mon(1:ii-1))+(kk-1)*365+jj);
        end
        ans1(ii)=ans1(ii)+temp;
        temp=temp/mon(ii);
        monmin(ii)=min(monmin(ii),temp);
        monmax(ii)=max(monmax(ii),temp);
        end
        ans1(ii)=ans1(ii)/mon(ii)/9;
    end
    for ii=1:9
         ave(ii)=sum(f_data(1+(ii-1)*365:ii*365))/365;
         gao(ii)=max(f_data(1+(ii-1)*365:ii*365));
         di(ii)=min(f_data(1+(ii-1)*365:ii*365));
    end
%     plot(1:9,gao);
%     xlabel('年份');
%     ylabel(' 温度');
%     hold on;
%     plot(di,'r--');
%     plot(ans1,'b');
%     xlabel('月份');
%     ylabel('平均温度');
%     hold on;
%     plot(monmax,'r--');
%     plot(monmin,'r--');
%      set(gca,'XTick',1:12)

%以上为月平均图，以下为温度趋势图

% plot(f_data,'b');
% ylabel('温度');
% xlabel('天数')
% fun=@(a,x) a(1)*x+a(2);
% [xl,~]=lsqcurvefit(fun,[0,0],1:count,f_data);
% hold on;
% xx=1:count;
% plot(xx,xx.*xl(1)+xl(2),'r');
% 
% %xl=polyfit(1:count,f_data,1);
% yy=xl(1)*(1:count)+xl(2);
% corrcoef(f_data,yy)
%以下为低通滤波
% plot((-1023:1024)/2048,abs(fftshift(fft(f_data,2048))));
%  xlabel('频率(hz)');
% copyx=f_data(1:200:3285);
% dd=filter(Hlp4,copyx);
% plot(dd);
%以下为参数拟合
xx=1:3285;
 fun=@(a,x) a(1)*sin(2*pi/365*x+a(2))+a(3)*sin(2*pi/730*x+a(4))+a(5)*sin(2*pi/1095*x+a(6))+a(7)*sin(2*pi/1460*x+a(8))+a(9);
 [xl,~]=lsqcurvefit(fun,[0,0,0,0,0,0,0,0,20],1:count,f_data);
 cnm=xl(1)*sin(2*pi/365*xx+xl(2))+xl(3)*sin(2*pi/730*xx+xl(4))+xl(5)*sin(2*pi/1095*xx+xl(6))+xl(7)*sin(2*pi/1460*xx+xl(8))+xl(9);
 plot(cnm,'r');
 
 
 
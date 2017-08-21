boyvsgirl=1.08;
p_num=zeros(33,101,3);
Nmax=100;
for ii=1:5
    for jj=0:110
        for kk=1:3
%             if (jj>=90) p_num(ii,91,kk)=p_num(ii,91,kk)+data(jj+2,ii*3-2+kk);
%             else
            p_num(ii,jj+1,kk)=data(jj+2,ii*3-2+kk);
%             end
        end
    end
end


for jj=1:Nmax
    temp=0;
    for ii=1:4
     d1(ii,jj)=(p_num(ii,jj,1)-p_num(ii+1,jj+1,1))/p_num(ii,jj,1);
     temp=temp+d1(ii,jj);
    end
    d(jj)=temp/4;
end
temp=p_num(1,19:50,3)';
for ii=2:4
temp=[ temp p_num(ii,19:50,3)'];
end

f=@(a,x) a(1)*chi2pdf(1:32,a(2))*x;
[g_est, res1]=lsqcurvefit(f,[1,1],temp,p_num(2:5,1,1)');
syl=zeros(1,91);
syl(19:50)=g_est(1)*chi2pdf(1:32,g_est(2));
plot(18:49,syl(19:50));
for ii=6:33
    for jj=2:(Nmax+1)
        p_num(ii,jj,2)=p_num(ii-1,jj-1,2)*(1-d(jj-1));
        p_num(ii,jj,3)=p_num(ii-1,jj-1,3)*(1-d(jj-1));
        p_num(ii,jj,1)=p_num(ii,jj,2)+p_num(ii,jj,3);
    end
    p_num(ii,1,1)=round(syl(19:50)*p_num(ii-1,19:50,3)'*(1+0.37/1.63));
    p_num(ii,1,2)=round(p_num(ii,1,1)/(1+boyvsgirl));
    p_num(ii,1,3)=p_num(ii,1,1)-p_num(ii,1,2);
end

%       for ii=1:33
%           ans(ii)=0;
%           ans(ii)=sum(p_num(ii,:,1));
%       end
%       plot(2003:2035,ans)
% 
      plot(0:Nmax,p_num(1,1:(Nmax+1),1))
      figure(2)
      plot(0:Nmax,p_num(33,1:(Nmax+1),1))
        laolinghua=sum(p_num(33,66:(Nmax+1),1))/sum(p_num(33,:,1))
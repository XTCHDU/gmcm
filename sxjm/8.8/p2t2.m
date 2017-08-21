count=0;
for ii=1:26
    if (data(ii,1)<20)
        for jj=1:data(ii,2)
            count=count+1;
            p(count,1)=data(ii,3);
            p(count,2)=1;
            p(count,3)=(data(ii,4)-data(ii,5))/data(ii,2);
            p(count,4)=data(ii,4);
            p(count,5)=1;
        end
    else
            count=count+1;
            p(count,1)=data(ii,3);
            p(count,2)=data(ii,2);
            p(count,3)=data(ii,4)-data(ii,5);
            p(count,4)=data(ii,4);
            p(count,5)=2;
    end
end
%1是D
%2是W
%3是C 
clear path;
clear yq;
clear bz;
ans1=sum(data(:,4));
path=cell(50,61,61,61);
bz=cell(50,61,61,61);
yq=zeros(50,61,61,61,61);
 f=zeros(50,61,61,61)+9999999;

 for ii=0:60
     if (ii<p(1,2))
         for ll=p(1,2):60
         f(1,ii+1,1,ll+1)=p(1,3);
         temp=yq(1,ii+1,1,ll+1,61)+1;
         yq(1,ii+1,ll+1,61)=temp;
         yq(1,ii+1,1,ll+1,temp)=1;
         
         end
     else
         for ll=0:60
         f(1,ii+1,1,ll+1)=0;
         path{1,ii+1,1,ll+1}='1';
         end
     end
 end
 for ii=2:50
     ii
     for jj=0:60
         for kk=0:min(jj,51)
             for ll=0:60
             if (p(ii,5)==2)
                 ss=p(ii,2);
             else
                 ss=0;
             end
         a=f(ii-1,jj+1,kk+1,ll+1)+p(ii,4);%不做
         if (min(jj,p(ii,1))-p(ii,2)+1>0 && kk+1-ss>0)
         b=f(ii-1,min(jj,p(ii,1))-p(ii,2)+1,kk+1-ss,ll+1);
         else
             b=99999999;
         end
         if (ll+1-p(ii,2)>0 && kk+1-ss>0)
         c=f(ii-1,jj+1,kk+1-ss,ll+1-p(ii,2))+p(ii,3);
         else
             c=9999999;
         end
         if (jj<p(ii,2))
            if (a<c)
             f(ii,jj+1,kk+1,ll+1)=a;
%              path(ii,jj+1,kk+1,ll+1)=path(ii-1,jj+1,kk+1,ll+1);
%              bz(ii,jj+1,kk+1,ll+1)=strcat(bz(ii-1,jj+1,kk+1,ll+1),int2str(ii));
            else
                f(ii,jj+1,kk+1,ll+1)=c;
%                 if (ll+1-p(ii,2)>0 && kk+1-ss>0)
% %                 path(ii,jj+1,kk+1,ll+1)=path(ii-1,jj+1,kk+1-ss,ll+1-p(ii,2));
% %                 bz(ii,jj+1,kk+1)=bz(ii-1,jj+1,kk+1-ss,ll+1-p(ii,2));
%                 end
            end
             
         else
%              if (a<b)
%                  f(ii,jj+1,kk+1)=a;
% %                  path(ii,jj+1,kk+1)=path(ii-1,jj+1,kk+1);
% %                  bz(ii,jj+1,kk+1)=strcat(bz(ii-1,jj+1,kk+1),int2str(ii));
%              else
%                  f(ii,jj+1,kk+1)=b;
% %                  path(ii,jj+1,kk+1)=strcat(path(ii-1,min(jj,p(ii,1))-p(ii,2)+1,kk+1-ss),int2str(ii));
% %                  bz(ii,jj+1,kk+1)=bz(ii-1,min(jj,p(ii,1))-p(ii,2)+1,kk+1-ss);
%              end
%                 f(ii,jj+1,kk+1,ll+1)=min(min(a,b),c);
                    if (a<b)
                        if (a<c)
                            f(ii,jj+1,kk+1,ll+1)=a;
%                              path(ii,jj+1,kk+1,ll+1)=path(ii-1,jj+1,kk+1,ll+1);
%              bz(ii,jj+1,kk+1,ll+1)=strcat(bz(ii-1,jj+1,kk+1,ll+1),int2str(ii));
                        else
                            f(ii,jj+1,kk+1,ll+1)=c;
%                              if (ll+1-p(ii,2)>0 && kk+1-ss>0)
% %                              path(ii,jj+1,kk+1,ll+1)=path(ii-1,jj+1,kk+1-ss,ll+1-p(ii,2));
% %                 bz(ii,jj+1,kk+1)=bz(ii-1,jj+1,kk+1-ss,ll+1-p(ii,2));
%                              end
                        end
                    else
                        if (b<c)
                            f(ii,jj+1,kk+1,ll+1)=b;
                             if (min(jj,p(ii,1))-p(ii,2)+1>0 && kk+1-ss>0)
                                 temp=yq(ii,jj+1,kk+1,ll+1,61)+1;
                                 yq(ii,jj+1,kk+1,ll+1,61)=temp;
                            yq(ii,jj+1,kk+1,ll+1,1:temp-1)=yq(ii-1,min(jj,p(ii,1))-p(ii,2)+1,kk+1-ss,ll+1,1:temp-1);
                            yq(ii,jj+1,kk+1,ll+1,1:temp)=ii;
%                            path(ii,jj+1,kk+1,ll+1)=strcat(path(ii-1,min(jj,p(ii,1))-p(ii,2)+1,kk+1-ss,ll+1),int2str(ii));
%                            bz(ii,jj+1,kk+1,ll+1)=bz(ii-1,min(jj,p(ii,1))-p(ii,2)+1,kk+1-ss,ll+1);
                        else
                            f(ii,jj+1,kk+1,ll+1)=c;
%                             if (ll+1-p(ii,2)>0 && kk+1-ss>0)
% %                              path(ii,jj+1,kk+1,ll+1)=path(ii-1,jj+1,kk+1-ss,ll+1-p(ii,2));
% %                 bz(ii,jj+1,kk+1)=bz(ii-1,jj+1,kk+1-ss,ll+1-p(ii,2));
                            end
                        end
                    end
         end
             end
         end
     end
 end
[path(50,61,36,21) bz(50,61,36,21)]

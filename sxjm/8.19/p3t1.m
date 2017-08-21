point=576;%¹Û²âµãÊý
for k=4
    k
f=zeros(20,1000);
for ii=1:point;
    p=dhfl(ii,k-1);
    f(p,800)=f(p,800)+1;
    f(p,f(p,800))=ii;
end
% for ii=1:k
%     for jj=1:f(ii,500)
%         now=f(ii,jj);
%         for ss=1:
%         
%     
a=zeros(k,577);
b=zeros(k,577);
s=zeros(k,577);
for i=1:k
    for j=1:f(i,800)
        for s=1:f(i,800)
        l=sum((dhdata(:,f(i,j))-dhdata(:,f(i,s))).^2);
        a(i,j)=a(i,j)+sqrt(l);
        
        end
        a(i,j)=a(i,j)/(f(i,800)-1);
    end
end
b=zeros(k,577);
temp=100;
for ii=1:k
     for jj=1:f(ii,800)
         temp=100;
         for mm=1:k
             if (ii==mm) 
                 continue;
             end
             b(ii,jj)=0;
             for nn=1:f(mm,800)
                 
                 ll=sum((dhdata(:,f(ii,jj))-dhdata(:,f(mm,nn))).^2);
                 b(ii,jj)=b(ii,jj)+sqrt(ll);
                 
                
             end
             b(ii,jj)=b(ii,jj)/(f(mm,800)-1);
             if(b(ii,jj)<temp)
             temp=b(ii,jj);
            end
         end
        b(ii,jj)=temp;  
        s(ii,jj)=(b(ii,jj)-a(ii,jj))/max(a(ii,jj),b(ii,jj));
     end
end
ans1(k)=sum(sum(s))/point;
end
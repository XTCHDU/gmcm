w=[1,3,4,7,5,4,6,2,1];
v=[800,400;750,500;3000,1500;5600,4000;4500,2000;1200,900;
    2500,1800;900,750;500,300;];
	d=[3,5,5,6,6,9,10,12,24];
 c=v(:,1)-v(:,2);
 f=zeros(9,34)+99999;
 path=zeros(9,34);
 for ii=0:33
     if (ii<w(1))
         f(1,ii+1)=c(1);
     else
         f(1,ii+1)=0;
         path(1,ii+1)=1;
     end
 end
 for ii=2:9
     for jj=0:33
         a=f(ii-1,jj+1)+c(ii);
         if (min(jj,d(ii))-w(ii)+1>0)
         b=f(ii-1,min(jj,d(ii))-w(ii)+1);
         else
             b=99999;
         end
         if (jj<w(ii))
            f(ii,jj+1)=a;
            path(ii,jj+1)=path(ii-1,jj+1);
         else
             if (a<b)
                 f(ii,jj+1)=a;
                 path(ii,jj+1)=path(ii-1,jj+1);
             else
                 f(ii,jj+1)=b;
                 path(ii,jj+1)=path(ii-1,min(jj,d(ii))-w(ii)+1)*10+ii;
             end
         end
     end
 end
 
sum(v(:,1))-f(9,25)
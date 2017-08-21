pop(:,:,1) =[10     4     1     5     2     3     8     6     7     9
              3     4     1     1     3     1     1     7     4     0];
 
 pop(:,:,2) =[10     7     4     2     8     9     5     3     1     6
               3     4     1     1     6     1     1     2     2     0];
alpha=1;
[objvalue fit_ability]=cal_objvalue(pop(:,:,1),alpha)

%-------------函数说明----------------

% 计算函数目标值

% 输入变量：

% 输出变量：

% 目标函数值

%---------------------------------------

function [objvalue fit_ability]=cal_objvalue(pop,alpha)

process_time=[3 4 1 2 6 1 4 7 5 2 1 1 1 3 5 2 4 6 5 1 3 1 5 6 3 2]; %对应产品批次的加工时间（天）

deadline=[5 9 3 12 10 24 5 6 6 10 15 15 20 20 20 25 28 30 30 30 40 40 45 50 60 60];  %对应产品批次的交货期限

profit_on_time=[750 1200 800 900 2500 500 3000 5600 4500 1000 700 900 750 750 1000 1250 1600 1800 2500 500 1700 650 1500 1800 1200 800];
profit_over_time=[500 900 400 750 1800 300 1500 4000 2000 0 0 720 600 0 800 1000 1280 1440 200 0 1190 450 1050 1260 660 500];

for i=1:size(pop,3)
    
    objvalue(i)=0;
    day25=0;
    day60=0;
    type_num=0;
    for s=1:26
        position=find(pop(1,:,i)==s);
        if position<=9
            type_num = type_num+1;
            day60=day60+pop(2,position,i);
            day25=day25+pop(2,position,i);
            if day60<=60
                if day60<=deadline(position)
                    temp_value=profit_on_time(position)/process_time(position)*pop(2,position,i);
                else
                    temp_value=profit_over_time(position);
                end
                objvalue(i)=objvalue(i)+temp_value;
            else
                day25=day25-pop(2,position,i);
                break;
            end
        else
            day60=day60+process_time(position);
            if day60<=60
                if day60<=deadline(position)
                    temp_value=profit_on_time(position);
                else
                    temp_value=profit_over_time(position);
                end
                objvalue(i)=objvalue(i)+temp_value;
            else
                break;
            end
        end
    end
    
    if day25>25
        Z=0;
    else
        Z=(25-day25)/25;
        objvalue(i)=10000;
    end
    
    fit_ability(i)=objvalue(i)*(type_num/9)*power((1-Z),alpha);
end


close all;
clear vars;
p1 = "E:\AI_and_ML\ASCII_Chaos\pointtest\";
S = dir(fullfile(p1,'*.csv'));
summ = (1:10);

for i = 1:length(S)
    data = csvread(p1+S(i).name);

    for k = 1:size(data,1)
    if (data(k,2) == data(k,3));
        summ(k,i) = data(k,2);
    elseif  ( data(k,3) == data(k,4)| data(k,2) == data(k,4));
        summ(k,i) = data(k,4);  
    end
    end 
end

csvwrite(p1+"summary.csv",summ);
close all;
clear vars;

% make sure these 2 folders exist
purePath = "E:\AI_and_ML\ASCII_Chaos\pointtest\pure\";
wpath = "E:\AI_and_ML\ASCII_Chaos\pointtest\";

pureFiles = dir(fullfile(purePath,'*.csv'));


for k = 1:(length(pureFiles)/2)
    for r = 0:1
        baseFileName1 = pureFiles(2*k + r -1).name;
        fullFileName1 = fullfile(purePath, baseFileName1);
        fprintf(1, 'Now reading %s\n', baseFileName1);
        data1 = csvread(fullFileName1);
        csvfilename = "trial"+num2str(k)+"weight"+num2str(r+1)+".csv";
        A = [1:4];
        for m = 1:size(data1,2)
            x1 = data1(:,m);
            disp("Var"+m)
            x1=x1';
            y1=[];
            y1=y1';
            fid=fopen('logi1.dat','wt');
            fprintf(fid,'%f\n',x1);
            fclose(fid);
            system('lyap_r -m2 -r20 -d1 -s20 -V0 -o logi1_lyap.dat logi1.dat');
            y1=load('logi1_lyap.dat');
            if (length(y1(:,1))>5)
            %pause(1);
            %plot(y1(:,1),y1(:,2));
            %pure    
            y_1 = interp1(y1(:,1),y1(:,2),[1 2.5],'linear');
            y_2 = interp1(y1(:,1),y1(:,2),[0.75 1],'linear');
            y_3= interp1(y1(:,1),y1(:,2),[0.5 0.6],'linear');
            y_4= interp1(y1(:,1),y1(:,2),[0.25 0.75],'linear');
    
            slope1 = (y_1(2)-y_1(1))/(2.5-1);
            slope2 = (y_2(2)-y_2(1))/(1-0.75);
            slope3 = (y_3(2)-y_3(1))/(0.6-0.5);
            slope4 = (y_4(2)-y_4(1))/(.75-.25);
    
            M = [slope1 , slope2,  slope3 , slope4];
        
            A = [A;M];
            %save(slope.dat,slope,'-append')
            %dlmwrite(fid1, slope, '-append')
            end 
        end
    csvwrite(wpath+csvfilename,A);
  % all of your actions for filtering and plotting go here
    end
end
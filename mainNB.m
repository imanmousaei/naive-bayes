%% problem : 
%   determine gender by height, weight & foot size


%% clear everything
clc
clear
close all


%% constants
classesNo = 2;
featuresNo = 3;

%% trainig data 
fr(1,:) = [6, 5.92, 5.58, 5.92, 5, 5.5, 5.42, 5.75];
fr(2,:) = [180, 190, 170, 165, 100, 150, 130, 150];
fr(3,:) = [12, 11, 12, 10, 6, 8, 7, 9];
gender = [2, 2, 2, 2, 1, 1, 1, 1]; % 2 = male, 1 = female


%% seperate genders
N = numel(gender);
features = [[[],[],[]], [[],[],[]]];

for c=1:classesNo
    for f=1:featuresNo 
        tmp = [];
        for i=1:N 
            if gender(i)==c
                tmp(end+1) = fr(f,i);
            end
        end
        features(c,f,:) = tmp;
    end
end
        

%% train
for f=1:featuresNo
    for c=1:classesNo
        if gender(i)==1
            means(c,f) = mean(features(c,f,:));
            vars(c,f) = var(features(c,f,:));
        end
    end
end

%%
    
    % plot
%     disp(['best fitness=', num2str(val(end))]);
%     plot(generation,val(end),'k.');
%     hold on
%     pause(0.0000001)
    


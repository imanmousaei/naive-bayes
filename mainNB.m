%% problem : 
%   determine gender by height, weight & foot size


%% clear everything
clc
clear
close all


%% constants
classesNo = 2;
featuresNo = 3;
testRate = 0;

%% trainig data 
fr(1,:) = [5.92, 5.58, 5.92, 5, 5.5, 5.42, 5.75, 6];
fr(2,:) = [190, 170, 165, 100, 150, 130, 150, 180];
fr(3,:) = [11, 12, 10, 6, 8, 7, 9, 12];
gender = [2, 2, 2, 1, 1, 1, 1, 2]; % 2 = male, 1 = female


%% seperate genders
trainingN = (1-testRate)*numel(gender);
N = numel(gender)
features = [[[],[],[]], [[],[],[]]];

for c=1:classesNo
    for f=1:featuresNo 
        tmp = [];
        for i=1:trainingN 
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
        means(c,f) = mean(features(c,f,:));
        vars(c,f) = var(features(c,f,:));
    end
end


means
vars
    

%% test
gender = classify([6,130,8], classesNo, featuresNo, means, vars)



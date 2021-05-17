%% problem : 
%   determine gender by height, weight & foot size


%% clear everything
clc
clear
close all


%% constants
classesNo = 2;
featuresNo = 3;
testRate = 1/9;

%% trainig data 
fr(1,:) = [5.92, 5.58, 5.92, 5, 5.5, 5.42, 5.75, 6, 6];
fr(2,:) = [190, 170, 165, 100, 150, 130, 150, 180, 130];
fr(3,:) = [11, 12, 10, 6, 8, 7, 9, 12, 8];
gender = [2, 2, 2, 1, 1, 1, 1, 2, 1]; % 2 = male, 1 = female

%% todo
% read from excel standard form : 5.92 190 11 2
% confusion matrix


%% seperate genders
trainingN = round((1-testRate)*numel(gender))
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


%% test
gdr = [];
for i=trainingN+1:N
    tmp = [];
    for f=1:featuresNo 
        tmp(end+1) = fr(f,i);
    end
    gdr(i-trainingN) = classify([6,130,8], classesNo, featuresNo, means, vars);
end


plotconfusion(categorical(gender(trainingN+1:end)),categorical(gdr));


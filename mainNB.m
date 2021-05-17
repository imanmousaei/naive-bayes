%% problem : 
%   Irancell wants to install a ... but if the distance to people is less
%   than 100m it hurts them. now Irancell wants to maximize the signal
%   power and minimize people's damage


%% clear everything
clc
clear
close all

%% constants
maxGen=1000;
peoplesize = 30;
popsize=50;
ER=0.5;
NN= round(ER * popsize);
P = 0.3;
K = 5;


%% trainig data 
height = [6, 5.92, 5.58, 5.92, 5, 5.5, 5.42, 5.75];
weight = [180, 190, 170, 165, 100, 150, 130, 150];
footSize = [12, 11, 12, 10, 6, 8, 7, 9];
gender = [0, 0, 0, 0, 1, 1, 1, 1]; % 0 = male, 1 = female



%% Optimization:
for generation=1:maxGen
    for i=1:popsize
        fitness(i)=objfcn(people,chromosome(i));
    end
    [val,idx] = sort(fitness);
    
    
    % plot
    disp(['best fitness=', num2str(val(end))]);
    plot(generation,val(end),'k.');
    hold on
    pause(0.0000001)
    
end


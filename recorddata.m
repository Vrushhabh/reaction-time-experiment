function [accuracy, correctResults, wrongResults] = recorddata(trial_size, complexity)
%REACTIONEXPERIMENT This function makes figures that either contain the
%target or don't and the user has to quickly determine that by using the
%'A' (contains target) and 'S' (does not contain target) keys. 
% This function returns a vector of reaction times and a float that
% determines the accuracy. trial_size determines how many times you want
% as ubject to be tested and complexity determines how many objects the
% subject will have to process (higher the complexity the higher the
% reaction time
correctResults = [];
wrongResults = [];
correct = 0;
i=0;
while i < trial_size %each iteration through this loop makes a data point
    random = rand(); %this function is used to make a 50/50 between figures
    if random < .5   %that contain the figure and don't
        plot(rand(),rand(),'o')
        hold on     
        x = rand(1,complexity);
        y = rand(1,complexity);
        plot(x,y, 'x')
        tic         
        key = waitforbuttonpress; %pauses the program to wait for user input
        input = double(get(gcf,'CurrentCharacter'));
        if  input == 97  || input == 65 % 65 and 97 represent the A key in
             time = toc;                %ASCII 
             correct = correct + 1;
             correctResults(end+1) = time; %adds data to data matrix 
        else 
            time = toc;
            wrongResults(end+1) = time;
            
        end
        
    else                  %else represents the figures without the target 
        x = rand(1,complexity);
        y = rand(1,complexity);
        plot(x,y, 'x')
        tic
        waitforbuttonpress;
        input = double(get(gcf,'CurrentCharacter'));
        if  input ~= 97  && input ~= 65
             time = toc;
             correct = correct + 1;
             correctResults(end+1) = time;
        else 
            time = toc;
            wrongResults(end+1) = time;
        end
    end
    clf;
    i = i + 1;
    
end
accuracy = (correct/ trial_size)





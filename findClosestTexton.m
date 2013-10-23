function [index] = findClosestTexton(textons, aPatch)

[h, w] = size(textons);   %h = k, w = 25

currentMin = Inf;
index = 0;

for i = 1:h
    
    singleTexton = textons(i, :);
    
    x = [aPatch; singleTexton];

    distanceAway = pdist(x);

    if distanceAway < currentMin
       index = i;
         currentMin = distanceAway;
    end
end
    
end


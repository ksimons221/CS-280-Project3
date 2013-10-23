function [ index ] = findClosetHistogram(allHistograms, testHistogram)

[s, k] = size(allHistograms);

currentMin = Inf;
index = 0;

for i = 1:s
    singleHistogram = allHistograms(i, :);
    x = [singleHistogram ; testHistogram];
    distanceApart = pdist(x);
    
    if distanceApart < currentMin
       index = i;
       currentMin = distanceApart;
    end
    
end

end


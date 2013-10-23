function [ index, minNum ] = findClosetHistogram(allHistograms, testHistogram)

u = pdist2(testHistogram, allHistograms);
[minNum, index] = min (u');
end


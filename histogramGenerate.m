function [ newHistogram ] = histogramGenerate(centers, allPatches)

[k, space] = size(centers);

[h, w] = size(allPatches);

newHistogram = zeros(1, k);

for i = 1 : h

    aPatch = allPatches(i, :);

    index = findClosestTexton(centers, aPatch);

    newHistogram(1,index) = newHistogram(1,index) + 1;

end

end

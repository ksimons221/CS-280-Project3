function [ newHistogram ] = histogramGenerate(centers, allPatches)

D = pdist2(centers, allPatches);

[c, index] = min(D);

[k, space] = size(centers);

newHistogram = zeros(1, k);

for j = 1 : length(index)
    
    bucket = index(j);
    
    newHistogram(bucket) = newHistogram(bucket) + 1;

end

newHistogram = normr(double(newHistogram));

end

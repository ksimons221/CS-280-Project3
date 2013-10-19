function [ newHistograms ] = histogramGenerate(allTextons, patches)

[k, space, s] = size(allTextons);

numPatches = size(patches, 2);

newHistograms = zeros(k, s);

for i = 1 : numPatches
    singlePatch = patches(:,i);
    index = findClosestTexton(allTextons, singlePatch);
    newHistograms(index(2),index(1)) = newHistograms(index(2),index(1)) + 1;
end



end


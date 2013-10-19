clear all; clc; close all;

subPath = '/textons/texture_train/';
list = dir(strcat(pwd, subPath));
list = list(3:length(list)); %get rid of . and ..

s = 2; %size of training data. For full test use s = length(list);
k =15;

allHistograms = zeros(k, s);
allTextons = zeros(k, 25, s);


for i = 1:s
    imagePath = strcat(pwd, subPath, list(i).name);
    [textons , histogram] = computeTextons(imagePath, k);
    allHistograms(:,i) = histogram;
    allTextons(:,:,i) = textons;
end

test_name = 'textons/texture_test/12_beach_sand.tiff';
im = imread(test_name);

patches = patchesGenerate(im);
numPatches = size(patches, 2);

singlePatch = patches(:,1);

newHistograms = zeros(k, s);

for i = 1 : numPatches
    singlePatch = patches(:,i);
    index = findClosestTexton(allTextons, singlePatch);
    newHistograms(index(2),index(1)) = newHistograms(index(2),index(1)) + 1;
end


label = -1;
currentDistance = Inf;

for i = 1 : s
    testHistogram = newHistograms(:,i);
    trainHistogram = allHistograms(:,i);
    X = [testHistogram , trainHistogram];
    distanceApart = pdist(X');
    if distanceApart < currentDistance
        label = i;
        currentDistance = distanceApart;
    end    
end

list(label).name
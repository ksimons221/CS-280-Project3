clear all; clc; close all;

subPathTrain = '/textons/texture_train/';
subPathTest = '/textons/texture_test/';

listTrain = dir(strcat(pwd, subPathTrain));
listTrain = listTrain(3:length(listTrain)); %get rid of . and ..

listTest = dir(strcat(pwd, subPathTest));
listTest = listTest(3:length(listTest)); %get rid of . and ..

s = length(listTrain); %size of training data. For full test use s = length(listTrain);
k =50;

dataLoaded = 0;

savePatches = [];
patchesForKMean = []
if dataLoaded == 0
    for i = 1:s
        imagePath = strcat(pwd, subPathTrain, listTrain(i).name);
        patches = patchesGenerate(imagePath);
        patchesForKMean = [patchesForKMean ; patches];
        savePatches(:,:,i) = patches;
    end
end


if dataLoaded == 1
    patchesForKMean = load(strcat(pwd,'/kmeansPatches.mat'));
    patchesForKMean = patchesForKMean.allTrainingPatches;
end

disp('Starting k means');

[IDX, centers] =  kmeans(patchesForKMean,k);

if dataLoaded == 1
    savePatches = load(strcat(pwd,'/savePatches.mat'));
    savePatches = savePatches.savePatches;
end

allHistograms = zeros(s, k);

for i = 1:s
    imagePath = strcat(pwd, subPathTrain, listTrain(i).name);
    allHistograms(i, :)= histogramGenerate(centers, savePatches(:,:,i));

end

correct = 0;

disp('Starting classification');

for currentTestIndex = 1 : length(listTest)

    testImageName = listTest(currentTestIndex).name;
    testImagePath = strcat(pwd, subPathTest,testImageName);
    
    singleImageRespone = histogramGenerate(centers, patchesGenerate(testImagePath));
    [label, minVal] = findClosetHistogram(allHistograms, singleImageRespone);

    classification = listTrain(label).name;
    actual = testImageName(4: length(testImageName));

    if strcmp(classification,actual) == 1
        correct = correct + 1;
        outPut = strcat('Correctly_matches_' , actual);
        disp(outPut);
    else
        outPut = strcat('FAIL_Classified_' , actual, '_as_' , classification);
        disp(outPut);
    end
end

accuracy = double(100) * double(correct /  length(listTest));
disp('Final accuracy is:');
disp(accuracy);


finalCenters = zeros(5,5,k);

%for j =1:k
 %   oneCenter = centers(j,:);
  %  square = reshape(oneCenter, 5, 5)';
   % noNeg =  square + (-min(min(square)));
    %ratio = 255 / double(max(max(noNeg)));
   % scaled = uint8(noNeg * ratio);
   % subplot(5,10,j);
   % imshow(scaled)
   % finalCenters(:,:, j) = scaled;
%end
%size each row is a center

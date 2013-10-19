clear all; clc; close all;

subPathTrain = '/textons/texture_train/';
subPathTest = '/textons/texture_test/';

listTrain = dir(strcat(pwd, subPathTrain));
listTrain = listTrain(3:length(listTrain)); %get rid of . and ..

listTest = dir(strcat(pwd, subPathTest));
listTest = listTest(3:length(listTest)); %get rid of . and ..

s = length(listTrain); %size of training data. For full test use s = length(listTrain);
k =15;

allHistograms = zeros(k, s);
allTextons = zeros(k, 25, s);

for i = 1:s
    imagePath = strcat(pwd, subPathTrain, listTrain(i).name);
    [textons , histogram] = computeTextons(imagePath, k);
    allHistograms(:,i) = histogram;
    allTextons(:,:,i) = textons;
end

correct = 0;
for currentTestIndex = 1 : length(listTest)
    testImageName = listTest(currentTestIndex).name;

    testImagePath = strcat(subPathTest,testImageName);
    im = imread(testImagePath);

    patches = patchesGenerate(im);

    [newHistograms ]= histogramGenerate(allTextons, patches);

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

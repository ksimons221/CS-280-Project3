clear all; clc; close all;

subPathTrain = '/textons/texture_train/';
subPathTest = '/textons/texture_test/';

listTrain = dir(strcat(pwd, subPathTrain));
listTrain = listTrain(3:length(listTrain)); %get rid of . and ..

listTest = dir(strcat(pwd, subPathTest));
listTest = listTest(3:length(listTest)); %get rid of . and ..

s = length(listTrain); %size of training data. For full test use s = length(listTrain);
k =25;

allHistograms = zeros(k, s);
allTextons = zeros(k, 25, s);

allTrainingPatches = [];

for i = 1:s
    imagePath = strcat(pwd, subPathTrain, listTrain(i).name);
    patches = patchesGenerate(imagePath);
    allTrainingPatches = [allTrainingPatches ; patches];
end

[IDX, centers] =  kmeans(allTrainingPatches,k);
allHistograms = zeros(s, k);

for i = 1:s

    imagePath = strcat(pwd, subPathTrain, listTrain(i).name);
    allHistograms(i, :)= histogramGenerate(centers, patchesGenerate(imagePath));

end

correct = 0;

for currentTestIndex = 1 : length(listTest)

    testImageName = listTest(currentTestIndex).name;
    testImagePath = strcat(pwd, subPathTest,testImageName);
    
    singleImageRespone = histogramGenerate(centers, patchesGenerate(imagePath));

    label = findClosetHistogram(allHistograms, singleImageRespone);

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

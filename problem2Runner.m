clear all;
clc;
close all;

name = 'textons/texture_train';
list = dir(name);
list = list(3:19);
s = 2; %size of training data
k =25;



allHistograms = zeros(k, s);
allTextons = zeros(k, 25, s);


for i = 1:s
    imagePath = strcat(pwd, '/textons/texture_train/' , list(i).name);
    [textons , histogram] = computeTextons(imagePath, k);
    allHistograms(:,i) = histogram;
    allTextons(:,:,i) = textons;
end


test_name = 'textons/texture_test/12_beach_sand.tiff';
im = imread(test_name);

patches = patchesGenerate(im);


(texton, patch);




keyboard;
clear all; clc; close all;

subPathImages = '/Users/Kevin/Documents/MATLAB/CS-280-Project3/matching/data/';

subImage = 'cones/';

imagePath = strcat(subPathImages, subImage);

leftIm = imread(strcat(imagePath, 'left.png'));
rightIm = imread(strcat(imagePath, 'right.png'));

grayLeft = rgb2gray(leftIm);
grayRight = rgb2gray(rightIm);

[h , w] = size(grayLeft);
results = zeros(h,w);

for i = 2:h-1
    for j = 2 : w -1
        [i , j]
        cutOut = grayLeft(i-1:i+1, j-1:j+1);
        leftVec = reshape(cutOut, 9, 1);
        jPrime = findClosestJPrime(leftVec, i, grayRight, 1);
        results(i,j) = jPrime;
    end
    
end

keyboard;
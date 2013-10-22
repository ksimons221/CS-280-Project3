clear all; clc; close all;

subPathImages = '/Users/Kevin/Documents/MATLAB/CS-280-Project3/matching/data/';

subImage = 'cones/';

imagePath = strcat(subPathImages, subImage);

leftIm = imread(strcat(imagePath, 'left.png'));
rightIm = imread(strcat(imagePath, 'right.png'));

dt = load(strcat(imagePath, 'gt.mat'));
truthDisparity = dt.gt;

ssd = 1;

grayLeft = rgb2gray(leftIm);
grayRight = rgb2gray(rightIm);
[h , w] = size(grayLeft);
results = zeros(h , w);
windowWidth = 3;
padding = (windowWidth - 1) / 2;

grayLeft = createdPaddedIm( padding, grayLeft );
grayRight = createdPaddedIm( padding, grayRight );


[paddedH , paddedW] = size(grayLeft);



for i = 1+padding:paddedH-padding
    [ vecsAlongScanLine ] = generateVectorsAlongScanLine( grayRight, i, padding, windowWidth );
    for j = 1+ padding : paddedW - padding
        cutOut = grayLeft(i-padding:i+padding, j-padding:j+padding);
        leftVec = reshape(cutOut, windowWidth^2, 1);
        jPrime = findClosestJPrime(leftVec, vecsAlongScanLine, ssd);
        results(i-padding,j-padding) = abs(jPrime-j);
    end
    i
    
end


keyboard;

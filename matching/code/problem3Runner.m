clear all; clc; close all;

subPathImages = '/Users/Kevin/Documents/MATLAB/CS-280-Project3/matching/data/';

subImage = 'cones/';

imagePath = strcat(subPathImages, subImage);

leftIm = imread(strcat(imagePath, 'left.png'));
rightIm = imread(strcat(imagePath, 'right.png'));

dt = load(strcat(imagePath, 'gt.mat'));
truthDisparity = dt.gt;



ssd = 0;

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
        [ vecsAlongScanLineRight ] = generateVectorsAlongScanLine( grayRight, i, padding, windowWidth );
        [ vecsAlongScanLineLeft ] = generateVectorsAlongScanLine( grayLeft, i, padding, windowWidth );
 
        t = pdist2(vecsAlongScanLineLeft, vecsAlongScanLineRight, 'euclidean');
        firstJDistance = t(1,:);
        
        
        p = t'; %Now the first row is all the distance for the first j elements
        [C, I ] = min(p);
        
        offSet = ones(1,w).*i;
        withOffset = abs(I-offSet);
        
        
        results(i,:) = withOffset;
        
        if i == 10
            keyboard;
        end
        
        
        %for j = 1+ padding : paddedW - padding
         %   cutOut = grayLeft(i-padding:i+padding, j-padding:j+padding);
          %  leftVec = reshape(cutOut, windowWidth^2, 1);
           % jPrime = findClosestJPrime(leftVec, vecsAlongScanLine, ssd);
            %results(i-padding,j-padding) = abs(jPrime-j);
        %end
        i

    end

disparityResult = eval_disp(results, truthDisparity)

figure
surf(results)
shading flat


keyboard;

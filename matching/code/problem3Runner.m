clear all; clc; close all;

subPathImages = '/Users/Kevin/Documents/MATLAB/CS-280-Project3/matching/data/';

subImage = 'tsukuba/';

imagePath = strcat(subPathImages, subImage);

leftIm = imread(strcat(imagePath, 'left.png'));
rightIm = imread(strcat(imagePath, 'right.png'));

dt = load(strcat(imagePath, 'gt.mat'));
truthDisparity = dt.gt;

grayLeft = rgb2gray(leftIm);
grayRight = rgb2gray(rightIm);
[h , w] = size(grayLeft);
results = zeros(h , w);

windowWidth = 11;
padding = (windowWidth - 1) / 2;

grayLeft = createdPaddedIm( padding, grayLeft );
grayRight = createdPaddedIm( padding, grayRight );
[paddedH , paddedW] = size(grayLeft);

    for i = 1+padding:paddedH-padding-padding
        [ vecsAlongScanLineRight ] = generateVectorsAlongScanLine( grayRight, i, padding, windowWidth );
        [ vecsAlongScanLineLeft ] = generateVectorsAlongScanLine( grayLeft, i, padding, windowWidth );
 
        t = pdist2(vecsAlongScanLineLeft, vecsAlongScanLineRight,  'correlation');        %correlation euclidean
        
        p = t'; %Now the first column is all the distance for the first j element
        [C, I ] = min(p);
        rowSolution = ones(1,w);
        for j = 1:w
            rowSolution(1,j) = abs(j-I(j));
        end
        results(i,:) = rowSolution;
        i
    end
    

disparityResult = eval_disp(results, truthDisparity)

%figure(1);
%imagesc(results);
%colormap('default');
%colorbar;

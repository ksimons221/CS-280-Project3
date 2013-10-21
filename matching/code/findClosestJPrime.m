function [ jPrime ] = findClosestJPrime(leftVec, i, rightIm, ssd)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[h , w] = size(rightIm);

jPrime = -1;

minDist = Inf;

for j = 2:w-1

    cutOut = rightIm(i-1:i+1, j-1:j+1);
    rightVec = reshape(cutOut, 9, 1);
    if ssd == 1
        distanceApart = calculateSumSquaredDistances(leftVec, rightVec);
    else
        distanceApart = calculateNormalizedCrossCorrelaction( leftVec, rightVec);
    end
    
    if minDist > distanceApart
        minDist = distanceApart;
        jPrime = j;
    end
    
end


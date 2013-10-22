function [ jPrime ] = findClosestJPrime(leftVec, vecsAlongScanLine, ssd)

[h , w] = size(vecsAlongScanLine);

jPrime = -1;
minDist = Inf;

for j = 1:w

    rightVec = vecsAlongScanLine(:, j);
    if ssd == 1
        distanceApart = calculateSumSquaredDistances(leftVec, rightVec);
    else
        distanceApart = calculateNormalizedCrossCorrelaction( double(leftVec), double(rightVec));
    end
    
    if minDist > distanceApart
        minDist = distanceApart;
        jPrime = j;
    end
    
end

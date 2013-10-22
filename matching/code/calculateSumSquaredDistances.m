function [ distanceApart ] = calculateSumSquaredDistances( leftVec, rightVec )
    
    distanceApart = (norm( double(leftVec) - double(rightVec) ) )^2;
    
end

 
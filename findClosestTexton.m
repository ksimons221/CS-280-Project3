function [index] = findClosestTexton(texton, aPatch)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[k, d] = size(texton);

distances = ones(d,1);
for i= 1:d
    X = [texton(:,i) aPatch];
    distances(i) = pdist(X);
end
[C, index] = min(distances);
end


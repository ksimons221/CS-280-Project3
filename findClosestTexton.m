function [index] = findClosestTexton(textons, aPatch)

[k, space, d] = size(textons);   %space is alsways 25. d is the number of training images. k is number of textons

currentMin = Inf;
index = [0 , 0];  %is the images, then the texton in that image.

for i = 1:d
    
    singleSetOfTextons = textons(:, :, i);
    
    for j = 1:k
        singleCenter = singleSetOfTextons(j,:)';
        x = [aPatch, singleCenter]';
        distanceAway = pdist(x);

        if distanceAway < currentMin
            index  = [i , j];
            currentMin = distanceAway;
        end
    end
    
end

end


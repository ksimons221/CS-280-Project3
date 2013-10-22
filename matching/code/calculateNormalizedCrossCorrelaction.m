function [ distanceApart ] = calculateNormalizedCrossCorrelaction( x, y )
%x = left and y right

    distanceApart = (dot(-x,y))/(norm(x) * norm(y));
    
end


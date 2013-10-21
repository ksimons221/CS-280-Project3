function [ distanceApart ] = calculateNormalizedCrossCorrelaction( x, y )
%x = left and y right

top = dot(-x,y);
bottom = sqrt(dot(x,x)) * sqrt(dot(y,y));

distanceApart = top/bottom;
end


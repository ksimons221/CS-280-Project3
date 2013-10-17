function [ points ] = generateValidPoints( i,j,h,w )

points = [];
% i height

if i > 1 && j > 1
   points = [points ; i -  1 , j - 1];
end

if i > 1
   points = [points ; i -  1 , j];
end

if i > 1 && j < w
   points = [points ; i - 1 , j + 1];
end

if j > 1
   points = [points ; i, j-1];
end

if j < w
   points = [points ; i, j+1];
end

if j > 1 && i < h
   points = [points ; i+1, j-1];
end

if i < h
   points = [points ; i+1, j];
end

if j < w && i < h
    points = [points ; i + 1, j+1];
end
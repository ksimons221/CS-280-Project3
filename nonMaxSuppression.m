function [ suppressed ] = nonMaxSuppression( angle, magnitude)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here


height = size(angle,1);
width = size(angle,2);
suppressed = ones(height, width);

for i = 1:height
    for j = 1:width
        
        flag = 0;
        mag = magnitude(i,j);
        if angle(i,j) == 0
            if j == 1
                flag = (mag > magnitude(i,j+1));
            elseif j == width
                flag = (mag > magnitude(i,j-1));
            else
                flag = (mag > magnitude(i,j-1)) && (mag > magnitude(i,j+1));
            end
        elseif angle(i,j) == 90
            if i == 1
                flag = (mag > magnitude(i+1,j));
            elseif i == height
                flag = (mag > magnitude(i-1,j));
            else
                flag = (mag > magnitude(i-1,j)) && (mag > magnitude(i+1,j));
            end
         elseif angle(i,j) == 135
            if (i == height && j ==1) || (i == 1 && j == width)
                flag = 1;
            elseif i == 1 ||  j == 1
                flag =  (mag > magnitude(i+1,j+1));
            elseif i == height || j == width
                flag =  (mag > magnitude(i-1,j-1));
            else
                flag = (mag > magnitude(i+1,j+1)) && (mag > magnitude(i-1,j-1));
            end
         elseif angle(i,j) == 45
            if (i == 1 && j == 1) || (i == height && j == width)
                flag = 1;
            elseif i == 1 ||  j == width
                flag = (mag > magnitude(i+1,j-1));
            elseif i == height || j == 1
                flag = (mag > magnitude(i-1,j+1));
            else
                flag = (mag > magnitude(i-1,j+1)) && (mag > magnitude(i+1,j-1));
            end
            
        end
        
        
        if flag == 1
            suppressed(i,j) = magnitude(i,j);
        else
            suppressed(i,j) = 0;
        end
        
    end
end




end


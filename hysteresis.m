function [ binaryMatrix ] = hysteresis(low, high, surpressed )
height = size(surpressed,1);
width = size(surpressed,2);

binaryMatrix = zeros(height, width);
import java.util.LinkedList

for i = 1:height
    for j = 1:width
        if surpressed(i,j) > high
                     
            q = LinkedList();
            q.add([i,j]);

            while q.size > 0

                item = q.remove();
                x = item(1);
                y = item(2);
                binaryMatrix(x,y) = 1;
                
                points = generateValidPoints(x, y, height, width);
                
                if i == 23 && j == 396
                    %keyboard;
                end
                
                
                for s = 1 : size(points,1)
                    singlePoint = points(s, :);
                    if surpressed(singlePoint(1), singlePoint(2)) > low && binaryMatrix(singlePoint(1), singlePoint(2)) ~= 1
                        q.add(singlePoint);
                    end
                end
     
            end
        end
    end
end
binaryMatrix = uint8(binaryMatrix);
end

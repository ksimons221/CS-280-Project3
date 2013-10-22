function [ results ] = tempWrapper( X, Y )

%x 1 by n
%y m by n
[h, w] = size(Y);

results = zeros(h,1);
   
for i = 1:h
    results(i) = calculateNormalizedCrossCorrelaction(X', Y(i,:)');
end

end


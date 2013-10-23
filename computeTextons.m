function [ textons, histogram ] = computeTextons( allPatches , k)

[IDX, textons] = 

histogram = zeros(k,1);
for i=1:length(IDX)
    histogram(IDX(i)) = histogram(IDX(i)) +1;
end

end


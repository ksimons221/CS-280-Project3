function [ textons, histogram ] = computeTextons( filename , k)


im_gray = imread(filename);

patches = patchesGenerate(im_gray);

[IDX, textons] = kmeans(patches',k);

histogram = zeros(k,1);
for i=1:h
    histogram(IDX(i)) = histogram(IDX(i)) +1;
end

end


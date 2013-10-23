function [ paddedIm ] = createdPaddedIm( padding, im )

[h , w] = size(im);

left = randi([0 255], h, padding);
right = randi([0 255], h, padding);
top = randi([0 255], padding,  w + padding + padding);
bottom = randi([0 255], padding,  w + padding + padding);

paddedIm = [left, im, right];
paddedIm = [top ; paddedIm ; bottom];

end


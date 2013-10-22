function [ paddedIm ] = createdPaddedIm( padding, im )

[h , w] = size(im);

left = zeros(h, padding);
right = zeros(h, padding);
top = zeros(padding, w + padding + padding);
bottom = zeros(padding, w + padding + padding);

paddedIm = [left, im, right];
paddedIm = [top ; paddedIm ; bottom];

end


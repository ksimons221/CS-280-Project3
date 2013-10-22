function [ vecsAlongScanLine ] = generateVectorsAlongScanLine( im, iLine, padding, windowWidth )

[paddedH , paddedW] = size(im);

vecsAlongScanLine = zeros(windowWidth^2, paddedW - padding - padding);

for j = 1+padding:paddedH-padding
    
    cutOut = im(iLine-padding:iLine+padding, j-padding:j+padding);
    leftVec = reshape(cutOut, windowWidth^2, 1);
    vecsAlongScanLine(:,j-padding) = leftVec;

end


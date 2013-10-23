function [ vecsAlongScanLine ] = generateVectorsAlongScanLine( im, iLine, padding, windowWidth )

[paddedH , paddedW] = size(im);

vecsAlongScanLine = zeros(paddedW - padding - padding, windowWidth^2);

for j = 1+padding:paddedH-padding
    
    cutOut = im(iLine-padding:iLine+padding, j-padding:j+padding);
    leftVec = reshape(cutOut, 1, windowWidth^2);
    vecsAlongScanLine(j-padding,:) = leftVec;

end


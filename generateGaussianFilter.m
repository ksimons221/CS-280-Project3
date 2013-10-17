function [ kernel ] = generateGaussianFilter( width, sigma )

k = (width - 1) / 2;

kernel = magic(width);

for u = -k:k
    for v = -k:k
        kernel(u+k+1,v+k+1) = gaussianFilter(u,v,sigma);
    end
end
kernel = kernel ./ (sum(sum(kernel)));
end


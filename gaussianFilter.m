function [ intensity ] = gaussianFilter(u,v,sigma )

denominator = 2 * pi * sigma^2;
exponent = - ((u^2 + v^2)/ (2* sigma^2));

intensity = (1/denominator) * exp(exponent);
end


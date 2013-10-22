clear all; clc; close all;

imagePath = strcat(pwd, '/edges/images/14092.jpg');

I = imread(imagePath);

height = size(I,1);
width = size(I,2);
grayI = rgb2gray(I);

r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);

k  = generateGaussianFilter(5,1.4);

blurRed = conv2(double(r),double(k), 'same');
blurRed = uint8(blurRed);

blurGreen = conv2(double(g),double(k), 'same');
blurGreen = uint8(blurGreen);

blurBlue = conv2(double(b),double(k), 'same');
blurBlue = uint8(blurBlue);

newImage = cat(3,blurRed,blurGreen);
newImage = cat(3,newImage,blurBlue);

grayBlurred = rgb2gray(newImage);

[dx, dy] = findPartialDerivative(grayBlurred);
[ angle, magnitude ] = findGradient( dx, dy );
[suppressed] = nonMaxSuppression( angle, magnitude);

maxNum = max(max(suppressed));
ratio = 255/ maxNum; 
finalResult = uint8(suppressed.*ratio);

%[ binaryMatrix ] = hysteresis(10, 70, suppressed );  %20,50 decent

%finalResult =  binaryMatrix.*255;
keyboard;
imshow(finalResult);

figure(2);
BW = edge(grayI,'canny');
imshow(BW);

clear all;
clc;
close all;

imagePath = strcat(pwd, '/edges/images/201080.jpg');

I = imread(imagePath);


height = size(I,1);
width = size(I,2);
grayI = rgb2gray(I);

r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);


%k = [1/9, 1/9, 1/9; 1/9, 1/9, 1/9; 1/9, 1/9, 1/9];

k  = generateGaussianFilter(5,5);

%k = [0,0,0;0,1,0;0,0,0];

blurRed = conv2(double(r),double(k), 'same');
blurRed = uint8(blurRed);

blurGreen = conv2(double(g),double(k), 'same');
blurGreen = uint8(blurGreen);

blurBlue = conv2(double(b),double(k), 'same');
blurBlue = uint8(blurBlue);

newImage = cat(3,blurRed,blurGreen);
newImage = cat(3,newImage,blurBlue);


diff = I - newImage;

%imshow(newImage);
%figure(2);
%imshow(I);


grayBlurred = rgb2gray(newImage);



[dx, dy] = findPartialDerivative(grayBlurred);
[ angle, magnitude ] = findGradient( dx, dy );



[suppressed] = nonMaxSuppression( angle, magnitude);

[ binaryMatrix ] = hysteresis(100, 200, suppressed );

finalResult =  binaryMatrix.*255;



BW = edge(grayI,'canny');



imshow(finalResult);

figure(2);

imshow(BW);



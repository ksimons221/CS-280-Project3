clear all;
clc;
close all;

imagePath = strcat(pwd, '/edges/images/49024.jpg');
[textons , histogram] = computeTextons(imagePath);



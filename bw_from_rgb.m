clc;
close all;
clear all;


J = fullfile('e:\','Beta Cell Detection','warwick_beta_cell_dataset',...
    'images','IMG_0040.jpg');
I = imread(J);
im1 = rgb2gray(I);
% imshow (im1);
% im2 = histeq(im1);
% brighten(-.99);
% figure
% imshow(im2);
baseFileName = 'IMG_0040rgb.jpg'; 
fullFileName = fullfile('e:\','Beta Cell Detection','warwick_beta_cell_dataset',...
    'rgb_im', baseFileName); 
imwrite(im1, fullFileName);

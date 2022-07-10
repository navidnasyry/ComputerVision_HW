clc;
clear;
close all;

I = im2double(imread(('./input.jpg')));
I_gray = myBinaryConvertor(I);

imshow(I_gray, []);







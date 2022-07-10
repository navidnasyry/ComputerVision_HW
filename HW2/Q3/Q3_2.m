clc;
clear;
close all;


I = im2double(imread('./input.jpg'));
I_result = FloydSteinberg(I);
 

subplot(1,2,1);
imshow(I, []);
title("origin image");
subplot(1,2,2);
imshow(I_result, []);
title("result image");





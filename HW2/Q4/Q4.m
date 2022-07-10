clc;
clear;
close all;

I = im2double(imread('./input.jpg'));
resizing_factor = 2;

I_out = My_Imresize_BL(I, resizing_factor);

imshow( I_out, []);




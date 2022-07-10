clc
clear
close all


F = fopen('./Test_01.ppm');
file_content = fread(F, 'uint8');
fclose(F);
% find information : 
type = file_content(1:2);
char(file_content(4:7));
width =str2double(reshape(char(file_content(4:7)), [1,4]));
height = str2double(reshape(char(file_content(9:11)), [1,3]));
color_range =str2double(reshape(char(file_content(13:15)), [1,3]));

fprintf("width : %i\n", width);
fprintf("height : %i\n", height);
fprintf("color range : %i\n", color_range);

image_data = file_content(17:end);

% start parsing image_data to 3d matrix and image
layer_1 = zeros(height, width);
layer_2 = zeros(height, width);
layer_3 = zeros(height, width);
for i=1:height
    y = 1;
    for j=1:3:width*3
        layer_1(i,y) = image_data((i-1)*width*3 + j);
        layer_2(i,y) = image_data((i-1)*width*3 + j+1);
        layer_3(i,y) = image_data((i-1)*width*3 + j+2);
        y = y+1;
    end  
end

new_image = cast(cat(3, layer_1, layer_2, layer_3), 'uint8');

% main image : 
I = imread('./Test_01.ppm');
% show image
subplot(1,2,1);
imshow(I, []);
title("origin image");
subplot(1,2,2);
imshow(new_image, []);
title("refactor image");

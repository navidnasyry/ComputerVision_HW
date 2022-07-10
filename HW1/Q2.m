clc;
clear;
close all;


I = im2double(imread('./Test_01.ppm'));
I_rgb = I;

O_x = size(I, 2) / 2; 
O_y = size(I, 1) / 2 ;
for i=1 : size(I, 1)
    for j=1 : size(I, 2)
        %%OVAL = (x^2 / a^2) + (y^2 / b^2) = 1
        if( ((i - O_y)^2 / 400^2) + ((j - O_x)^2 / 200^2) <= 1 )
            if(abs(i - O_y) + 2 * abs(j - O_x) < 200)
                I(i, j, 1) = I_rgb(i, j, 1);
                I(i, j, 2) = I_rgb(i, j, 2);
                I(i, j, 3) = I_rgb(i, j, 3);
            else
                I(i, j, 1) = 1;
                I(i, j, 2) = 0;
                I(i, j, 3) = 0; 
                
            end
        else
            gray_num = (I(i, j, 1) + I(i, j, 2) + I(i, j, 3)) / 3;
            I(i, j, 1) = gray_num;
            I(i, j, 2) = gray_num;
            I(i, j, 3) = gray_num;
            
        end
         
    end
    
end

imwrite(I, 'result_Q2.jpg', 'jpg');
imshow(I, []);



clc;
clear;
close all;


I = imread('./Test_01.ppm');

%redius of outer cercle
redius = round(sqrt((size(I, 1)/2) ^ 2 + (size(I, 2) / 2) ^ 2));

%side of result photo
max_side = 2 * redius;
I_ans = uint8(zeros(max_side, max_side , 3));

%amount of shift at the end
shift_x = round(size(I, 1) / 2);
shift_y = round(size(I, 2) / 2);

%get input
angle = input("Enter the angle of rotation : ");

%create rotation matrix
rot_matrix = [cosd(angle), -sind(angle);
              sind(angle), cosd(angle)];

%center of result photo
o_x = size(I_ans, 2) / 2; 
o_y = size(I_ans, 1) / 2; 

for i=1 : size(I_ans, 1)
    for j=1 : size(I_ans, 2)
        %rotation
         rotation = rot_matrix * [i-o_x ; j-o_y];                             
         x=round(rotation(1)) + shift_x;
         y=round(rotation(2)) + shift_y;

         if (x>=1 && y>=1 && x<=size(I,1) &&  y<=size(I,2) ) 
              I_ans(i,j,:)=I(x,y,:);  
         end
    end
end
imshow(I_ans, []);
clc;
clear;
close all;


picture_name = "Peppers";
original_image = imread("./Q4/" + picture_name + ".tif");
kernel_size = 3;
mid_sum = 0;
my_sum = 0;

for i=1: 9
   salty_pic = imnoise(original_image, "salt & pepper", i*0.1);
   imwrite(salty_pic, "./pic/salty/" + num2str(i*10) +"salty_" + picture_name + ".tif");

   repaird_image = RepairFunction(salty_pic, kernel_size);
   imwrite(repaird_image, "./pic/repair/" + num2str(i*10) +"myfunction_" + picture_name + ".tif");
   
   mid_image = medfilt2(salty_pic, [kernel_size, kernel_size]);
   imwrite(repaird_image, "./pic/repair/" + num2str(i*10) +"middle_" + picture_name + ".tif");

   psnr_myfunction = psnr(original_image, repaird_image);
   psnr_middle = psnr(original_image, mid_image);
   
   mid_sum = mid_sum + psnr_middle;
   my_sum = my_sum + psnr_myfunction;
   fprintf("\n\nPSNR between original and myfunction with " + num2str(i*10) + " percent noise : " + num2str(psnr_myfunction) + "\nPSNR between original and middle with" + num2str(i*10) + " percent noise : " + num2str(psnr_middle));
   
end

fprintf("\n\n-------------------------------------------------\n");
fprintf("average of middles : " + num2str(mid_sum / 9));

fprintf("\n\naverage of myfunction : " + num2str(my_sum / 9));






pics = dir(".\base_kernel_gr");
pics_num = length(pics);

for i=3 : pics_num
   path = pics(i).folder + "\" + pics(i).name;
   I = imread(path);
   I_20 = imresize(I, [20 20]);
   I_30 = imresize(I, [30 30]);
   I_50 = imresize(I, [50 50]);
   
   path_split = string(pics(i).name).split('.');
   f_name = path_split(1);
   imwrite(rgb2gray(I_20), "kernels_gr\" + f_name + "_20.png");
   imwrite(rgb2gray(I_30), "kernels_gr\" + f_name + "_30.png");
   imwrite(rgb2gray(I_50), "kernels_gr\" + f_name + "_50.png");

end




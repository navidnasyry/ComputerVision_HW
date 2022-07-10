clc;
clear;
close all;

test_images_path = "./DRIVE/Test/images/";
test_mask_path = "./DRIVE/Test/mask/";
test_1st_manual_path = "./DRIVE/Test/1st_manual/";
test_2st_manual_path = "./DRIVE/Test/2st_manual/";
path_of_excel = "./report.xlsx"

all_test_images = dir(test_images_path);
all_mask_images = dir(test_mask_path);
all_1st_manual_images = dir(test_1st_manual_path);
all_2st_manual_images = dir(test_2st_manual_path);

sum_of_Sensitivity = 0;
sum_of_Specificity = 0;
sum_of_Accuracy = 0;


headers = {'Picture Name','Sensitivity','Specificity', 'Accuracy'};
data(1,:) = headers;


for i=3 : size(all_test_images,1)
    image_path = all_test_images(i).folder + "/" + all_test_images(i).name;
    mask_path = all_mask_images(i).folder + "/" + all_mask_images(i).name;
    manual_image_path = all_1st_manual_images(i).folder + "/" + all_1st_manual_images(i).name;
    
    I_main = im2double(imread(image_path));
    I_mask = im2double(imread(mask_path));
    I_manual = im2double(imread(manual_image_path));
    
    y_dim = size(I_main, 1);
    x_dim = size(I_main, 2);
    
    
    extracted_image = Extraction_of_vessels(I_main, I_mask);
    
    [TP, TN, FP, FN] = Performance_criteria(extracted_image, I_manual);
    
    Sensitivity = TP / (TP + FN)
    Specificity = TN / (TN + FP)
    Accuracy =  (TP + TN) / (TP + TN + FP + FN)
    
    sum_of_Sensitivity = sum_of_Sensitivity + Sensitivity;
    sum_of_Specificity = sum_of_Specificity + Specificity;
    sum_of_Accuracy = sum_of_Accuracy + Accuracy;
    
    show_pic = zeros(y_dim, x_dim, 3);
    show_pic(:, : , 3) = extracted_image;
    show_pic(:, : , 2) = I_manual;
    
    new_row = {all_test_images(i).name , Sensitivity, Specificity, Accuracy};
    data(i-1,:) = new_row;
    
    imshow(show_pic, []);
    %imshow(extracted_image, []);
    %if i==17
    pause(2);
    %end
    
    
end

avg_sensitivity = sum_of_Sensitivity / (size(all_test_images,1) - 2)
avg_specificity = sum_of_Specificity / (size(all_test_images,1) - 2)
avg_accuracy = sum_of_Accuracy / (size(all_test_images,1) - 2)

final_row = {"Average : ", avg_sensitivity, avg_specificity, avg_accuracy}
data(i, :) = final_row;

xlswrite(path_of_excel, data);










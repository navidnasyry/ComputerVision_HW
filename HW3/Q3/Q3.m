clc;
clear;
close all;



all_images = dir('./Q3/*.png');
n_image = length(all_images);

all_kernels = dir('./kernels_gr/*.png');
n_kernel = length(all_kernels);

all_kernel_sizes = [20 , 30, 50];

minimum_psnr = 12;
threshold = 0.87;
for i=n_image : -1 : 1
% i=3;
    image_solty = imread(all_images(i).folder + "\" + all_images(i).name);
    image = medfilt3(image_solty);
    image_h = size(image, 1);
    image_w = size(image, 2);
    Result = 0;
    % debug %
    fprintf("\n\n%s  : ", all_images(i).name);

    image_blue_filter = imbinarize(image(:,:,1));
    image_red_filter = imbinarize(image(:,:,3));
        for y=1 : image_h - max(all_kernel_sizes)
            for x=1 : image_w - max(all_kernel_sizes)
 
                for k_s = all_kernel_sizes
                    
                    u_kernel_b = image_blue_filter(y:y+k_s-1, x:x+k_s-1 ); % for detect blue numbers
                    u_kernel_r = image_red_filter(y:y+k_s-1, x:x+k_s-1 ); % for detect red numbers
                    if (mean(mean(u_kernel_b)) == 1 && mean(mean(u_kernel_r)) == 1)
                        continue;
                    else
                        for j=n_kernel : -1 : 1
                            % kernel name format : num_color.png ex: 2_red.png OR 9_blue.png
                            k_name =  string(all_kernels(j).name);
                            k_split = k_name.split('_');
                            k_num = str2num(k_split(1));
                            k_format = k_split(2).split('.');
                            k_color = k_format(1);



                            % read kernel
                            kernel = imread(all_kernels(j).folder + "\" + k_name);
                            kernel_resized = imbinarize(imresize(kernel, [k_s, k_s]));
                            % mae=sum(abs(u_kernel(:)-kernel(:)))/numel(kernel);
                            
                            psnr_b = psnr(im2uint8(u_kernel_b), im2uint8(kernel_resized));
                            psnr_r = psnr(im2uint8(u_kernel_r), im2uint8(kernel_resized));
                            
                            normx_b = normxcorr2(im2uint8(kernel_resized), im2uint8(u_kernel_b));         
                            normx_r = normxcorr2(im2uint8(kernel_resized), im2uint8(u_kernel_r));
                            %psnr_arr(end+1) = psnr_b;
                            %psnr_arr(end+1) = psnr_r;

                            %fprintf("blue psnr : %d , red psnr : %d\n", psnr_b, psnr_r);

                            if max(normx_b(:)) > minimum_psnr 
                                Result = Result - k_num;
                                image_blue_filter(y:y+k_s-1, x:x+k_s-1 ) = 1;
                                fprintf("blue:%d , ", k_num);
                            end
                            if max(normx_r(:)) > minimum_psnr
                                Result = Result + k_num;
                                image_red_filter(y:y+k_s-1, x:x+k_s-1 ) = 1;
                                fprintf("red:%d , ", k_num);
                            end
                        end
                    end
                end
            end
        end
    result_image = insertText(all_images(i), [image_w/2, image_h-30], num2str(result));
    imwrite(result_image, all_images(i).folder + "\" + all_images(i).name);

end


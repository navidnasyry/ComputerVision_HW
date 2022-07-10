
input_pictures = ["LR_Boat.png";"LR_Cameraman.png"; "LR_House.png"; "LR_Peppers.png"];
main_pictures = ["Boat.png"; "Cameraman.png"; "House.png"; "Peppers.png"];

for i=1 : length(input_pictures)
    
    I = im2double(imread(input_pictures(i)));
    I_main = im2double(imread(main_pictures(i)));
    if ndims(I) == 3
       I = rgb2gray(I);
       I_main = rgb2gray(I_main);
    end
    fprintf("\npicture %s : \n", input_pictures(i));

    tic
    I_near = imresize(I, 2, 'nearest');
    toc
    tic
    I_bilinear = imresize(I, 2, 'bilinear');
    toc
    tic
    I_bicubic = imresize(I, 2, 'bicubic');
    toc
    tic
    I_myResize = MyResize(I);
    toc
    
    psnr_near = psnr(I_main, I_near);
    psnr_bilinear = psnr(I_main, I_bilinear);
    psnr_bicubic = psnr(I_main, I_bicubic);
    psnr_myRisize = psnr(I_main, I_myResize);
    
    fprintf("\npsnr of nearest : %d\n", psnr_near);
    fprintf("psnr of bilinear : %d\n", psnr_bilinear);
    fprintf("psnr of bicubic : %d\n", psnr_bicubic);
    fprintf("psnr of MyResize algorithm : %d\n\n", psnr_myRisize);
    fprintf("***********************************\n");
    
end

%imshow(I_near, []);



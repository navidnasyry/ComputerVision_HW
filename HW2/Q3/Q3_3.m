


I = im2double(imread('./input.jpg'));
I_gray = myGrayScale(I);
I_floydSteinberg = FloydSteinberg(I);
% convert binary image to rgb image 
I_floydSteinberg_rgb = cat(3, I_floydSteinberg, I_floydSteinberg, I_floydSteinberg);

I_and_gray_PSNR = psnr(I, I_gray)
I_and_floydsteinberg = psnr(I, I_floydSteinberg_rgb)
gray_and_floydsteinberg = psnr(I_gray, I_floydSteinberg_rgb)



subplot(1,3,1);
imshow(I, []);
title("origin image");

subplot(1,3,2);
imshow(I_gray, []);
title("GrayScale image");

subplot(1,3,3);
imshow(I_floydSteinberg);
title("FloydSteinberg image");









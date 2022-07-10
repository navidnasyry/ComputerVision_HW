
I = im2double(imread('./image.tif'));
I_res = myTransformationFunc(I);

% uncomment next line and comment imshow code for show histogram plot of result image
%bar(HistogramPlot(I_res));

subplot(1,2,1);
imshow(I, []);
title("origin image");
subplot(1,2,2);
imshow(I_res, []);
title("result image");

    

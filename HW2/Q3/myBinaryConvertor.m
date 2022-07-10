function output_image = myBinaryConvertor(input_image)


output_image = zeros(size(input_image,1), size(input_image, 2), size(input_image, 3));

for i=1 : size(output_image, 1)
    for j=1 : size(output_image, 2)
        avg_tmp = (input_image(i, j, 1) + input_image(i, j, 2)+input_image(i, j, 3)) / 3;
        if avg_tmp >= 0.5
            output_image(i, j, 1) = 1;
            output_image(i, j, 2) = 1;
            output_image(i, j, 3) = 1;
        else
            output_image(i, j, 1) = 0;
            output_image(i, j, 2) = 0;
            output_image(i, j, 3) = 0;
        
        end
        
    end
end

peaksnr = psnr(input_image, output_image);
fprintf('The PSNR of my Binary image and main image = %f\n\n', peaksnr);

end


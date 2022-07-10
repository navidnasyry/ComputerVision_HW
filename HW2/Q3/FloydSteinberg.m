function output_image = FloydSteinberg(input_image)

output_image = rgb2gray(input_image);
height = size(output_image, 1);
width = size(output_image, 2);

for y=1 : height
    for x=1 : width
        if 1 - output_image(y, x) > output_image(y, x) - 0
            % near 0
            error = output_image(y, x) - 0;
            output_image(y, x) = 0;
           
        else
            % near 255
            error = output_image(y, x) - 1;
            output_image(y, x) = 1; 
        end
        
        if x < width
            output_image(y, x+1) = output_image(y, x+1) + (error * 7/16);
        end
        if x > 1 && y < height
            output_image(y+1, x-1) = output_image(y+1,x-1) + (error * 3/16);
        end
        if y < height
            output_image(y+1, x) = output_image(y+1, x) + (error * 5/16);
        end
        if x < width && y < height
            output_image(y+1, x+1) = output_image(y+1, x+1) + round(error * 1/16);
        end
    end
end   
    



end


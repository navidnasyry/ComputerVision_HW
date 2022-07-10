function output_image = My_Imresize_BL(input_image,resizing_factor)


    output_image = zeros(round(resizing_factor * size(input_image, 1)), round(resizing_factor* size(input_image, 2)), size(input_image, 3));
    height = size(input_image, 1);
    width = size(input_image, 2);
    diff = resizing_factor - 1;

    resizing_factor = 1/resizing_factor;
    height_out = size(output_image, 1);
    width_out = size(output_image, 2);
    for x=1 : height_out
        for y=1 : width_out
            rf = resizing_factor * x;
            cf = resizing_factor * y;
            r = round(rf);
            c = round(cf);
            delta_r = rf - r;
            delta_c = cf - c;
            if r < height && c < width && r >= 1 && c >= 1
                output_image(x, y, : ) = input_image(r, c, :) * (1-delta_r) * (1-delta_c)+ input_image(r+1, c, :) * delta_r * (1-delta_c) + input_image(r, c+1, :) * (1-delta_r) * delta_c + input_image(r+1,c+1) * delta_r * delta_c;
            end          
        end
    end

end


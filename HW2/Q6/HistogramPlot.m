function histogram_vector = HistogramPlot(input_image)
    input_image = im2uint8(input_image);
    histogram_vector = zeros(256, 1);
    h = size(input_image, 1);
    w = size(input_image, 2);

    for i=1 : h
        for j=1 : w
            histogram_vector(input_image(i, j)+1) = histogram_vector(input_image(i, j)+1) + 1;
        end
    end
end


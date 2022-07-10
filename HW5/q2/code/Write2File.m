function Write2File(main_image, label_image, number_of_labels ,path)

    headers = {'Label','Area','Medium brightness level'};
    data(1,:) = headers;
    
    for i=1 : number_of_labels
        [xs, ys] = find(label_image == i);
        coordinates = [xs, ys];
        area = size(coordinates, 1);
        sum_pix = uint64(0);
        for k = 1 : size(coordinates, 1)
            sum_pix = sum_pix + uint64(main_image(coordinates(k, 1), coordinates(k, 2)));
        end
        mid_brightness = sum_pix / area;
        new_row = {i, area, mid_brightness};
        data(i+1,:) = new_row;
    end

    xlswrite(path, data);


end


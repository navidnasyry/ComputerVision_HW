function [output_image] = MyResize(input_image)
    
    % input_image = im2double(imread('./Boat.png'));
    old_height =  size(input_image, 1);
    old_width = size(input_image, 2);
    new_height = 2 * old_height;
    new_width = 2 * old_width;
    output_image = zeros(new_height, new_width);
    x = 1;
    y = 1;
    for i=1 : new_height
        x = 1;
        for j=1 : new_width
            if mod(i, 2) == 1 && mod(j, 2) == 1
                output_image(i, j) = input_image(y, x);
                x = x + 1;
            elseif mod(i, 2) == 0 && mod(j, 2) == 0
                % average between neighber pixel
                if x < old_width && y < old_height
                    output_image(i, j) = (input_image(y, x) + input_image(y, x+1) + input_image(y-1, x) + input_image(y-1, x+1))/4;
                else
                    output_image(i, j) = (input_image(y, x) + input_image(y-1, x)) / 2; 
                end
                x = x + 1;

            elseif mode(i, 2) == 1 && mod(j, 2) == 0

            elseif mode(i, 2) == 0 && mode(j, 2) == 1

            end
        end
        if mod(i, 2) == 1 && y < old_height
            y = y + 1;
        end
    end

    for ii=1 : new_height
        for jj=1 : new_width
            if (mod(ii, 2) == 1 && mod(jj, 2) == 0) || (mod(ii, 2) == 0 && mod(jj, 2) == 1)
                if ii < new_height && ii > 1 && jj < new_width && jj > 1
                    output_image(ii, jj) = (output_image(ii+1, jj) + output_image(ii-1, jj) + output_image(ii, jj+1) + output_image(ii, jj-1))/4;
                elseif ii == new_height 
                    if jj == 1
                        output_image(ii, jj) = (output_image(ii-1, jj) + output_image(ii, jj+1))/2;
                    elseif jj == new_width
                        output_image(ii, jj) = (output_image(ii-1, jj) + output_image(ii, jj-1))/2;
                    else
                        output_image(ii, jj) = (output_image(ii-1, jj) + output_image(ii, jj+1) + output_image(ii, jj-1))/3; 
                    end

                elseif ii == 1
                    if jj == 1
                        output_image(ii, jj) = (output_image(ii+1, jj) + output_image(ii, jj+1))/2;
                    elseif jj == new_width
                        output_image(ii, jj) = (output_image(ii+1, jj) + output_image(ii, jj-1))/2;
                    else
                        output_image(ii, jj) = (output_image(ii+1, jj) + output_image(ii, jj+1) + output_image(ii, jj-1))/3; 
                    end

                elseif jj==new_width
                    if ii == 1
                        output_image(ii, jj) = (output_image(ii, jj-1) + output_image(ii+1, jj))/2;
                    elseif ii == new_height
                        output_image(ii, jj) = (output_image(ii, jj-1) + output_image(ii-1, jj))/2;
                    else
                        output_image(ii, jj) = (output_image(ii+1, jj) + output_image(ii-1, jj) + output_image(ii, jj-1))/3; 
                    end
                  elseif jj==1
                    if ii == 1
                        output_image(ii, jj) = (output_image(ii, jj+11) + output_image(ii+1, jj))/2;
                    elseif ii == new_height
                        output_image(ii, jj) = (output_image(ii, jj+1) + output_image(ii-1, jj))/2;
                    else
                        output_image(ii, jj) = (output_image(ii+1, jj) + output_image(ii-1, jj) + output_image(ii, jj+1))/3; 
                    end  

                end

            end  

        end
    end


    %imshow(output_image, []);



    

end




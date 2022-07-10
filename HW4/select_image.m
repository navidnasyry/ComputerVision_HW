function [out_index] = select_image(pieces, main_pic, x, y, pic_size, threshold)

    % just use from left pictur
    max_psnr = 0;
    if y == 1
        x_start = x - threshold;
        x_end = x - 1;
        y_start = y;
        y_end = y + pic_size - 1;    
        neighbor_part = main_pic(y_start:y_end, x_start:x_end, :);
        
        for i=1 : size(pieces, 2)
            current = im2double(imread(pieces(i)));
            x_s = 1;
            x_e = threshold;
            y_s = 1;
            y_end = pic_size;
            current_edited = current(y_s:y_end, x_s:x_e, :);
            new_psnr = psnr(current_edited, neighbor_part);
            if new_psnr > max_psnr
                max_psnr = new_psnr;
                out_index = i;
            end
        end

            
        
    % just use from up pictur
    elseif (x == 1)
        x_start = x;
        x_end = x + pic_size - 1;
        y_start = y - threshold;
        y_end = y - 1;
        neighbor_part = main_pic(y_start:y_end, x_start:x_end, : );
        for i=1 : size(pieces, 2)
            current = im2double(imread(pieces(i)));
            x_s = 1;
            x_e = pic_size;
            y_s = 1;
            y_end = threshold;
            current_edited = current(y_s:y_end, x_s:x_e, :);
            new_psnr = psnr(current_edited, neighbor_part);
            if new_psnr > max_psnr
                max_psnr = new_psnr;
                out_index = i;
            end
        end

    
    % use from up and left pictu
    else
        %%%%%%%%%% left
        x_start = x - threshold;
        x_end = x - 1;
        y_start = y;
        y_end = y + pic_size - 1;
        neighbor_part_left =  main_pic(y_start:y_end, x_start:x_end, :);
        
        %%%%%%%%%%% up 
        x_start = x;
        x_end = x + pic_size - 1;
        y_start = y - threshold;
        y_end = y - 1;
        neighbor_part_up =  main_pic(y_start:y_end, x_start:x_end, :);

        
        
        
        
         for i=1 : size(pieces, 2)
             %%%%%%%%% up
            current_up = im2double(imread(pieces(i)));
            x_s = 1;
            x_e = pic_size;
            y_s = 1;
            y_end = threshold;
            current_edited_up = current_up(y_s:y_end, x_s:x_e, :);
            new_psnr_up = psnr(current_edited_up, neighbor_part_up);
            
            %%%%%%%%%% left
            current_left = im2double(imread(pieces(i)));
            x_s = 1;
            x_e = threshold;
            y_s = 1;
            y_end = pic_size;
            current_edited_left = current_left(y_s:y_end, x_s:x_e, :);
            new_psnr_left = psnr(current_edited_left, neighbor_part_left);
            
            new_psnr = new_psnr_left + new_psnr_up;
            if new_psnr > max_psnr
                max_psnr = new_psnr;
                out_index = i;
            end
        end
        
        
        
       
    end
    
end


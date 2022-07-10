function [output_image] = RepairFunction(input_image,kernel_size)
    
    output_image = input_image;
    pad_size = floor(kernel_size/2);
    pad_image = padarray(input_image, [pad_size, pad_size], 0, "both");
    h = size(pad_image, 1);
    w = size(pad_image, 2);
    for i=1 : h-kernel_size+1
        for j=1 : w-kernel_size+1
            % select pixels under the kernel
            u_kernel = pad_image(i:i+kernel_size-1, j:j+kernel_size-1, :);
            % remove 0 and 255 pixels from region under the kernel
            selected_elements = u_kernel(u_kernel>0 & u_kernel<255);
            % mean of non valid pixels
            if (isempty(selected_elements))
                final_element = (255)/2;
            else
                final_element = mean(selected_elements);
            end
            output_image(i,j)=final_element;
            
        end
    end


end


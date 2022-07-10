function [TP, TN, FP, FN] = Performance_criteria(my_image, manual_image)

    y_dim = size(my_image, 1);
    x_dim = size(my_image, 2);
    
    TP = 0;
    TN = 0;
    FP = 0;
    FN = 0;
    
    for y=1 : y_dim
        for x=1 : x_dim
            if my_image(y,x) == 1 && manual_image(y,x) == 1
               TP = TP + 1; 
            end
            
            if my_image(y,x) == 0 && manual_image(y,x) == 0
               TN = TN + 1; 
            end
            
            if my_image(y,x) == 1 && manual_image(y,x) == 0
               FP = FP + 1; 
            end
            
            if my_image(y,x) == 0 && manual_image(y,x) == 1
               FN = FN + 1; 
            end            
        end
    end
    


end


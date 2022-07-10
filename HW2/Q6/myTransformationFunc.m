function output_image = myTransformationFunc(input_image)

    gamma = 0.2;
    output_image = ((255).^(1-gamma)) * (input_image.^gamma);
    
end


function [output_image] = Extraction_of_vessels(i_main,i_mask)

    
   % i_main = i_main .* i_mask;

    %i_main = rgb2gray(i_main);
    i_main = i_main(:,:,2);
    
    i_main = imsharpen(i_main,'Radius',5,'Amount',10);
    
    i_main = adapthisteq(i_main);
    
    %i_main = imresize(i_main, 0.7);
    
    [Gmag, Gdir] = imgradient(i_main,'prewitt');

        
    
    %i_main = 1 - i_main;
    %level = multithresh(i_main, 6)
    %i_main = im2bw(i_main, double(level(5))/255);
    %figure
    %imshowpair(Gmag, Gdir, 'montage');
    %pause(3);
    
    
    i_main = imsharpen(Gmag,'Radius',5,'Amount',10);
    %i_main = i_main .* i_mask;
    
    %se = strel('disk', 3);
    %i_main = imerode(i_main, se);

    [Gmag2, Gdir2] = imgradient(i_main,'central');
    
    
    i_main = rescale(Gmag2) .* i_mask;
    
    %level_bw = multithresh(i_main, 1) 
    i_main = im2bw(i_main, 0.3);
    
    se_close = strel('disk', 2);
    i_main = imclose(i_main, se_close);
    
    se_erode = strel('disk', 1);
    i_main = imerode(i_main, se_erode);
    
    
    %se_erode = strel('disk', 4);
    %i_main = imdilate(i_main, se_erode);
    
    
    
    se_mask = strel('disk', 9);
    i_mask = imerode(i_mask, se_mask);
    i_main = i_main .* i_mask;
    
    output_image = i_main;




end


clc; 
clear;
close all;

path = "./Puzzle_2_160/";
pieces_size = 120;
num_of_column = 1;

I_start = im2double(imread(path + "Output.tif"));
all_images = dir(path);


%[features, visualization] = extractHOGFeatures(I);
%plot(visualization);


% find all peice of pazzel
index = 1;
for i=3 : size(all_images, 1)
    if all_images(i).name(1:5) == "Patch"
        pieces(index) = all_images(i).folder + "\" + all_images(i).name;
        index = index + 1;

    end
    
end

x_size = size(I_start, 2);
y_size = size(I_start, 1);

x_pieces = x_size / pieces_size;
y_pieces = y_size / pieces_size;

for y=1 : pieces_size : y_size
   for x=1 : pieces_size : x_size
       if not ((x == 1 && y == 1) || (x == pieces_size * (x_pieces - 1) + 1 && y == 1) || (x==1 && y==pieces_size*(y_pieces-1)+1) || (x == pieces_size * (x_pieces - 1) + 1 && y==pieces_size*(y_pieces-1)+1 ))
           
           %ind = randi([1 size(pieces,2)]);
           ind = select_image(pieces, I_start, x, y, pieces_size, num_of_column);
           selected_pic = im2double(imread(pieces(ind)));
           pieces(ind) = [];
           I_start(y : y+pieces_size-1, x : x+pieces_size-1, : ) = selected_pic;
           %pause(0.1);
           imshow(I_start, []);

       end
   end
    
end










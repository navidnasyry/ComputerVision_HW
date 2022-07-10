


I = im2double(imread("./01_test.tif"));
R = 45;
threshold = 30;


I_g = I(:,:,2);

I_bw = im2bw(I_g, 0.55);

I_houph = zeros(size(I, 1), size(I, 2));

             
for y=1 : size(I,1)
   for x=1 : size(I, 2)
        if (I_bw(y,x) == 1)
         % (x-x0)^2 + (y-y0)^2 = r^2   
         for i=1 : size(I_houph,1)
             for j=1 : size(I_houph, 2)
                if (((i-y)^2 + (j-x)^2)+threshold >= R^2 && ((i-y)^2 + (j-x)^2)-threshold <= R^2)
                     I_houph(i,j) = I_houph(i,j) + 1;
                 end
             end
         end
       end
   end
end

% find maximum pixel
[row, col] = find(I_houph==max(max(I_houph)));
main_cir_y = row(1)
main_cir_x = col(1)



% draw circle 
imshow(I, []);
centx = main_cir_x ;
centy = main_cir_y ;
r = R;
hold on;
theta = 0 : (2 * pi / 10000) : (2 * pi);
pline_x = r * cos(theta) + centx;
pline_y = r * sin(theta) + centy;
k = ishold;
plot(pline_x, pline_y, 'b-', 'LineWidth', 5);
hold off;





global A;
global B;
global currentlabel;


I = imread("../Cells.tif");
excel_path = "../report.xlsx";
%I = imresize(I, 0.5);
level = multithresh(I, 1)
A = im2bw(I, double(level(1))/255);
%A = I >= level(1);
se = strel('disk', 2);
A = imopen(A, se);
%A = imclose(A, se);

imshow(A,[]);
B = zeros(size(A));
currentlabel = 0;

for y=1 : size(A,1)
    for x=1 : size(A,2)
        if A(y,x) == 1 && B(y,x) == 0
            currentlabel = currentlabel + 1
            CountCell(y, x);
            
        end
    end
end


Write2File(I, B, currentlabel, excel_path);
imshow(label2rgb(B),[]);


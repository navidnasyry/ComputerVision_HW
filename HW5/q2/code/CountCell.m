function CountCell(y, x)
    
    global A;
    global B;
    global currentlabel;

    max_y = size(A, 1);
    max_x = size(A, 2);
    
    all_neighbours = [y-1,x-1;
                y-1,x  ;
                y-1,x+1;
                y  ,x-1;
                y  ,x  ;
                y  ,x+1;
                y+1,x-1;
                y+1,x  ;
                y+1,x+1;];
     
    %select valid neighbours
    neighbours = [];
    for i=1 : 9
        cell = all_neighbours(i, :);
        if cell(1) > 0 && cell(1) <= max_y && cell(2) > 0 && cell(2) <= max_x
            if A(cell(1),cell(2)) == 1 && B(cell(1), cell(2)) == 0
                neighbours(size(neighbours,1)+1, : ) = cell;
            end
        end
    end
    
    
    B(y, x) = currentlabel;
    %imshow(B, []);
    for k=1 : size(neighbours,1)
        next = neighbours(k,:);
        CountCell(next(1),next(2));
    end

end


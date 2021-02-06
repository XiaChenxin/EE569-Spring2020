function count = modify(i,j,color)
    global mark
    global image
    global recovery
    count = 0;
if i>0 & i < 150 & j >0 & j <600
    mark(i,j) = 0;
    recovery = [recovery;i,j];
    count = 1;
    if i > 1
        if (image(i-1,j) == color & mark(i-1,j) == 1)
            count = count+modify(i-1,j,color);
        end
        if j > 1
            if (image(i-1,j-1) == color & mark(i-1,j-1) == 1)
                count = count+modify(i-1,j-1,color);
            end 
        end
        if j  < 600
            if (image(i-1,j+1) == color & mark(i-1,j+1) == 1)
                count = count+modify(i-1,j+1,color);
            end 
        end
    end
    
    if i < 450
        if (image(i+1,j) == color & mark(i+1,j) == 1)
            count = count+modify(i+1,j,color);
        end
        if j > 1
            if (image(i+1,j-1) == color & mark(i+1,j-1) == 1)
                count = count+modify(i+1,j-1,color);
            end 
        end
        if j < 600
            if (image(i+1,j+1) == color & mark(i+1,j+1) == 1)
                count = count+modify(i-1,j+1,color);
            end 
        end
    end
    if j > 1
        if (image(i,j-1) == color & mark(i,j-1) == 1)
            count = count+modify(i,j-1,color);
        end 
    end
    if j < 600
        if (image(i,j+1) == color & mark(i,j+1) == 1)
            count = count+modify(i,j+1,color);
        end 
    end
end
end

function count = modify1(x,y,color)
    global mark
    global image
    global recovery
    
    mark(x,y) = 0;
    recovery = [recovery;x,y];
    count = 1;
    if x - 1 > 0
        if (mark(x-1,y) == 1) & (image(x-1,y) == color)
            count = count+modify1(x-1,y,color);
        end
        if y -1 > 0
            if (mark(x-1,y-1) == 1) & (image(x-1,y-1) == color)
                count = count + modify1(x-1,y-1,color);
            end
        end
        if y + 1 < 601
            if (mark(x-1,y+1) == 1) & (image(x-1,y+1) == color)
                count = count + modify1(x-1,y+1,color);
            end
        end
    end
    
    if x + 1 < 451
        if (mark(x+1,y) == 1) & (image(x+1,y) == color)
            count = count+modify1(x+1,y,color);
        end
        if y -1 > 0
            if (mark(x+1,y-1) == 1) & (image(x+1,y-1) == color)
                count = count + modify1(x+1,y-1,color);
            end
        end
        if y + 1 < 601
            if (mark(x+1,y+1) == 1) & (image(x+1,y+1) == color)
                count = count + modify1(x+1,y+1,color);
            end
        end
    end
    
        if y -1 > 0
            if (mark(x,y-1) == 1) & (image(x,y-1) == color)
                count = count + modify1(x,y-1,color);
            end
        end
        if y + 1 < 601
            if (mark(x,y+1) == 1) & (image(x,y+1) == color)
                count = count + modify1(x,y+1,color);
            end
        end
end
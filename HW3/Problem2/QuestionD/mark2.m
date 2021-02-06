function count = mark2(x,y)
    count = 1;
    global image
    global recovery
    image(x,y) = 0;
    recovery = [recovery;x,y];
    if x - 1 > 0
        if image(x-1,y) == 1
            count = count + mark2(x-1,y);
        end
        %{
        if y - 1 >  0
            if image(x-1,y-1) == 1
                count = count + mark2(x-1,y-1);
            end
        end
        
         if y + 1 < 251
            if image(x-1,y+1) == 1
                count = count + mark2(x-1,y+1);
            end
         end
        %}
    end
 
    if x + 1 < 251
        if image(x+1,y) == 1
            count = count + mark2(x+1,y);
        end
        %{
        if y - 1 >  0
            if image(x+1,y-1) == 1
                count = count + mark2(x+1,y-1);
            end
        end
        
         if y + 1 < 251
            if image(x+1,y+1) == 1
                count = count + mark2(x+1,y+1);
            end
         end
        %}
    end
    
       if y - 1 >  0
            if image(x,y-1) == 1
                count = count + mark2(x,y-1);
            end
        end
        
         if y + 1 < 251
            if image(x,y+1) == 1
                count = count + mark2(x,y+1);
            end
         end
            
end
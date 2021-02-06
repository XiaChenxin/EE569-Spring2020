function result = TeeK(in)
    result = 0;
    if(in(2)=='1' && in(4)=='1'&& in(6) == '1' )
        result = 1;
    end
    
    if(in(4)=='1' && in(6)=='1'&& in(8) == '1' )
        result = 1;
    end
    
    if(in(2)=='1' && in(4)=='1'&& in(8) == '1')
        result = 1;
    end
    
    if(in(2)=='1' && in(6)=='1'&& in(8) == '1') 
        result = 1;
    end
end
function result = vee(in)
    result = 0;
    if ((in(1) == '1' && in(3) =='1')&&(in(7)=='1' || in(8) == '1' || in(9)=='1'))
        result =1;
    end
    if ((in(1) == '1' && in(7) =='1')&&(in(3)=='1' || in(6) == '1' || in(9)=='1'))
        result =1;
    end
    if ((in(7) == '1' && in(9) =='1')&&(in(1)=='1' || in(2) == '1' || in(3)=='1'))
        result =1;
    end
    if ((in(9) == '1' && in(3) =='1')&&(in(7)=='1' || in(4) == '1' || in(1)=='1'))
        result =1;
    end
end
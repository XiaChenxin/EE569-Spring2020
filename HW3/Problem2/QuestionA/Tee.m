%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
function result = Tee(in)
    result = 0;
    if(in(2)=='1' && in(4)=='1'&& in(6) == '1' && in(8) =='0')
        if (in(3) == '0' && in(9) =='0')
            result = 1;
        end
        if (in(1) == '0' && in(7) =='0')
            result = 1;
        end
    end
    
    if(in(4)=='1' && in(6)=='1'&& in(8) == '1' && in(2) =='0')
        if (in(3) == '0' && in(9) =='0')
            result = 1;
        end
        if (in(1) == '0' && in(7) =='0')
            result = 1;
        end
    end
    
    if(in(2)=='1' && in(4)=='1'&& in(8) == '1' && in(6) =='0')
        if (in(3) == '0' && in(1) =='0')
            result = 1;
        end
        if (in(9) == '0' && in(7) =='0')
            result = 1;
        end
    end
    
    if(in(2)=='1' && in(6)=='1'&& in(8) == '1' && in(4) =='0')
        if (in(3) == '0' && in(1) =='0')
            result = 1;
        end
        if (in(9) == '0' && in(7) =='0')
            result = 1;
        end
    end
end
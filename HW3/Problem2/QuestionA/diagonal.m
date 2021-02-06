%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
function result = diagonal(in)
    result = 0;
    if (in(2)=='1'&& in(6)=='1'&& in(7)=='1'&& in(3)=='0'&& in(4)=='0'&& in(8)=='0')
        result = 1;
    end
    
    if (in(3)=='1'&& in(4)=='1'&& in(8)=='1'&& in(2)=='0'&& in(6)=='0'&& in(7)=='0')
        result = 1;
    end
    
    if (in(2)=='1'&& in(4)=='1'&& in(9)=='1'&& in(1)=='0'&& in(6)=='0'&& in(8)=='0')
        result = 1;
    end
    
    if (in(1)=='1'&& in(6)=='1'&& in(8)=='1'&& in(2)=='0'&& in(4)=='0'&& in(9)=='0')
        result = 1;
    end
end
    
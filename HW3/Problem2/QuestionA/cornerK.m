%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
function result = cornerK(in)
    result = 0;
    if(in(1) =='1' && in(2) == '1' && in(4) =='1')
        result = 1;
    end
    if(in(6) =='1' && in(8) == '1' && in(9) =='1')
        result = 1;
    end
end
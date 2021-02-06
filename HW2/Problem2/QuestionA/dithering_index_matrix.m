%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb 11, 2020
function T = dithering_index_matrix(n)
    I = [1 2;3 0];
    m = 2;
    while m < n
        temp = zeros(m*2,m*2);
        for x = 1 : m
            for y = 1 : m
                temp(x,y) = I(x,y)*4+1;
                temp(x+m,y) = I(x,y)*4+3;
                temp(x,y+m) = I(x,y)*4+2;
                temp(x+m,y+m) = I(x,y)*4;
            end
        end
        m = m*2;
        I =temp;            
    end
    T = zeros(n,n);
    for x = 1 : 1 : n
        for y = 1 : 1 : n
            T(x,y) = (I(x,y)+0.5)*255/(n^2);
        end
    end
end
    

%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
function result = binarize(ori_image)
    [x,y] = size(ori_image);
    result = zeros(x,y);
    for i = 1 : x
        for j = 1 : y
            if ori_image(x,y) > 1
                result(x,y) = 1;
            else
                result(x,y) = 0;
            end
        end
    end
end
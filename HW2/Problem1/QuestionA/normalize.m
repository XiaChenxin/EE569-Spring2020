%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb.11, 2020

function result = normalize(ori_image)
    maxium = max(max(ori_image));
    minium = min(min(ori_image));
    range = maxium - minium;
    [height,wideth] = size(ori_image);
    result = zeros(height,wideth);
    for x = 1 : 1 : height
        for y = 1 : 1 : wideth
            result(x,y) = floor((ori_image(x,y)-minium)*255/range);
        end
    end
end
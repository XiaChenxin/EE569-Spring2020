%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb.11 , 2020

function result = change2gray(ori_image)
    [hight,breadth,layers] = size(ori_image);
    gray = zeros(hight,breadth);
    for row = 1 : 1 : hight
        for column = 1 : 1 : breadth
            gray(row,column) = 0.2989*ori_image(row,column,1)+...
                0.5870*ori_image(row,column,2)+...
                0.1140*ori_image(row,column,3);
        end
    end
    result = gray;
 
end
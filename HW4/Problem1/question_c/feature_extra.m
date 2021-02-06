%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 16, 2020
function result = feature_extra(ori_image)
    [hight,wideth] = size(ori_image);
    filter = zeros(5,5); 
    filter(1,:) = [1 4 6 4 1];    %L5
    filter(2,:) = [-1 -2 0 2 1];  %E5
    filter(3,:) = [-1 0 2 0 -1];  %S5
    filter(4,:) = [-1 2 0 -2 1];  %W5
    filter(5,:) = [1 -4 6 -4 1];  %R5
    result = zeros(15,1);
    %LL LE LS LW LR EE ES EW ER SS SW SR WW WR RR
    mark = 0;
    result = zeros(hight,wideth,15);
    for i = 1 : 5
        for j = i : 5
            mark = mark +1;
            filter1 = filter(i,:)'*filter(j,:);
            filter2 = filter(j,:)'*filter(i,:);
            r1 = abs(convolution2D(ori_image,filter1));
            r2 = abs(convolution2D(ori_image,filter2));
            result(:,:,mark) = (r1+r2)/2;
        end
    end
end
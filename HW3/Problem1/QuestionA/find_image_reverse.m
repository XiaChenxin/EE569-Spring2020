%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 3, 2020
function [x_image_out,y_image_out] = find_image_reverse(height,x_cartisian,y_cartisian,radius,ori_x)
    y_difference = abs(ori_x - y_cartisian);
    chord = 2*sqrt(radius^2 - y_difference^2);
    x_difference = ori_x - chord/2;
    percentage = (x_cartisian)/(height);
    y_image_out = chord*percentage+x_difference;
    x_image_out = height + 0.5 - y_cartisian;
end
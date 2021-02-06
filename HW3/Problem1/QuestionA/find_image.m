%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 3, 2020
function [x_image_out,y_image_out] = find_image(height,x_cartisian,y_cartisian,radius,ori_x)
    y_difference = abs(ori_x - y_cartisian);
    chord = 2*sqrt(radius^2 - y_difference^2);
    x_difference = ori_x - chord/2;
    percentage = (x_cartisian-x_difference)/chord;
    y_image_out = height*percentage;
    x_image_out = height + 0.5 - y_cartisian;
end
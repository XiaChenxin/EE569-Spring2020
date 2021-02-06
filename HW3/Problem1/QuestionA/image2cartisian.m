%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 3, 2020
function [x_cartisian,y_cartisian] = image2cartisian(hight,x_image,y_image)
    x_cartisian = y_image - 0.5;
    y_cartisian = hight - x_image +0.5;
end
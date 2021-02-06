function [x_image,y_image] = cartisian2image(height,x_cartisian,y_cartisian)
    y_image = x_cartisian+0.5;
    x_image = height - y_cartisian +0.5;
end
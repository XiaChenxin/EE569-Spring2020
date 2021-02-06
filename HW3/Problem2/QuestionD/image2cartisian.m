function [x_cartisian,y_cartisian] = image2cartisian(height,x_image,y_image)
    x_cartisian = y_image - 0.5;
    y_cartisian = height - x_image +0.5;
end
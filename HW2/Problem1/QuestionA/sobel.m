%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb.11, 2020

function result = sobel(file,percentage)
%Apply sobel edgr dection to target image
%%file : target image file name
    path = file+".raw";
    ori_image = readraw24(path,321,481);
    gray_image = change2gray(ori_image);
    [hight,wideth,layers] = size(ori_image);
    
    sobel_x = [-1 0 1;-2 0 2;-1 0 1]/4;
    sobel_y = [-1 -2 -1;0 0 0;1 2 1]/4;
    
    %% calculate x y gradient 
    %get x-gradient and y-gradient value
    sobel_x_gradient = convolution2D(gray_image,sobel_x);
    sobel_y_gradient = convolution2D(gray_image,sobel_y);
    %normalize x-gradient and y-gradient to 0-255
    sobel_x = normalize(sobel_x_gradient);
    label = file+"_x-gradient.raw";
    writeraw(sobel_x,label)
 
    sobel_y = normalize(sobel_y_gradient);
    label = file+"_y-gradient.raw";
    writeraw(sobel_y,label)
   
    %% calculate gradient magnitude map
    
    gradient_map = zeros(hight,wideth);
    for row = 1:hight
        for column = 1:wideth
            gradient_map(row,column) = sqrt(sobel_x_gradient(row,column)^2+...
                sobel_y_gradient(row,column)^2);
        end
    end
    gradient_n_map = normalize(gradient_map);
    label = file+"gradient magnitude map.raw";
    writeraw(gradient_n_map,label);

    %% edge detection
    pixel_calculate = zeros(1,256);
    for row = 1:hight
        for column = 1:wideth
            pixel_calculate(gradient_n_map(row,column)+1) = ...
                pixel_calculate(gradient_n_map(row,column)+1)+1;
        end
    end
   amount = 0;
   label = 0;
   for location=1:256
       amount = amount + pixel_calculate(location);
       if amount > floor(321*481*percentage/100)
           label = location-1;
           break;
       end
   end
   result = zeros(hight,wideth);
   for row = 1:hight
        for column = 1:wideth
            if gradient_n_map(row,column) <label
                result(row,column) = 0;
            else
                result(row,column) = 1;
            end
        end
    end
    label = file+"output.raw";
    result = (1-result)*255;
    writeraw(result,label);

end
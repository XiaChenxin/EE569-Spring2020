%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 3, 2020
function output = disklize(ori_image)
    [height,width] = size(ori_image);
    ori_x = width/2;
    ori_y = height/2;
    radius = sqrt(0.5^2+(ori_x-0.5)^2);
    result = zeros(height,width);
    for x_image = 1 : height
        for y_image = 1 : width
            [x_cartisian,y_cartisian] = image2cartisian(height,x_image,y_image);
            if (x_cartisian-ori_x)^2+(y_cartisian-ori_y)^2 <= radius ^2
                [x_image_out,y_image_out] = find_image(height,x_cartisian,y_cartisian,radius,ori_x);
                result(x_image,y_image) = interpolate(height,ori_image,x_image_out,y_image_out);
            end
        end
    end

    key = zeros(height,height);
    for x_image = 1 : height
        for y_image = 1 : width
            [x_cartisian,y_cartisian] = image2cartisian(height,x_image,y_image);
            if (x_cartisian-ori_x)^2+(y_cartisian-ori_y)^2 <= radius ^2
                key(x_image,y_image)=1;
            end
        end
    end
    for x_image = 1 : height
        for y_image = 1 : width-1
            if key(x_image,y_image) == 0 && key(x_image,y_image+1) == 1
                result(x_image,y_image+1) = ori_image(x_image,1);
            elseif key(x_image,y_image) == 1 && key(x_image,y_image+1) == 0
                result(x_image,y_image) = ori_image(x_image,height);
            end
        end
    end

    output = result;
    output(256:257,1,:) = ori_image(256:257,1,:);
    
end
            
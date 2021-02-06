function output = reverse_disklize(ori_image)
    [height,width] = size(ori_image);
    ori_x = width/2;
    ori_y = height/2;
    radius = sqrt(0.5^2+(ori_x-0.5)^2);
    result = zeros(height,width);
    
    key = zeros(height,height);
    for x_image = 1 : height
        for y_image = 1 : width
            [x_cartisian,y_cartisian] = image2cartisian(height,x_image,y_image);
            if (x_cartisian-ori_x)^2+(y_cartisian-ori_y)^2 <= radius ^2
                key(x_image,y_image)=1;
            end
        end
    end
    
    
    for x_image = height:-1:1
        for y_image = width:-1:1
            [x_cartisian,y_cartisian] = image2cartisian(height,x_image,y_image);
            [x_image_out,y_image_out] = find_image_reverse(height,x_cartisian,y_cartisian,radius,ori_x);
            result(x_image,y_image) = interpolate_reverse(height,ori_image,x_image_out,y_image_out,key);
        end
    end
    output = result;
     output(256:257,1,:) = ori_image(256:257,1,:);
end
            
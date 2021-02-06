%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu

function result = interpolate_reverse(height,ori_image,x_image_out,y_image_out,key)
    
    lower = floor(y_image_out);
    upper = ceil(y_image_out);
    if lower == 0
        lower = 1;
    end
    if upper == 513
        upper = 512;
    end
    if key(x_image_out,lower) == 0
        i = 1;
        while key(x_image_out,lower+i) == 0
            i=i+1;
        end
        result = ori_image(x_image_out,lower+i);
    elseif key(x_image_out,upper)==0
        i = -1;
        while key(x_image_out,upper+i) == 0
            i=i-1;
        end
        result = ori_image(x_image_out,upper+i);
    elseif y_image_out == floor(y_image_out)
        result = ori_image(x_image_out,y_image_out);
    else
        result = (1-abs(lower-y_image_out))*ori_image(x_image_out,lower)+...
            (1-abs(upper-y_image_out))*ori_image(x_image_out,upper);
    end

end
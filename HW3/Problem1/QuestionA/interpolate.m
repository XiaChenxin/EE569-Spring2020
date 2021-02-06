%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 3, 2020

function result = interpolate(height,ori_image,x_image_out,y_image_out)

    if y_image_out<=1
        result = ori_image(x_image_out,1);
    elseif y_image_out>=height
        result = ori_image(x_image_out,height);
    elseif y_image_out == floor(y_image_out)
        result = ori_image(x_image_out,y_image_out);
    else
        lower = floor(y_image_out);
        upper = ceil(y_image_out);
        result = (1-abs(lower-y_image_out))*ori_image(x_image_out,lower)+...
            (1-abs(upper-y_image_out))*ori_image(x_image_out,upper);
    end

end
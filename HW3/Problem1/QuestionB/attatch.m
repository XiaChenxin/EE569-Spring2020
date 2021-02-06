%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
function result = attatch(left,y1,x1,result,y2,x2)
    matrix = [];
    for i =1:4
        matrix = [matrix;x1(i),y1(i),1,0,0,0,-1*x1(i)*x2(i),-1*x2(i)*y1(i)];
    end
    for i =1:4
        matrix = [matrix;0,0,0,x1(i),y1(i),1,-1*x1(i)*y2(i),-1*y2(i)*y1(i)];
    end
    XY = [x2(1); x2(2); x2(3); x2(4); y2(1); y2(2); y2(3); y2(4)];
    h = inv(matrix)*XY;
    
    mid_left = zeros(720*3,480*5,3);
    for i = 1:720
        for j = 1:480
            for layer = 1:3
                mid_left(i+720,j+480*2,layer) = left(i,j,layer);
            end
        end
    end
    for x = 1:720*3
        for y = 1:480*5
            trans = [h(7)*x-h(1) h(8)*x-h(2);...
                     h(7)*y-h(4) h(8)*y-h(5)];
            XY = [h(3) - x;h(6)-y];
            xy = trans\XY;
            if xy(1) >= 721 && xy(1) <= 1439 && xy(2) >= 961 && xy(2) <= 480*3-1
                x_min = floor(xy(1));
                x_max = floor(xy(1));
                y_min = floor(xy(2));
                y_max = floor(xy(2));
                p = xy(1)-x_min;
                q = xy(2)-y_min;
                r1 = (1-p)*(1-q)*mid_left(x_min,y_min,1)+p*(1-q)*mid_left(x_max,y_min,1)+...
                    (1-p)*q*mid_left(x_min,y_max,1)+p*q*mid_left(x_max,y_max,1);
                r2 = (1-p)*(1-q)*mid_left(x_min,y_min,2)+p*(1-q)*mid_left(x_max,y_min,2)+...
                    (1-p)*q*mid_left(x_min,y_max,2)+p*q*mid_left(x_max,y_max,2);
                r3 = (1-p)*(1-q)*mid_left(x_min,y_min,3)+p*(1-q)*mid_left(x_max,y_min,3)+...
                    (1-p)*q*mid_left(x_min,y_max,3)+p*q*mid_left(x_max,y_max,3);
                if sum(result(x,y,:)==0)
                    result(x,y,1) = r1;
                    result(x,y,2) = r2;
                    result(x,y,3) = r3;
                else
                    result(x,y,1) =(result(x,y,1)+r1)/2;
                    result(x,y,2) =(result(x,y,2)+r2)/2;
                    result(x,y,3) =(result(x,y,3)+r3)/2;
                    
                end
            end
        end
    end
end
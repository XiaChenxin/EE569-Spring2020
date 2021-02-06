%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb 11, 2020

function result = error_d2(ori,mask,n)
    [xrange,yrange] = size(ori);
    mid = zeros(2*n+xrange,2*n+yrange);
    for i = 1:xrange
        for j = 1:yrange
            mid(n+i,n+j)=ori(i,j);
        end
    end
    x = 1;y=0;direction=1;
    while 1
        y = y + direction;
        if y > yrange
            y = yrange;
            direction = -1*direction;
            x = x+1;
        end
        if y< 1
            y = 1;
            direction = -1*direction;
            x = x+1;
        end
        if x > xrange
           break
        end
        
        old = mid(n+x,n+y);
        mid(n+x,n+y) = c2g(old);
        error = old - mid(n+x,n+y);
        
        for i = 1:n
            mid(n+x,n+y+i*direction)=mid(n+x,n+y+i*direction)+...
                error*mask(n+1,n+1+i);
        end
        
        
        for i = -1*n:1:n
            for j = 1:1:n
                mid(n+x+j,n+y+i*direction)=mid(n+x+j,n+y+i*direction)+...
                    error*mask(n+1+j,n+1+i);
            end
        end
        
    end
    result = zeros(xrange,yrange);
    for i = 1:xrange
        for j = 1:yrange
            result(i,j)=mid(i+n,j+n);
        end
    end
end
%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
function f = convolution2D(ori,fil) 
    %{
    function: convolution between ori and fil
    description: cannot deal with even width or hight filter or filter larger
    than 5*5

    imput:
        ori: original image matrix
        fil: filter matrix whose width and heighth are odd

    output:
        f:  image matrix after operation

    version 1.0.0
    copyright by Chenxin Xia
    2020.01.20
    %}

    [x1,y1] = size(ori);
    [x2,y2] = size(fil);
    
    mid = zeros(x1+x2-1,y1+y2-1); %Borded image
    outimage = zeros(x1,y1);%result matrix
    
    xk = (x2 - 1) / 2; %extended height
    yk = (y2 - 1) / 2; %extended width
    
    %%%%%%%%%%%%%%% load original image %%%%%%%%%%%%%%%%%
    for i = 1 : 1 : x1
        for j = 1 : 1 : y1
            mid(i + xk ,j + yk) = ori(i,j);
        end
    end
    
    %%%%%%%%%%%%%%%% bounding image %%%%%%%%%%%%%%%%%%%%%
    for i = 1 : xk
        for j = 1 : y1
            mid(i,j+yk) = mid(2*xk+2-i,j+yk);
            mid(x1+x2-i,j+yk) = mid(x1+i-1,j+yk);
        end
    end
    
    for i = 1 : x1+x2-1
        for j = 1 : yk
            mid(i,j) = mid(i,x2+1-j);
            mid(i,y1+y2-j)=mid(i,y1+j-1);
        end
    end
    
    
    %%%%%%%%%%%%%%%%% image convolution %%%%%%%%%%%%%%%%%
    
    sum = 0;
    for i = 1 : 1 : x1
        for j = 1 : 1 : y1
            for n = 1 : 1 : x2
                for m = 1 : 1 :y2
                    sum = sum + fil(n,m)*mid(i+n-1,j+m-1);
                end
            end
            outimage(i,j) = sum;
            sum = 0;
        end
    end
    
    f = outimage;    
end
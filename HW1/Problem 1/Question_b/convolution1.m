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
    mid(1,1) = ori(2,2);
    mid(2+x1,1) = ori(x1-1,2);
    mid(1,2+y1) = ori(2,y1-1);
    mid(2+x1,2+y1) = ori(x1-1,y1-1);
    for m = 1 : 1 :y1
        mid(1,1+m) = ori(2,m);
        mid(2+x1,1+m) = ori(x1-1,m);
    end

    for m = 1 : 1 :x1
        mid(1+m,1) = ori(m,2);
        mid(1+m,2+y1) = ori(m,y1-1);
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
            outimage(i,j) = round(sum);
            sum = 0;
        end
    end
    
    f = outimage;    
end
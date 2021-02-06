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
    
    mid = zeros(x1+4,y1+4); %Borded image
    outimage = zeros(x1,y1);%result matrix
    
    xk = (x2 - 1) / 2; %extended height
    yk = (y2 - 1) / 2; %extended width
    
    %%%%%%%%%%%%%%% load original image %%%%%%%%%%%%%%%%%
    for i = 1 : 1 : x1
        for j = 1 : 1 : y1
            mid(i + 2 ,j + 2) = ori(i,j);
        end
    end
    %%%%%%%%%%%%%%%% mirror padding %%%%%%%%%%%%%%%%%%%%%
    
    for i = 1 : 1 : x1
        mid(i+2,1)=ori(i,3);
        mid(i+2,2)=ori(i,2);
        mid(i+2,y1+4) = ori(i,y1-2);
        mid(i+2,y1+3) = ori(i,y1-1);
    end
    
    for i = 1 : 1 : y1
        mid(1,i+2)=ori(3,i);
        mid(2,2+i)=ori(2,i);
        mid(x1+4,i+2) = ori(x1-2,i);
        mid(x1+3,i+2) = ori(x1-1,i);
    end
    
    mid(1,1)=ori(3,3);mid(2,2)=ori(2,2);
    mid(2,1)=ori(2,3);mid(1,2)=ori(3,2); 
    
    mid(x1+4,1)=mid(x1,1);mid(x1+3,1)=mid(x1+1,1);
    mid(x1+3,2)=mid(x1+1,2);mid(x1+4,2)=mid(x1,2);
    
    mid(1,y1+4)=mid(1,y1);mid(2,y1+3)=mid(2,y1+1);
    mid(2,y1+4)=mid(2,y1);mid(1,y1+3)=mid(1,y1+1);
    
    mid(x1+4,y1+4)=mid(x1,y1);mid(x1+3,y1+3)=mid(x1+1,y1+1);
    mid(x1+3,y1+4)=mid(x1+1,y1);mid(x1+4,y1+3)=mid(x1,y1+1);
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
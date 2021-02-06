%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
%
%bf.m
%Bilateral Filtering
%
%created by Chenxin Xia
%2020.01.23
%version 1.0
%

function [result]=bf(thegmac,thegmas,N,noisy)
    [x1,y1] = size(noisy);
    %bounding image
    x2 = N;y2=N;
    mid = zeros(x1+x2-1,y1+y2-1); %Borded image    
    xk = (x2 - 1) / 2; %extended height
    yk = (y2 - 1) / 2; %extended width
    
    %%%%%%%%%%%%%%% load original image %%%%%%%%%%%%%%%%%
    for i = 1 : 1 : x1
        for j = 1 : 1 : y1
            mid(i + xk ,j + yk) = noisy(i,j);
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
    
    
    %denoising
    result = zeros(x1,y1);
    for i = xk+1 : x1+xk
        for j = yk+1 : y1+yk
            filter = zeros(N,N);
            sum = 0;
            fil = 0;
            for n = 1:N
                for m = 1:N
                    k = (N+1)/2;
                    c = ((n-k)^2+(m-k)^2)/(2*thegmac^2);
                    s = (mid(i,j)-mid(i-k+n,j-k+m))^2/(2*thegmas^2);
                    filter(n,m)=exp(-1*(c+s));
                    fil = fil +filter(n,m);
                    sum = sum + filter(n,m)*mid(i-k+n,j-k+m);
                 end
             end
             result(i-xk,j-yk) = sum/fil;
         end
     end
end

%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
%
%psnr.m
%peak signal to noise ratio
%
%created by Chenxin Xia
%2020.01.22
%version 1.0
%

function f = psnr(ori,fil)
    [x,y] = size(ori);
    MSE = 0;
    for i = 1 : 1 : x
        for j = 1 : 1 : y
            MSE = MSE + (ori(i,j)-fil(i,j))^2;
        end
    end
    MSE = MSE/(x*y);
    Max = 255*255;
    if MSE == 0
        MSE = 1
    end
    f = 10 * log10(Max/MSE);
end
    
            
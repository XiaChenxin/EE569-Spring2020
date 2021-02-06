%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
%
%histogramcolorshow.m
%display histogram of each color channel
%
%created by Chenxin Xia
%2020.01.20
%version 1.1
%

function histogramcolorshow(R,G,B,name)
    % Plot red
    num = zeros(1,256);
    for i = 1:1:560
        for j = 1:1:400
            num(1,R(i,j)+1) = num(1,R(i,j)+1) + 1;
        end
    end
    
    figure

    m = "histograms of "+name+" image--Red channel";
    bar(num,'r')
    title(m)

    % Plot Green
    num = zeros(1,256);
    for i = 1:1:560
        for j = 1:1:400
            num(G(i,j)+1) = num(G(i,j)+1) + 1;
        end
    end
    figure
    m = "histograms of "+name+" image--Green channel";
    bar(num,'g')
    title(m)

    % Plot Blue
    num = zeros(1,256);
    for i = 1:1:560
        for j = 1:1:400
            num(B(i,j)+1) = num(B(i,j)+1) + 1;
        end
    end
    figure
    m = "histograms of "+name+" image--Blue channel";
    bar(num,'b')
    title(m)


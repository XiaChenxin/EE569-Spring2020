%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb 11, 2020
clc
clear
close all
%% original image retrive
ori_image = readraw("LightHouse.raw");

%% Fixed thresholding
% at here we choose the threshold as 128
fix_image = zeros(500,750);
for row = 1 : 1 : 500
    for column = 1 : 1 : 750
        if ori_image(row,column) < 129
            fix_image(row,column) = 0;
        else
            fix_image(row,column) = 255;
        end
    end
end
writeraw(fix_image,"Light_house_fixed_thresholding.raw");


%% Random thresholding
random_image = zeros(500,750);
for row = 1 : 1 : 500
    for column = 1 : 1 : 750
        if ori_image(row,column) < floor(rand(1)*255)
            random_image(row,column) = 0;
        else
            random_image(row,column) = 255;
        end
    end
end
writeraw(random_image,"Light_house_random_thresholding.raw");

%% Dithering Matrix
I = [2,8,32];
title_I = ["2","8","32"];
for i = 1 : 1 : 3
    T = dithering_index_matrix(I(i));
    temp = zeros(500,750);
    for row = 1 : 1 : 500
        for column = 1 : 1 : 750
            xlabel = mod(row,I(i));
            ylabel = mod(column,I(i));
            if xlabel == 0
                xlabel = I(i);
            end
            if ylabel == 0
                ylabel = I(i);
            end
            if ori_image(row,column) < T(xlabel,ylabel)    
                temp(row,column) = 0;
            else
                temp(row,column) = 255;
            end
        end
    end
    present = "Light_House_Dithering_Matrix_for I"+title_I(i)+".raw";
    writeraw(temp,present);
end

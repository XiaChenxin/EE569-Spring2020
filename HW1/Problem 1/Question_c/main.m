%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
%
%main.m
% (a)Plot the histograms of the red, green and blue channels of
%   the original image.
% (b)Transfer-function-based histogram equalization method
% (c)cumulative-probability-based histogram equalization method
%
%created by Chenxin Xia
%2020.01.21
%version 1.2
%
clear
clc
close all
%Get image
ori = readraw24("Toy.raw");


%%%Plot the histograms of the red, green and blue channels of the original image.
%initialize R,G,B
R = zeros(560,400);
G = zeros(560,400);
B = zeros(560,400);

for i = 1:1:560
    for j = 1:1:400
        R(i,j) = ori(i,j,1); 
        G(i,j) = ori(i,j,2);
        B(i,j) = ori(i,j,3);
    end
end
histogramcolorshow(R,G,B,"original")

%%% Transfer-function-based histogram equalization method
trans =zeros(560,400,3);
trans(:,:,1) = transf(R,"red");
trans(:,:,2) = transf(G,"green");
trans(:,:,3) = transf(B,"blue");
histogramcolorshow(trans(:,:,1),trans(:,:,2),trans(:,:,3),"transfer function")



rawoutput = zeros(560,1200);
for i = 1:1:560
    for j = 1:1:400
        rawoutput(i,3*(j-1)+1)=trans(i,j,1);
        rawoutput(i,3*(j-1)+2)=trans(i,j,2);
        rawoutput(i,3*(j-1)+3)=trans(i,j,3);
    end
end
writeraw(rawoutput,"Toy_out_trans.raw");


%cumulative-probability-based histogram equalization method
result = zeros(560,400,3);
result(:,:,1) = bucket_filling(R,"red");
result(:,:,2) = bucket_filling(G,"green");
result(:,:,3) = bucket_filling(B,"blue");

histogramcolorshow(result(:,:,1),result(:,:,2),result(:,:,3),"cumulative-probability-based")

for i = 1:1:560
    for j = 1:1:400
        for k = 1:1:3
            result(i,j,k) = result(i,j,k);
        end
    end
end

rawoutput = zeros(560,1200);
for i = 1:1:560
    for j = 1:1:400
        rawoutput(i,3*(j-1)+1)=result(i,j,1);
        rawoutput(i,3*(j-1)+2)=result(i,j,2);
        rawoutput(i,3*(j-1)+3)=result(i,j,3);
    end
end
writeraw(rawoutput,"Toy_out_cul.raw");








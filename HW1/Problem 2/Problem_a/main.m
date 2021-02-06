%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
%
%main.m
%Apply a linear filter of size N by N to the noisy image. 
%Compare the performance of two choices of the filter parameters
%the uniform weight function and the Gaussian weight function.
%
%created by Chenxin Xia
%2020.01.22
%version 1.0
%

clc
clear
close all

%retrieve two images
ori = readraw("Corn_gray.raw");
noisy = readraw("Corn_noisy.raw");
[x,y] = size(ori);
label = psnr(ori,noisy);

% the uniform weight function

for i = 1:2:11
    filter = ones(i,i)/(i*i);
    noi = convolution2D(noisy,filter);
    k = psnr(ori,noi);
    if k > label
        label = k;
        N = i;
    end
end

filter = ones(N)/(N*N);
noi = convolution2D(noisy,filter);
N;
uwf = psnr(ori,noi)
writeraw(noi,"Corn_out_uniform.raw");



% Gaussian weight function

filter3 = [1/16 1/8 1/16;1/8 1/4 1/8;1/16 1/8 1/16];
filter5 = [1 4 7 4 1;4 16 26 16 4;7 26 41 26 7;4 16 26 16 4;1 4 7 4 1];
for i = 1 : 5
    for j = 1:5
        filter5(i,j) = filter5(i,j)/273;
    end
end
filter7 = [0 0 1 2 1 0 0;0 3 13 22 13 3 0;1 13 59 97 59 13 1;...
    2 22 97 159 97 22 2;1 13 59 97 59 13 1;0 3 13 22 13 3 0;0 0 1 2 1 0 0];
for i = 1 : 7
    for j = 1:7
        filter7(i,j) = filter7(i,j)/1003;
    end
end
noi3 = convolution2D(noisy,filter3);
k3 = psnr(ori,noi3);
noi5 = convolution2D(noisy,filter5);
k5 = psnr(ori,noi5);
noi7 = convolution2D(noisy,filter7);
k7 = psnr(ori,noi7);
gwf = max([k3,k5,k7])
writeraw(noi3,"Corn_out_gaussian.raw");










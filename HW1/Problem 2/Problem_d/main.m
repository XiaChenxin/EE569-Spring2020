%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020

clc
clear
close all
ori = readraw("Corn_gray.raw");
noisy = readraw("Corn_noisy.raw");
[PSNR,mid]=BM3D(ori,noisy,20,'lc',0);
output = round(mid*255);
writeraw(output,"Corn_BM3D.raw");

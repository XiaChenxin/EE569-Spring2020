%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
%
%main.m
%Bilateral Filtering
%
%Created by Chenxin Xia
%2020.01.23
%version 1.0
%
%1.6 74 5
clc
clear
close all

ori = readraw("Corn_gray.raw");
noisy = readraw("Corn_noisy.raw");

k = psnr(ori,noisy);
M = zeros(320,320);
[result]=bf(1.6,74,5,noisy);
output = zeros(320,320);
for i = 1:320
    for j = 1:320
        output(i,j) = round(result(i,j));
    end
end
psnr(ori,output)
writeraw(output,"Corn_out.raw");



        
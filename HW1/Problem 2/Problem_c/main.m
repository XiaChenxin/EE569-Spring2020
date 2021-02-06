%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %
 %  input: image to be filtered
 %  t: radio of search window 5        5*5大小的搜索窗
 %  f: radio of similarity window 2 
 %  h: degree of filtering 10
 %
 %  Author: Jose Vicente Manjon Herrera & Antoni Buades
 %  Date: 09-03-2006
 %
 %  Implementation of the Non local filter proposed for A. Buades, B. Coll and J.M. Morel in
 %  "A non-local algorithm for image denoising"
 %  https://blog.csdn.net/u014694994/article/details/94973874
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020


clc
clear
close all
ori = readraw("Corn_gray.raw");
noisy = readraw("Corn_noisy.raw");

result = NLmeansfilter(noisy,10,8,15);
imshow(result/255)

writeraw(result,"Corn_out.raw");
psnr(result,ori)
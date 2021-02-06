%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb.15 , 2020
clc
clear
close all


ori_image = change2gray(readraw24("Dogs.raw",321,481)/255);
result = edge(ori_image,'canny',[0.1,0.3],2);
result=255*(1-result);
writeraw(result,"Dogs_out.raw");


ori_image = change2gray(readraw24("Gallery.raw",321,481)/255);
result = edge(ori_image,'canny',[0.1,0.3],2);
result=255*(1-result);
writeraw(result,"Gallery_out.raw");



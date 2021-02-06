% EE569 Homework Assignment #1
% Date:    January 28, 2020
% Name:    Chenxin Xia
% ID:      2838929158
% email:   Chenxinx@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2: 	        Image Denoising 
% Implementation 1:     uniform weight function lowpass filter
% Implementation 2:     gaussian weight function lowpass filter 
% M-file name:          main.m
% Usage:                main
% Output image:         Corn_out_uniform.raw
%                       Corn_out_gaussian.raw
% Parameters:           RAW image size :320*320
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Running Code');
figure(1)
main;
disp('Done, output image is "Corn_out_uniform.raw"');
disp('Done, output image is "Corn_out_gaussian.raw"');
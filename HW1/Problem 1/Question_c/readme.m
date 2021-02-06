% EE569 Homework Assignment #1
% Date:    January 28, 2020
% Name:    Chenxin Xia
% ID:      2838929158
% email:   Chenxinx@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1: 	        Image Demosaicing and Histogram Manipulation 
% Implementation 1:     transfer-function-based histogram equalization
% Implementation 2:     cumulative-probability-based histogram equalization method 
% M-file name:          main.m
% Usage:                main
% Output image:         Dog_out_cul.raw
%                       Dog_out_trans.raw
% Parameters:           RAW image size :560*400
%       ! 
%      !!! 
%     !!!!! Notice many Windows pop up in this program
%    !!!!!!! 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Running Code');
figure(1)
main;
disp('Done, output image is "Dog_out_cul.raw"');
disp('Done, output image is "Dog_out_trans.raw"');
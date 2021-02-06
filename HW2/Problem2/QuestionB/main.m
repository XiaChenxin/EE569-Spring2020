%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb 11, 2020

%main.m
%Error Diffusion method for halftoning
clc
clear
ori = readraw("LightHouse.raw");
Floyd_Steinberg_diffusion = [0 0 0;0 0 7;3 5 1]/16;
JJN_diffusion = [0 0 0 0 0;0 0 0 0 0;0 0 0 7 5;...
    3 5 7 5 3; 1 3 5 3 1]/48;
Stucki_diffusion = [0 0 0 0 0;0 0 0 0 0;0 0 0 8 4;...
    2 4 8 4 2; 1 2 4 2 1]/42;

mask=[0 0 0;0 0 7;3 5 1]/16;

k=error_d2(ori,Floyd_Steinberg_diffusion,1);
writeraw(k,"LightHouse_Floyd_Steinberg_diffusion.raw");

k=error_d2(ori,JJN_diffusion,2);
writeraw(k,"LightHouse_JJN_diffusion.raw");


k=error_d2(ori,Stucki_diffusion,2);
writeraw(k,"LightHouse_Stucki_diffusion.raw");

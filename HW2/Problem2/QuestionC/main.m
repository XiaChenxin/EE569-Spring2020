%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb 12, 2020
clc
clear
close all
ori = readraw24("Rose.raw");
%% Separable Error Diffusion
[xrange,yrange,zrange]=size(ori);
cmy=zeros(xrange,yrange,zrange);
for j = 1:xrange
    for i =1:yrange
        for k = 1:zrange
            cmy(j,i,k)=255-ori(j,i,k);
        end
    end
end

Floyd_Steinberg_diffusion = [0 0 0;0 0 7;3 5 1]/16;
result = zeros(xrange,yrange,zrange);
result(:,:,1)=error_d2(cmy(:,:,1),Floyd_Steinberg_diffusion,1);
result(:,:,2)=error_d2(cmy(:,:,2),Floyd_Steinberg_diffusion,1);
result(:,:,3)=error_d2(cmy(:,:,3),Floyd_Steinberg_diffusion,1);
RGB=zeros(xrange,yrange,zrange);
for j = 1:xrange
    for i =1:yrange
        for k = 1:zrange
            rgb(j,i,k)=255-result(j,i,k);
        end
    end
end
rawoutput = zeros(xrange,yrange*3);
for i = 1:1:xrange
    for j = 1:1:yrange
        rawoutput(i,3*(j-1)+1)=rgb(i,j,1);
        rawoutput(i,3*(j-1)+2)=rgb(i,j,2);
        rawoutput(i,3*(j-1)+3)=rgb(i,j,3);
    end
end
writeraw(rawoutput,"Rose_Separable_Error_Diffusion.raw");

%% MBVQ-based Error diffusion
RGB=zeros(xrange,yrange,zrange);
R = ori(:,:,1);
G = ori(:,:,2);
B = ori(:,:,3);
RGB = error_d3(R,G,B,1);
for i = 1:1:xrange
    for j = 1:1:yrange
        rawoutput(i,3*(j-1)+1)=RGB(i,j,1);
        rawoutput(i,3*(j-1)+2)=RGB(i,j,2);
        rawoutput(i,3*(j-1)+3)=RGB(i,j,3);
    end
end
writeraw(rawoutput,"Rose_MBVQ_based_Error_diffusion.raw");


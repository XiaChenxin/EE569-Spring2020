%
%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
%

%retriev image
clc
clear
close all

ori = readraw("Dog.raw");
mid = zeros(532,600);
for i = 1 : 1 : 532
    for j = 1 : 1 : 600
        mid(i,j) = ori(i,j);
    end
end


% classify color layers 
[R,G,B] = raw2rgb(mid);


%image color filtering
fG = [0 1/4 0; 1/4 1 1/4;0 1/4 0];% filter for green
fB = [1/4 1/2 1/4;1/2 1 1/2; 1/4 1/2 1/4];% filter for blue
fR = [1/4 1/2 1/4;1/2 1 1/2; 1/4 1/2 1/4];% filter for red

output = zeros(532,600,3);
output(:,:,1) = convolution2D(R,fR);
output(:,:,2) = convolution2D(G,fG);
output(:,:,3) = convolution2D(B,fB);


%result output 
rawoutput = zeros(532,1800);
for i = 1:1:532
    for j = 1:1:600
        rawoutput(i,3*(j-1)+1)=output(i,j,1);
        rawoutput(i,3*(j-1)+2)=output(i,j,2);
        rawoutput(i,3*(j-1)+3)=output(i,j,3);
    end
end
writeraw(rawoutput,"Dog_out.raw");



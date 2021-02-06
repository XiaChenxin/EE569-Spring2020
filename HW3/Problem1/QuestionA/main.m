%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
clc
clear
close all
%% Hedwig
ori_image = readraw24("hedwig.raw");

output = zeros(512,512,3);
output(:,:,1)=disklize(ori_image(:,:,1));
output(:,:,2)=disklize(ori_image(:,:,2));
output(:,:,3)=disklize(ori_image(:,:,3));
rawoutput = zeros(512,512*3);
for i = 1:1:512
    for j = 1:1:512
        rawoutput(i,3*(j-1)+1)=output(i,j,1);
        rawoutput(i,3*(j-1)+2)=output(i,j,2);
        rawoutput(i,3*(j-1)+3)=output(i,j,3);
    end
end
writeraw(rawoutput,"hedwig_disk.raw");

reverse = zeros(512,512,3);
reverse(:,:,1) = reverse_disklize(output(:,:,1));
reverse(:,:,2) = reverse_disklize(output(:,:,2));
reverse(:,:,3) = reverse_disklize(output(:,:,3));

rawoutput = zeros(512,512*3);
for i = 1:1:512
    for j = 1:1:512
        rawoutput(i,3*(j-1)+1)=reverse(i,j,1);
        rawoutput(i,3*(j-1)+2)=reverse(i,j,2);
        rawoutput(i,3*(j-1)+3)=reverse(i,j,3);
    end
end
writeraw(rawoutput,"hedwig_reverse.raw");

%% bb8
ori_image = readraw24("bb8.raw");

output = zeros(512,512,3);
output(:,:,1)=disklize(ori_image(:,:,1));
output(:,:,2)=disklize(ori_image(:,:,2));
output(:,:,3)=disklize(ori_image(:,:,3));
rawoutput = zeros(512,512*3);
for i = 1:1:512
    for j = 1:1:512
        rawoutput(i,3*(j-1)+1)=output(i,j,1);
        rawoutput(i,3*(j-1)+2)=output(i,j,2);
        rawoutput(i,3*(j-1)+3)=output(i,j,3);
    end
end
writeraw(rawoutput,"bb8_disk.raw");

reverse = zeros(512,512,3);
reverse(:,:,1) = reverse_disklize(output(:,:,1));
reverse(:,:,2) = reverse_disklize(output(:,:,2));
reverse(:,:,3) = reverse_disklize(output(:,:,3));

rawoutput = zeros(512,512*3);
for i = 1:1:512
    for j = 1:1:512
        rawoutput(i,3*(j-1)+1)=reverse(i,j,1);
        rawoutput(i,3*(j-1)+2)=reverse(i,j,2);
        rawoutput(i,3*(j-1)+3)=reverse(i,j,3);
    end
end
writeraw(rawoutput,"bb8_reverse.raw");

%% raccoon
ori_image = readraw24("raccoon.raw");

output = zeros(512,512,3);
output(:,:,1)=disklize(ori_image(:,:,1));
output(:,:,2)=disklize(ori_image(:,:,2));
output(:,:,3)=disklize(ori_image(:,:,3));
rawoutput = zeros(512,512*3);
for i = 1:1:512
    for j = 1:1:512
        rawoutput(i,3*(j-1)+1)=output(i,j,1);
        rawoutput(i,3*(j-1)+2)=output(i,j,2);
        rawoutput(i,3*(j-1)+3)=output(i,j,3);
    end
end
writeraw(rawoutput,"raccoon_disk.raw");

reverse = zeros(512,512,3);
reverse(:,:,1) = reverse_disklize(output(:,:,1));
reverse(:,:,2) = reverse_disklize(output(:,:,2));
reverse(:,:,3) = reverse_disklize(output(:,:,3));

rawoutput = zeros(512,512*3);
for i = 1:1:512
    for j = 1:1:512
        rawoutput(i,3*(j-1)+1)=reverse(i,j,1);
        rawoutput(i,3*(j-1)+2)=reverse(i,j,2);
        rawoutput(i,3*(j-1)+3)=reverse(i,j,3);
    end
end
writeraw(rawoutput,"raccoon_reverse.raw");
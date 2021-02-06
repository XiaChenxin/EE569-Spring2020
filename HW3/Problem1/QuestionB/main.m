%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
clc
close all
clear

left=readraw24("left.raw");
middle=readraw24("middle.raw");
right=readraw24("right.raw");

%% initialize
left_gray = change2gray(left);
middle_gray = change2gray(middle);
right_gray = change2gray(right);

points_left = detectSURFFeatures(left_gray/255);
kl = points_left.selectStrongest(20);
kl = kl.Location;

points_middle = detectSURFFeatures(middle_gray/255);
km = points_middle.selectStrongest(20);
km = km.Location;

%% left 2 middle
y1 =[ kl(9,1), kl(3,1), kl(5,1), kl(15,1)]; 
x1 =[ kl(9,2), kl(3,2), kl(5,2), kl(15,2)]; 
y1 = y1+960;
x1 = x1+720;

y2 =[ km(18,1), km(2,1), km(4,1), km(17,1)];
x2 =[ km(18,2), km(2,2), km(4,2), km(17,2)];
y2 = y2+960;
x2 = x2+720; 
mid = zeros(720*3,480*5,3);
for i = 1:720
    for j = 1:480
        for layer = 1:3
            mid(i+720,j+480*2,layer) = middle(i,j,layer);
        end
     end
end


result = attatch(left,y1,x1,mid,y2,x2);


points_right = detectSURFFeatures(right_gray/255);
kr = points_right.selectStrongest(20);
kr = kr.Location;


y1 =[ kr(2,1),kr(16,1), kr(11,1), kr(5,1)]; 
x1 =[ kr(2,2),kr(16,2), kr(11,2), kr(5,2)]; 
y1 = y1+960;
x1 = x1+720;

y2 =[ km(1,1), km(17,1), km(19,1), km(16,1)];
x2 =[ km(1,2), km(17,2), km(19,2), km(16,2)];
y2 = y2+960;
x2 = x2+720; 
result = attatch(right,y1,x1,result,y2,x2);

output = result(361:720*3-360,481:480*5-480,:);
[x,y,z]=size(output);
rawoutput = zeros(x,y*3);
for i = 1:1:x
    for j = 1:1:y
        rawoutput(i,3*(j-1)+1)=output(i,j,1);
        rawoutput(i,3*(j-1)+2)=output(i,j,2);
        rawoutput(i,3*(j-1)+3)=output(i,j,3);
    end
end
writeraw(rawoutput,"panorama.raw");




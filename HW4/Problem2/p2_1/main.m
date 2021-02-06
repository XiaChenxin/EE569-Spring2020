%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 22, 2020
clc
clear
close all
%% set up
run('vlfeat/toolbox/vl_setup')

H1= imread('Husky_1.jpg');
H2= imread('Husky_2.jpg');
H3= imread('Husky_3.jpg');
P1= imread('Puppy_1.jpg');
[hight,wideth,~] = size(H1);
IH1 = single(rgb2gray(H1));
IH2 = single(rgb2gray(H2));
IH3 = single(rgb2gray(H3));
IP1 = single(rgb2gray(P1));
%% compute SIFT frames
N = 7;
N1 = 9;
%8 9
[fH1,dH1] = vl_sift(IH1,'Levels',N,'PeakThresh', N1);
[fH3,dH3] = vl_sift(IH3,'Levels',N,'PeakThresh', N1);

%% 2(b)_1

length3 = size(fH3,2);
scale3 = 0;
location3 = 0;
for i = 1: length3
    if fH3(3,i) > scale3
        scale3 = fH3(3,i);
        location3 = i;
    end
end
length1 = size(fH1,2);
[matches, scores] = vl_ubcmatch(dH3(:,location3), dH1,1);

result=[H3,H1];
image(result)
h1 = vl_plotframe(fH3(:,location3));
set(h1,'color','y','linewidth',3);

d = matches(2);
location = fH1(:,d);
location(1) = location(1)+640;
h2 = vl_plotframe(location);
set(h2,'color','y','linewidth',3);

hold on
h = line([fH3(1,location3),location(1)],[fH3(2,location3),location(2)]);
set(h,'color','r','linewidth',2);
hold off



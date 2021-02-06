%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 22, 2020
clc
clear
close all
amount = 40;
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
N = 6;
N1 = 5;
%8 9
[fH1,dH1] = vl_sift(IH1,'Levels',N,'PeakThresh', N1);
[fH2,dH2] = vl_sift(IH2,'Levels',N,'PeakThresh', N1);
[fH3,dH3] = vl_sift(IH3,'Levels',N,'PeakThresh', N1);
[fP1,dP1] = vl_sift(IP1,'Levels',N,'PeakThresh', N1);

%% 2(b)_2

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Husky_1  & Husky_3   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
result=[H3,H1];
figure()
image(result)
[matches, scores] = vl_ubcmatch(dH3, dH1,0.5);
t = [matches;scores];
t = sortrows(t',-3)';
hold on
for i = 1 :amount
    h1 = t(1,i);
    h2 = t(2,i);
    h = line([fH3(1,h1),fH1(1,h2)+640],[fH3(2,h1),fH1(2,h2)]);
    set(h,'color','r','linewidth',2);

    h = vl_plotframe(fH3(:,h1));
    set(h,'color','y','linewidth',3);
    
    location = fH1(:,h2);
    location(1) = location(1)+640;
    h = vl_plotframe(location);
    set(h,'color','y','linewidth',3);
end
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Husky_3  & Husky_2   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
result=[H3,H2];
figure()
image(result)
[matches, scores] = vl_ubcmatch(dH3, dH2,0.5);
t = [matches;scores];
t = sortrows(t',-3)';
hold on
for i = 1 :amount
    h1 = t(1,i);
    h2 = t(2,i);
    h = line([fH3(1,h1),fH2(1,h2)+640],[fH3(2,h1),fH2(2,h2)]);
    set(h,'color','r','linewidth',2);

    h = vl_plotframe(fH3(:,h1));
    set(h,'color','y','linewidth',3);
    
    location = fH2(:,h2);
    location(1) = location(1)+640;
    h = vl_plotframe(location);
    set(h,'color','y','linewidth',3);
end
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Husky_3  & Puppy_1   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
result=[H3,P1];
figure()
image(result)
[matches, scores] = vl_ubcmatch(dH3, dP1,0.5);
t = [matches;scores];
t = sortrows(t',-3)';
hold on
for i = 1 :amount
    h1 = t(1,i);
    h2 = t(2,i);
    h = line([fH3(1,h1),fP1(1,h2)+640],[fH3(2,h1),fP1(2,h2)]);
    set(h,'color','r','linewidth',2);

    h = vl_plotframe(fH3(:,h1));
    set(h,'color','y','linewidth',3);
    
    location = fP1(:,h2);
    location(1) = location(1)+640;
    h = vl_plotframe(location);
    set(h,'color','y','linewidth',3);
end
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Husky_1  & Puppy_1   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
result=[H1,P1];
figure()
image(result)
[matches, scores] = vl_ubcmatch(dH1, dP1,0.5);
t = [matches;scores];
t = sortrows(t',-3)';
hold on
for i = 1 :amount
    h1 = t(1,i);
    h2 = t(2,i);
    h = line([fH1(1,h1),fP1(1,h2)+640],[fH1(2,h1),fP1(2,h2)]);
    set(h,'color','r','linewidth',2);

    h = vl_plotframe(fH1(:,h1));
    set(h,'color','y','linewidth',3);
    
    location = fP1(:,h2);
    location(1) = location(1)+640;
    h = vl_plotframe(location);
    set(h,'color','y','linewidth',3);
end
hold off
    



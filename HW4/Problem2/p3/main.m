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
[fH1,dH1] = vl_sift(IH1);
[fH2,dH2] = vl_sift(IH2);
[fH3,dH3] = vl_sift(IH3);
[fP1,dP1] = vl_sift(IP1);
dH1 = single(dH1);
dH2 = single(dH2);
dH3 = single(dH3);
dP1 = single(dP1);
center = zeros(4,8,128);
[center(1,:,:),result] = kmean(dH1',8);
[center(2,:,:),result] = kmean(dH2',8);
[center(4,:,:),result] = kmean(dH3',8);
[center(3,:,:),result] = kmean(dP1',8);
match = zeros(4,8);

for class = 1:4
    for number = 1:8
        maximum = 32767000000;
        temp = center(class,number,:);
        location = 0;
        for class3 = 1:8
            g = center(4,class3,:)-temp;
            g = sum(sum(sum( g .* g)));
            if g < maximum
                maximum = g;
                location = class3;
            end
        end
        match(class,number) = location;
    end
end

for class = 1:4

    x = zeros(8,1);
    for number = 1:8
        x(match(class,number))= x(match(class,number)) +1;
    end

    figure()
    bar(x);
    xlabel('# Code Book of Husky 3')
    ylabel('frequency')
end


[~,hight] = size(dH1);
array = zeros(8,1);
for i = 1:hight
    temp = dH1(:,i)';
    maximum = 32767000000;
    location = 0;
    for class3 = 1:8
        label = zeros(1,128);
        for j = 1:128
            label(j) = center(4,class3,j);
        end
        g = label - temp;        
        g = sum(sum(sum( g .* g)));
        if g < maximum
            maximum = g;
            location = class3;
        end
    end
    array(location) = array(location)+1;
end
figure()
bar(array)
xlabel('# Code Book of Husky 3')
ylabel('frequency')

[~,hight] = size(dH2);
array = zeros(8,1);
for i = 1:hight
    temp = dH2(:,i)';
    maximum = 32767000000;
    location = 0;
    for class3 = 1:8
        label = zeros(1,128);
        for j = 1:128
            label(j) = center(4,class3,j);
        end
        g = label - temp;        
        g = sum(sum(sum( g .* g)));
        if g < maximum
            maximum = g;
            location = class3;
        end
    end
    array(location) = array(location)+1;
end
figure()
bar(array)
xlabel('# Code Book of Husky 3')
ylabel('frequency')

[~,hight] = size(dH3);
array = zeros(8,1);
for i = 1:hight
    temp = dH3(:,i)';
    maximum = 32767000000;
    location = 0;
    for class3 = 1:8
        label = zeros(1,128);
        for j = 1:128
            label(j) = center(4,class3,j);
        end
        g = label - temp;        
        g = sum(sum(sum( g .* g)));
        if g < maximum
            maximum = g;
            location = class3;
        end
    end
    array(location) = array(location)+1;
end
figure()
bar(array)
xlabel('# Code Book of Husky 3')
ylabel('frequency')

[~,hight] = size(dP1);
array = zeros(8,1);
for i = 1:hight
    temp = dP1(:,i)';
    maximum = 32767000000;
    location = 0;
    for class3 = 1:8
        label = zeros(1,128);
        for j = 1:128
            label(j) = center(4,class3,j);
        end
        g = label - temp;        
        g = sum(sum(sum( g .* g)));
        if g < maximum
            maximum = g;
            location = class3;
        end
    end
    array(location) = array(location)+1;
end
figure()
bar(array)
xlabel('# Code Book of Husky 3')
ylabel('frequency')
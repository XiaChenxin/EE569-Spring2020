%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 16, 2020
clc
clear
close all
%% read 36 sample images
sample = zeros(128,128,36);
mark = 0;
for i = 1 : 1 : 9
    mark = mark + 1;
    l = "train/blanket";
    lc = int2str(i);
    location = l+lc+".raw";
    d = readraw(location);
    d = d - sum(sum(d))/(128*128);
    sample(:,:,mark) = d;
end
for i = 1 : 1 : 9
    mark = mark + 1;
    l = "train/brick";
    lc = int2str(i);
    location = l+lc+".raw";
    d = readraw(location);
    d = d - sum(sum(d))/(128*128);
    sample(:,:,mark) = d;
end
for i = 1 : 1 : 9
    mark = mark + 1;
    l = "train/grass";
    lc = int2str(i);
    location = l+lc+".raw";
    d = readraw(location);
    d = d - sum(sum(d))/(128*128);
    sample(:,:,mark) = d;
end
for i = 1 : 1 : 9
    mark = mark + 1;
    l = "train/rice";
    lc = int2str(i);
    location = l+lc+".raw";
    d = readraw(location);
    d = d - sum(sum(d))/(128*128);
    sample(:,:,mark) = d;
end
%% read 12 test images
test = zeros(128,128,12);
mark = 0;
for i = 1 : 1 : 12
    mark = mark + 1;
    l = "test/";
    lc = int2str(i);
    location = l+lc+".raw";
    d = readraw(location);
    d = d - sum(sum(d))/(128*128);
    test(:,:,mark) = d;
end
%% feature set 
feature_sample = zeros(36,15);
for i = 1:36
    feature_sample(i,:) = feature15(sample(:,:,i));
    d = feature_sample(i,1);
    for j = 1:15
        feature_sample(i,j) = feature_sample(i,j)/d;
    end
end

feature_test = zeros(12,15);
for i = 1:12
    feature_test(i,:) = feature15(test(:,:,i));
    d = feature_test(i,1);
    for j = 1:15
        feature_test(i,j) = feature_test(i,j)/d;
    end
end

%% Feature reduction
%{
[~, r, ~] = pca(feature_sample(:,2:15));
feature3_sample = r(:, 1 : 3);
%}
feature3_sample =pca_hand(feature_sample,3);

x = feature3_sample(:,1)';
y = feature3_sample(:,2)';
z = feature3_sample(:,3)';
figure()
scatter3(x(1:9),y(1:9),z(1:9),'k','d')
hold on
scatter3(x(10:18),y(10:18),z(10:18),'b','o')
hold on
scatter3(x(19:27),y(19:27),z(19:27),'r','o')
hold on
scatter3(x(28:36),y(28:36),z(28:36),'g','o')

%{
[~, r, ~] = pca(feature_test(:,2:15));
feature3_test = r(:, 1 : 3);
%}
feature3_test =pca_hand(feature_test,3);
figure()
x = feature3_test(:,1)';
y = feature3_test(:,2)';
z = feature3_test(:,3)';
scatter3(x,y,z,'r','o')
%% Dimension justification

just = zeros(1,14);
for i = 2:15
    overall_average = sum(feature_sample(:,i))/36;
    intra = 0;
    inter = 0;
    for j = 1:4
        average = sum(feature_sample((j-1)*9+1:9*j,i))/9;
        d = feature_sample((j-1)*9+1:9*j,i);
        d = d-average;
        intra = intra+sum(d .* d);
        
        inter = inter+9*(average-overall_average)^2;
    end
    just(i-1) = inter/intra;
end
feature_sample
feature_test
feature3_sample
feature3_test
just
        
        
        
        
        
        
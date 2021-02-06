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
        feature_sample(i,j) = feature_sample(i,j)/1;
    end
end

feature_test = zeros(12,15);
for i = 1:12
    feature_test(i,:) = feature15(test(:,:,i));
    d = feature_test(i,1);
    for j = 1:15
        feature_test(i,j) = feature_test(i,j)/1;
    end
end
%% PCA Feature reduction
%{
[~, r, ~] = pca(feature_sample(:,2:15));
feature3_sample = r(:, 1 : 3);

[~, r, ~] = pca(feature_test(:,2:15));
feature3_test = r(:, 1 : 3);
%}
all = [feature_sample(:,2:15);feature_test(:,2:15)];
%{
[~, r, ~] = pca(all);
feature3_sample = r(1:36, 1 : 3);
feature3_test = r(37:48, 1 : 3);
%}
feature3_sample = pca_hand(feature_sample(:,2:15),3)

%% kmean
[ldx15,C] = kmeans(feature_test,4);
Kmeans_result15 = ldx15'
[ldx3,C] = kmeans(feature3_test,4);
Kmeans_result3  = ldx3'
%% RF

label = zeros(36,1);
label(10:18) = label(10:18)+1;
label(19:27) = label(19:27)+2;
label(28:36) = label(28:36)+3;
trees15 = TreeBagger(100,feature_sample(:,2:15),label,'method','classification');
PCA_result15 = predict(trees15,feature_test(:,2:15))
trees3 = TreeBagger(100,feature3_sample,label,'method','classification');
PCA_result3 = predict(trees3,feature3_test)
%% SVM
%%%%%%%%%%%%%%%
%     15D     %
%%%%%%%%%%%%%%%
svm_set = {};
for i = 1:4
    label = zeros(36,1);
    label((i-1)*9+1:i*9) =label((i-1)*9+1:i*9) +1;
    svm = fitcsvm(feature_sample(:,2:15),label,'Standardize',true,'KernelFunction','rbf',...
                'BoxConstraint',1);
    svm_set{i} = svm;
end

score_set = zeros(12,4);

for i = 1:4
    [~,score] = predict(svm_set{i},feature_test(:,2:15));
    score_set(:,i) = score(:,2);
end

[~,result] = max(score_set,[],2);
SVM_result15 = result-1


%%%%%%%%%%%%%%%
%     3D      %
%%%%%%%%%%%%%%%
svm_set = {};
for i = 1:4
    label = zeros(36,1);
    label((i-1)*9+1:i*9) =label((i-1)*9+1:i*9) +1;
    svm = fitcsvm(feature3_sample,label,'Standardize',true,'KernelFunction','rbf',...
                'BoxConstraint',1);
    svm_set{i} = svm;
end

score_set = zeros(12,4);

for i = 1:4
    [~,score] = predict(svm_set{i},feature3_test);
    score_set(:,i) = score(:,2);
end

[~,result] = max(score_set,[],2);
SVM_result3 = result-1
%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 16, 2020
clc
clear
close all

N =39;
%% read comp
ori_image = readraw('comp.raw');
[hight,wideth] = size(ori_image);

%% feature set 
window = ones(N,N)/(N*N);
feature_image = zeros(hight,wideth,15);
feature_image = feature_extra(ori_image);

    
key = 0;
for i = 1:15
    key = key+1
    feature_image(:,:,i) = convolution2D(feature_image(:,:,i),window);
end
for dimension = 2:15
    for x = 1 : hight
        for y = 1:wideth
            feature_image(x,y,dimension) = feature_image(x,y,dimension)/...
                feature_image(x,y,1);
        end
    end
end
    for x = 1 : hight
        for y = 1:wideth
            feature_image(x,y,1) = 1;
        end
    end

mid = zeros(hight*wideth,14);
key = 0;
for x = 1 : hight
    for y = 1:wideth
        key = key+1;
        mid(key,:) = feature_image(x,y,2:15);
    end
end

ldx15 = kmean(mid,6); 
result = zeros(hight,wideth);
key = 0;
for x = 1 : hight
    for y = 1:wideth
        key = key+1;
        result(x,y) = (ldx15(key)-1)*51;
    end
end

writeraw(result,'output.raw')

%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%March 16, 2020
clc
clear
close all
N1 = 3;
N = 37;
%% read comp
ori_image = readraw('comp.raw');
[hight,wideth] = size(ori_image);
window = ones(N1,N1)/(N1*N1);

%% feature set 
window = ones(N,N)/(N*N);
feature_image = zeros(hight,wideth,15);
feature_image = feature_extra(ori_image);
for dimension = 1:15
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
    

for i = 1:15
    feature_image(:,:,i) = convolution2D(feature_image(:,:,i),window);
end

mid = zeros(hight*wideth,14);
key = 0;
for x = 1 : hight
    for y = 1:wideth
        key = key+1;
        mid(key,:) = feature_image(x,y,2:15);
    end
end

%[~, r, ~] = pca(mid);
%mid = r(:, 1 : N1);

mid = pca_hand(mid,N1);
ldx15 = kmean(mid,6); 
result = zeros(hight,wideth);
key = 0;
for x = 1 : hight
    for y = 1:wideth
        key = key+1;
        result(x,y) = (ldx15(key)-1)*51;
    end
end

global mark
mark = ones(450,600);
global image 
image = result;
global recovery
recovery = [];
output = result;
for u = 1:5
    for i = 0 : 5
        color = i*51;
        image = zeros(450,600);
        for x = 1:450
            for y = 1:600
                if output(x,y) == color
                    image(x,y) = 1;
                end
            end
        end

        for x = 1:450
            for y = 1:600
                if image(x,y) == 1
                    recovery = [];
                    count = mark2(x,y);
                    if count > 10000
                        for j = 1:count
                            output(recovery(j,1),recovery(j,2)) = color;
                        end
                    else
                        cl = color +51;
                        if cl >255
                            cl = 0;
                        end
                        for j = 1:count
                            output(recovery(j,1),recovery(j,2)) = cl;
                        end
                    end

                end

            end
        end
    end
end

writeraw(output,'output.raw')


    
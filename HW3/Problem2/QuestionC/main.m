%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
clc
clear
close all

ori_image = round(readraw("PCB.raw",239,372));
[height,wideth]=size(ori_image);
for i = 1:height
    for j = 1:wideth
        if ori_image(i,j)<50
            ori_image(i,j) = 0;
        else
            ori_image(i,j) = 1;
        end
    end
end

%% un bounded
for i = 1 : height
    for j = 1 : wideth
        if i<=2 || i>=238 || j <=2 || j >= 371
            ori_image(i,j) = 1;
        end
    end
end


list = [];
count = 0;
global image 
image = ori_image;
%% clean background
mark(1,1);
mid = image;
%% shrink and calculate pots
flag = 1;
while flag
    k1 = sum(sum(image));
    image = bwmorph(image,'shrink',1);
    k2 = sum(sum(image));
    if k1 == k2
        flag = 0;
    end
end
holes= sum(sum(image))
%% pathways
image = ori_image - mid;
for i = 80:height
    for j = 347 : wideth
        image(i,j) = 1;
    end
end
image = 1-image;
flag = 1;


covery = [];
global recovery

for x=1:height
    for y = 1:wideth
        if image(x,y) == 1
            recovery = [];
            num = mark2(x,y);
            size(recovery);
            if num > 180
                covery = [covery;recovery];
            end
        end
    end
end
[k,j] = size(covery);
for i =1:k
    image(covery(i,1),covery(i,2)) = 1;
end



while flag
    k1 = sum(sum(image));
    image = bwmorph(image,'shrink',1);
    k2 = sum(sum(image));
    if k1 == k2
        flag = 0;
    end
end
pathways = sum(sum(image))


    




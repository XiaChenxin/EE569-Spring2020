
%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
clc
clear
close all

ori_image = round(readraw("GearTooth.raw",250,250)/255);
[height,wideth]=size(ori_image);
global image
global recovery

%% eliminate background
image = 1-ori_image;
mark(1,1); 
%% find center of four circles
flag = 1;
mid = image;  
while flag
    k1 = sum(sum(mid));
    mid = bwmorph(mid,'shrink',1);
    k2 = sum(sum(mid));
    if k1 == k2
        flag = 0;
    end
end

%% center
xlabel = 0;
ylabel = 0;
for i = 1 : height
    for j = 1 : wideth
        if mid(i,j) == 1
            xlabel = xlabel + i;
            ylabel = ylabel + j;
        end
    end
end
xlabel_image = xlabel/4;
ylabel_image = ylabel/4;

[xlabel_cartisian,ylabel_cartisian] =image2cartisian(height,xlabel_image,ylabel_image);
%% rotate
rotate = [0 -1;1 0];
out = zeros(250,250);
for x_image = 1:250
    for y_image = 1:250
        [x_cartisian,y_cartisian] = image2cartisian(height,x_image,y_image);
        x_cartisian = x_cartisian - xlabel_cartisian;
        y_cartisian = y_cartisian - ylabel_cartisian;
        result=rotate*[x_cartisian;y_cartisian];
        x_cartisian_out = result(1);
        y_cartisian_out = result(2);
        x_cartisian_out = x_cartisian_out + xlabel_cartisian;
        y_cartisian_out = y_cartisian_out + ylabel_cartisian;
        [x_image_out,y_image_out] = cartisian2image(height,x_cartisian_out,y_cartisian_out);
        if (x_image_out >= 1) &&(x_image_out<=250)&&(y_image_out >= 1) &&(y_image_out<=250)
            x_low = floor(x_image_out);
            x_high = ceil(x_image_out);
            y_low = floor(y_image_out);
            y_high = ceil(y_image_out);
            p = x_image_out - x_low;
            q = y_image_out - y_low;
            out(x_image,y_image) = p*q*ori_image(x_high,y_high)+(1-p)*q*ori_image(x_low,y_high)+...
                p*(1-q)*ori_image(x_high,y_low)+(1-p)*(1-q)*ori_image(x_low,y_low);
        end
    end
end

%% match

for x = 2:249
    for y = 2:249
       if out(x,y) > 0.8
           out(x,y) = 1;
       else
           out(x,y) = 0;
       end
    end
end
difference = zeros(250,250);
for x = 2:249
    for y = 2:249
       if out(x,y) == 1 && ori_image(x,y) ==0
            difference(x,y) = 1;
       end
    end
end
image = difference;
covery = [];


for x=1:250
    for y = 1:250
        if image(x,y) == 1
            recovery = [];
            num = mark2(x,y);
            size(recovery);
            if num > 90
                covery = [covery;recovery];
            end
        end
    end
end
[xl,yl] = size(covery);
for i = 1:xl
    image(covery(i,1),covery(i,2))=1;
end

writeraw(image*255,"teeth.raw");
writeraw(round((image+0.4*ori_image)*255),"teeth_with_original_image.raw");


    




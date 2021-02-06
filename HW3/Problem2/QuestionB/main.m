%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
clc
clear
close all

list = [];
ori_image = round(readraw("stars.raw",480,640)/255);
[height,wideth]=size(ori_image);
mid = zeros(height+2,wideth+2);
label = zeros(height+2,wideth+2);
%% build in method
for i = 1:height
    for j = 1:wideth
        mid(i+1,j+1) = ori_image(i,j);
    end
end
flag = 1;
while flag
    count = 0;
    
    for i = 2:1:height+1
        for j = 2:1 : wideth+1
            if mid(i,j) == 1
                sum1 = mid(i-1,j-1)+mid(i-1,j)+mid(i-1,j+1)+mid(i,j-1)+...
                    mid(i,j+1)+mid(i+1,j-1)+mid(i+1,j)+mid(i+1,j+1);
                if sum1 == 0
                    count = count+1;
                    mid(i,j) = 0;
                end
            end
        end
    end
   
    k1 = sum(sum(mid));
    mid = bwmorph(mid,'shrink',1);
    k2 = sum(sum(mid));
        k = [flag,count];
        list = [list;k];
        flag = flag+1;
    
    if k1 == k2
        flag = 0;
    end
end
total_star_numbers = sum(list(:,2))

figure()
bar(list(:,2))
title("bulid in function")
xlabel("Size")
ylabel("frequency")
gist = zeros(1,100);
%% DFS method
list = [];
count = 0;
global image 
global recovery
markk = zeros(height,wideth);
image = ori_image;
for i = 1 : height
    for j = 1: wideth
        if image(i,j) == 1
            recovery = [];
            mark(i,j);
            count = count+1;
            [xl,yl]= size(recovery);
            max = 0;
            for i = 1:xl
                for j = 1:xl
                    temp = sqrt((recovery(i,1)-recovery(j,1))^2+(recovery(i,2)-recovery(j,2))^2);
                    if temp > max
                        max = temp;
                    end
                end
            end
            gist(ceil(max))=gist(ceil(max))+1;
        end
    end
end
location =0;
for i = 1:100
    if gist(i)>0
        location = i;
    end
end
gist = gist(1:location);

figure()
bar(gist)
title("DFS method")
xlabel("Size")
ylabel("frequency")
%% Table method

ori_image = readraw("stars.raw",480,640);

S = ['001010000';'100010000';'000010100';'000010001';...
     '000011000';'010010000';'000110000';'000010010';...
     '001011000';'011010000';'110010000';'100110000';'000110100';'000010110';'000010011';'000011001';...
     '001011001';'111010000';'100110100';'000010111';...
     '110011000';'010011001';'011110000';'001011010';...
     '011011000';'110110000';'000110110';'000011011';...
     '110011001';'011110100';...
     '111011000';'011011001';'111110000';'110110100';'100110110';'000110111';'000011111';'001011011';...
     '111011001';'111110100';'100110111';'001011111';...
     '011011011';'111111000';'110110110';'000111111';...
     '111011011';'011011111';'111111100';'111111001';'111110110';'110110111';'100111111';'001111111';...
     '111011111';'111111101';'111110111';'101111111'];
Mark = ['001010000';'100010000';...
     '000010010';'000011000';...
     '001011000';'011010000';'110010000';'100110000';...
     '000110100';'000010110';'000010011';'000011001';...
     '011110000';'110011000';'010011001';'001011010'];

mid = zeros(480+2,640+2);
for i =  1 :480
    for j = 1:640
        if ori_image(i,j) >40
            mid(i+1,j+1) = 1;
        else
            mid(i+1,j+1) = 0;
        end
    end
end

    flag = 1;
    list = [];
    
 while flag
     
     count = 0;
     for i = 2:1:height+1
        for j = 2:1 : wideth+1
            if mid(i,j) == 1
                sum1 = mid(i-1,j-1)+mid(i-1,j)+mid(i-1,j+1)+mid(i,j-1)+...
                    mid(i,j+1)+mid(i+1,j-1)+mid(i+1,j)+mid(i+1,j+1);
                if sum1 == 0
                    count = count+1;
                    mid(i,j) = 0;
                end
            end
        end
     end
   
    M = zeros(height+2,wideth+2);
        
    for x = 2:height+1
            for y = 2:wideth+1
                if mid(x,y) == 1
                    symble =[int2str(mid(x-1,y-1)),int2str(mid(x-1,y)),int2str(mid(x-1,y+1)),...
                             int2str(mid(x,y-1)),int2str(mid(x,y)),int2str(mid(x,y+1)),...
                             int2str(mid(x+1,y-1)),int2str(mid(x+1,y)),int2str(mid(x+1,y+1))];
                    for i = 1:58
                        if sum(symble == S(i,1:9)) == 9
                            M(x,y)=1; 
                        end
                    end
                end
            end
     end
       
    
        k = sum(sum(mid));
        for x = 2:height+1
            for y = 2:wideth+1
                if M(x,y) == 1
                    symble = [int2str(M(x-1,y-1)),int2str(M(x-1,y)),int2str(M(x-1,y+1)),...
                         int2str(M(x,y-1)),int2str(M(x,y)),int2str(M(x,y+1)),...
                         int2str(M(x+1,y-1)),int2str(M(x+1,y)),int2str(M(x+1,y+1))];
                    label = 0;
                    for i = 1:16
                        if sum(symble == Mark(i,1:9))==9
                            label = 1;
                        end
                    end
                    label = label+spur(symble)+corner(symble)+Tee(symble)+vee(symble)+diagonal(symble);
                    if label == 0
                        mid(x,y) = 0;
                    end
                end
            end
        end
        k2 = sum(sum(mid));
    
        k3 = [flag,count];
        list = [list;k3];
        flag = flag+1;
    
        if k == k2
            flag = 0;
        end;
        
      
    
    end

figure()
bar(list(:,2))
title("function from 2(a)")

     xlabel("Size")
ylabel("frequency")




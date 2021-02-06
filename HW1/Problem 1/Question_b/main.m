%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020

%retriev image
clc
clear
close all

ori = readraw("Dog.raw");
mid = zeros(532,600);
for i = 1 : 1 : 532
    for j = 1 : 1 : 600
        mid(i,j) = ori(i,j);
    end
end

% classify color layers 
[R,G,B] = raw2rgb(mid);


%image color filtering for bilinear
fG = [0 1/4 0; 1/4 1 1/4;0 1/4 0];% filter for green
fB = [1/4 1/2 1/4;1/2 1 1/2; 1/4 1/2 1/4];% filter for blue
fR = [1/4 1/2 1/4;1/2 1 1/2; 1/4 1/2 1/4];% filter for redoutpuy

%Filters for MHC
fRB2G = [0 0 -1/4 0 0;0 0 0 0 0;-1/4 0 1 0 -1/4;0 0 0 0 0;0 0 -1/4 0 0];
fR2B=[0 0 -3/16 0 0;0 0 0 0 0;-3/16 0 3/4 0 -3/16;0 0 0 0 0;0 0 -3/16 0 0];

%%%%%%%%% R2B or B2R %%%%%%%%%%%
R2B=convolution2D(R,fR2B);
B2R=convolution2D(B,fR2B);


%%%%%%%%% R2G or B2G %%%%%%%%%%%
R2G=convolution2D(R,fRB2G);
B2G=convolution2D(B,fRB2G);
for i = 1 : 1 : 532
	for j = 1 : 1 : 600
        R2G(i,j) = R2G(i,j)/2;
        B2G(i,j) = B2G(i,j)/2;    
	end
end

%%%%%%%%%% G2B and G2R %%%%%%%%%%%%%
mid = zeros(536,604);

%mirror padding
[x1,y1] = size(ori);
xk = 2;
yk = 2;
G2B= zeros(532,600);
G2R = zeros(532,600);

for i = 1 : 1 : x1
    for j = 1 : 1 : y1
        mid(i + 2 ,j + 2) = ori(i,j);
    end
end
for i = 1 : 1 : x1
    mid(i+2,1)=ori(i,3);
    mid(i+2,2)=ori(i,2);
    mid(i+2,y1+4) = ori(i,y1-2);
    mid(i+2,y1+3) = ori(i,y1-1);
end
    
for i = 1 : 1 : y1
    mid(1,i+2)=ori(3,i);
    mid(2,2+i)=ori(2,i);
    mid(x1+4,i+2) = ori(x1-2,i);
    mid(x1+3,i+2) = ori(x1-1,i);
end
    
    
mid(1,1)=ori(3,3);mid(2,2)=ori(2,2);
mid(2,1)=ori(2,3);mid(1,2)=ori(3,2); 
    
mid(x1+4,1)=mid(x1,1);mid(x1+3,1)=mid(x1+1,1);
mid(x1+3,2)=mid(x1+1,2);mid(x1+4,2)=mid(x1,2);
  
mid(1,y1+4)=mid(1,y1);mid(2,y1+3)=mid(2,y1+1);
mid(2,y1+4)=mid(2,y1);mid(1,y1+3)=mid(1,y1+1);
    
mid(x1+4,y1+4)=mid(x1,y1);mid(x1+3,y1+3)=mid(x1+1,y1+1);
mid(x1+3,y1+4)=mid(x1+1,y1);mid(x1+4,y1+3)=mid(x1,y1+1);
    
for i = 3 : 1 : 534
	for j = 3 : 1 : 602
        x1 = mod(i,2);
        y1 = mod(j,2);
        x = i - 2;
        y = j - 2;
        if x1 == y1
            if x1 == 0
                G2B(x,y) = (5*mid(i,j)-(mid(i+1,j+1)+mid(i-1,j-1)...
                    +mid(i-1,j+1)+mid(i+1,j-1)+mid(i,j-2)+mid(i,j+2))...
                    +(mid(i-2,j)+mid(i+2,j))/2)/8;
                
                G2R(x,y) = (5*mid(i,j)-(mid(i+1,j+1)+mid(i-1,j-1)...
                    +mid(i-1,j+1)+mid(i+1,j-1)+mid(i-2,j)+mid(i+2,j))...
                    +(mid(i,j-2)+mid(i,j+2))/2)/8;
            else
                
                G2R(x,y) = (5*mid(i,j)-(mid(i+1,j+1)+mid(i-1,j-1)...
                    +mid(i-1,j+1)+mid(i+1,j-1)+mid(i,j-2)+mid(i,j+2))...
                    +(mid(i-2,j)+mid(i+2,j))/2)/8;
                
                G2B(x,y) = (5*mid(i,j)-(mid(i+1,j+1)+mid(i-1,j-1)...
                    +mid(i-1,j+1)+mid(i+1,j-1)+mid(i-2,j)+mid(i+2,j))...
                    +(mid(i,j-2)+mid(i,j+2))/2)/8;
            end
        end
	end
end

%%%% result
RR = convolution1(R,fR);
GG = convolution1(G,fG);
BB = convolution1(B,fB);
output = zeros(532,600,3);

for i = 1 : 1 : 532
    for j = 1 : 1 : 600
        output(i,j,1)= RR(i,j) + B2R(i,j) + G2R(i,j);
        output(i,j,2)= GG(i,j) + B2G(i,j) + R2G(i,j);
        output(i,j,3)= BB(i,j) + R2B(i,j) + G2B(i,j);
    end
end

%Raw output
rawoutput = zeros(532,1800);
for i = 1:1:532
    for j = 1:1:600
        rawoutput(i,3*(j-1)+1)=output(i,j,1);
        rawoutput(i,3*(j-1)+2)=output(i,j,2);
        rawoutput(i,3*(j-1)+3)=output(i,j,3);
    end
end

writeraw(rawoutput,"Dog_out.raw");
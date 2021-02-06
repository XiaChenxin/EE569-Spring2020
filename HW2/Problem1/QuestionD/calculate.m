clc
clear
close all
load("Kcntp.mat");
load("KcntR.mat");
load("KsumR.mat");
load("KsumP.mat");

F = zeros(120,9);
R = kcntR./ksumR;
P = kcntP./ksumP;
%% part2
RA=zeros(1,120);
PA=zeros(1,120);
FA=zeros(1,120);
for i = 1:120
    RA(i) = sum(R(i,:))/9;
    PA(i) = sum(P(i,:))/9;
    FA(i) = 2/(1/RA(i)+1/PA(i));
end
%FA is the result for F
 
%% part3
FB = zeros(24,9);
for n =1:9
    for i = 1:5:116
        sum = 0;
        for j = 1:5
            sum = sum+2/(1/R(i+j-1,n)+1/P(i+j-1,n));
        end
        FB((i-1)/5+1,n) = sum/5;
    end
end
FB

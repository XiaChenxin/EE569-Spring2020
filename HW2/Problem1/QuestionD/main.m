%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb 16, 2020
list = ['5',"10",'15','20','80','85','90','95','12240','02440','02241','12440'];
kcntR = zeros(24*5,9);%cntR,sumR,cntP,sumP
ksumR = zeros(24*5,9);
kcntP = zeros(24*5,9);
ksumP = zeros(24*5,9);
for n = 1:12
    label = "Dogs";
    path = label + list(n) +".jpg"
    E = imread(path)/255;
    E = 1-E;
    
    for i = 1:5
        [thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg( E,"Dogs_GT.mat",i);
        kcntR(5*(n-1)+i,:) = cntR;
        kcntP(5*(n-1)+i,:) = cntP;
        ksumR(5*(n-1)+i,:) = sumR;
        ksumP(5*(n-1)+i,:) = sumP;
    end
end
        
for n = 1:12
    label = "Gallery";
    path = label + list(n) +".jpg"
    E = imread(path)/255;
    E = 1-E;
    
    for i = 1:5
        [thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg( E,"Gallery_GT.mat",i);
        kcntR(5*(n-1)+60+i,:) = cntR;
        kcntP(5*(n-1)+60+i,:) = cntP;
        ksumR(5*(n-1)+60+i,:) = sumR;
        ksumP(5*(n-1)+60+i,:) = sumP;
    end
end

R = cntR./sumR;
P = cntP./sumP;

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


%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020

%
%bucket_filling.m
%operating bucket filling of histogram equalization toward target image
%
%created by Chenxin Xia
%2020.01.20
%version 1.0
%
%This function uses "book" as a transfer dictionary for gray level transfer

function result = bucket_filling(color,col)
    
    [x,y]=size(color);

    amount = x*y;
    unit = amount/256;
    num = zeros(1,256);
    for i =1:1:x
        for j = 1:1:y
            num(color(i,j)+1) = num(color(i,j)+1) + 1;
        end
    end
    
    book = zeros(256,256);%transfer dictionary from xlabel to ylabel
    xlabel = 1;
    ylabel = 1;
    count = 0;
    
    %construct dictionary
    head = zeros(1,256);
    head(1) = 1;%xlabel start trans point
    
    while (xlabel <257)&&(ylabel<257)
        while (num(xlabel) == 0) && (xlabel<256)
            xlabel = xlabel + 1;
            head(xlabel) = ylabel;
        end
        num(xlabel) = num(xlabel) - 1;
        book(xlabel,ylabel) = book(xlabel,ylabel)+1;
        count = count + 1;
        if count == unit
            count = 0;
            ylabel = ylabel + 1;
        end
    end
    
   % change original image's gray channel
   result = zeros(x,y);
   for i = 1 : 1 : x
       for j = 1 : 1 : y
           t = color(i,j)+1;
           if book(t,head(t)) == 0
               head(t) = head(t)+1;
           end
           result(i,j) = head(t);
           book(t,head(t)) = book(t,head(t))-1;
       end
   end
   for i = 1 : 1 : x
        for j = 1 : 1 : y
            result(i,j) = result(i,j)-1;
        end
   end

end
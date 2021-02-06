%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
%
%transfer.m
%transfer function based histrogram equalization
%
%created by Chenxin Xia
%2020.01.22
%version 1.2
%

function result = transf(channel,color)
    [x,y] = size(channel);
    %transfer function calculate
    num = zeros(1,256);
    for i = 1 : 1 : x
        for j = 1 : 1 : y
            num(channel(i,j)+1) = num(channel(i,j)+1) + 1;
        end
    end
    trans = zeros(1,256);%transfer function
    amount = x * y;
    sum = 0;
    for i = 1:256
        sum =sum+num(i);;
        trans(i) = floor(255*sum/amount);
    end
    %transfer function show
    figure
    plot(trans)
    xlabel=0:32:255;
    ylabel=0:32:255;
    x_label={'0','31','63','95','127','159','191','223','255'};
    y_label={'0','31','63','95','127','159','191','223','255'};
    set(gca,'xtick',xlabel);
    set(gca,'xticklabel',x_label);
    set(gca,'ytick',ylabel);
    set(gca,'yticklabel',y_label);
    %}
    axis([1 256 1 256])
    k = "transfer function of "+color+" channel";
    title(k)
          
    
    result = zeros(x,y);%initialize output
    for i = 1:1:x
        for j = 1:1:y
           result(i,j) = trans(channel(i,j)+1);
        end
    end
end
        
    
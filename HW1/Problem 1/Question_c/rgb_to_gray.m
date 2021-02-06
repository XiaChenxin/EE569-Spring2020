%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
function f = rgb_to_gray(r,g,b)
    f = floor(r*0.299+g*0.587+b*0.114);
end
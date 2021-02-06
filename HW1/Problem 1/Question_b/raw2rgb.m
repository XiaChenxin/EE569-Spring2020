%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
function [R,G,B] = raw2rgb(ori)
    %{
        function: seperate raw image to three different color layers
        
        input: 
            ori: original raw image matrix
        output:
            R: red layer before demosaicing
            G: green layer before demosaicing
            B: blue layer before demosaicing

        version 1.0.0
        copyright Chenxin Xia
        2020.01.20
    %}
    [m,n] = size(ori);
    
    R = zeros(m,n);
    G = zeros(m,n);
    B = zeros(m,n);
    %%%%%%%%%%%%% initialize RGB layers %%%%%%%%%%%%%%%%%%
    for i = 1 : 1 : m
        for j = 1 : 1 : n
            x = mod(i,2);
            y = mod(j,2);
            if x == y
                G(i,j) = ori(i,j);
            elseif x > y
                R(i,j) = ori(i,j);
            else
                B(i,j) = ori(i,j);
            end
        end
    end
end
            
            
    
    
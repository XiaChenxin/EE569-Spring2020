 %Chenxin Xia
 %2838929158
 %chenxinx@usc.edu
 %January 28, 2020
 
 
 
 function [R,G,B] = raw2rgb(ori)
     
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
             
             
     
     
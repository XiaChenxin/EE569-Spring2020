%Chenxin Xia
%2838929158
%Feb 25, 2020
%chenxinx@usc.edu
function result = shrink(ori_image,S,Mark)
    [height,wideth] = size(ori_image);
    mid = zeros(height+2,wideth+2);
    for x = 1: height
        for y = 1: wideth
            mid(x+1,y+1) = ori_image(x,y);
        end
    end
    flag = 1;
    
    while flag
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
        if k == k2
            flag = 0;
        end
        
      
    
    end
    result = zeros(height,wideth);
    for x = 1: height
        for y = 1: wideth
            result(x,y) = mid(x+1,y+1);
        end
    end
 
end
    
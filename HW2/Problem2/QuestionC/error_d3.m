%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb 12, 2020

function result = error_d3(R,G,B,n)
    [xrange,yrange] = size(R);
    midR = zeros(2*n+xrange,2*n+yrange);
    midG = zeros(2*n+xrange,2*n+yrange);
    midB = zeros(2*n+xrange,2*n+yrange);
    for i = 1:xrange
        for j = 1:yrange
            midR(n+i,n+j)=R(i,j);
            midG(n+i,n+j)=G(i,j);
            midB(n+i,n+j)=B(i,j);
        end
    end
    x = 1;y=0;direction=1;
    while 1
        y = y + direction;
        if y > yrange
            y = yrange;
            direction = -1*direction;
            x = x+1;
        end
        if y< 1
            y = 1;
            direction = -1*direction;
            x = x+1;
        end
        if x > xrange
           break
        end
        
        
        oldR = midR(n+x,n+y);
        oldG = midG(n+x,n+y);
        oldB = midB(n+x,n+y);
        
        [midR(n+x,n+y),midG(n+x,n+y),midB(n+x,n+y)] = mbvq(oldR,oldG,oldB);
        errorR = oldR - midR(n+x,n+y);
        errorG = oldG - midG(n+x,n+y);
        errorB = oldB - midB(n+x,n+y);
     
        midR(n+x,n+y+1)   = midR(n+x,n+y+1)+7/16 *errorR; 
        midR(n+x+1,n+y-1) = midR(n+x+1,n+y-1) + 3/16 *errorR;
        midR(n+x+1,n+y)   = midR(n+x+1,n+y) + 5/16 *errorR;
        midR(n+x+1,n+y+1) = midR(n+x+1,n+y+1) + 1/16 *errorR;
        
        midG(n+x,n+y+1)   = midG(n+x,n+y+1)+7/16 *errorG; 
        midG(n+x+1,n+y-1) = midG(n+x+1,n+y-1) + 3/16 *errorG;
        midG(n+x+1,n+y)   = midG(n+x+1,n+y) + 5/16 *errorG;
        midG(n+x+1,n+y+1) = midG(n+x+1,n+y+1) + 1/16 *errorG;
        
        midB(n+x,n+y+1)   = midB(n+x,n+y+1)+7/16 *errorB; 
        midB(n+x+1,n+y-1) = midB(n+x+1,n+y-1) + 3/16 *errorB;
        midB(n+x+1,n+y)   = midB(n+x+1,n+y) + 5/16 *errorB;
        midB(n+x+1,n+y+1) = midB(n+x+1,n+y+1) + 1/16 *errorB;
    end
    result = zeros(xrange,yrange,3);
    for i = 1:xrange
        for j = 1:yrange
            result(i,j,1)=midR(i+n,j+n);
            result(i,j,2)=midG(i+n,j+n);
            result(i,j,3)=midB(i+n,j+n);
        end
    end
end
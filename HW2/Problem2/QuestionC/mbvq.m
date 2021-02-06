%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%Feb 11, 2020

function [Rr,Gr,Br]=mbvq(R,G,B)



    if (R+G)>255
        if (G+B)>255
            if (R+G+B)>255
                mark = "CMYW";
            else
                mark = "MYGC";
            end
        else
            mark="RGMY";
        end
    else
        if (G+B)<=255
            if(G+B+R)<=255
                mark = "KRGB";
            else
                mark = "RGBM";
            end
        else
            mark = "CMGB";
        end
    end

%{
    if (R+G)>255
        if (G+B)<255
            mark = "RGMY";
        else
            if (R+G+B)>510
                mark="CMYW";
            else
                mark="MYGC";
            end
        end
    else
        if (G+B)>255
            mark = "CMGB";
        else 
            if(R+G+B)<255
                mark = "KRGB";
            else
                mark="RGBM";
            end
        end
    end
                
%}

    sign = getNearestVertex(mark, R/255, G/255, B/255);
    
    switch sign
        case "yellow"
            Rr=255;Gr=255;Br=0;
        case "magenta"
            Rr=255;Gr=0;Br=255;
        case "cyan"
            Rr=0;Gr=255;Br=255;
        case "blue"
            Rr=0;Gr=0;Br=255;
        case "green"
            Rr=0;Gr=255;Br=0;
        case "red"
            Rr=255;Gr=0;Br=0;
        case "black"
            Rr=0;Gr=0;Br=0;
        otherwise
            Rr=255;Gr=255;Br=255;
    end
            
end
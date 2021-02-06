%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020



function G = readraw24(filename,hight,wideth)
%readraw - read RAW format grey scale image of square size into matrix G
	% Get file ID for file
	fid=fopen(filename,'rb');

	% Check if file exists
	if (fid == -1)
	  	error('can not open input image file press CTRL-C to exit \n');
	  	pause
	end

	% Get all the pixels from the image
	pixel = fread(fid, inf, 'uchar');
	% Close file
	fclose(fid);
    
    Size = hight*wideth*3;

	% Construct matrix
	G = zeros(wideth*3,hight);

	% Write pixels into matrix
	G(1:Size) = pixel(1:Size);

	% Transpose matrix, to orient it properly
	G = G';
    mid = G;
    G = zeros(hight,wideth,3);
    for i = 1:1:hight
        for j = 1:1:wideth
            G(i,j,1)=mid(i,3*(j-1)+1);
            G(i,j,2)=mid(i,3*(j-1)+2);
            G(i,j,3)=mid(i,3*(j-1)+3);
        end
    end
end 
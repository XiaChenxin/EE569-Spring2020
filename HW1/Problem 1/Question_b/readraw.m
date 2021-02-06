%Chenxin Xia
%2838929158
%chenxinx@usc.edu
%January 28, 2020
function G = readraw(filename)
%readraw - read RAW format grey scale image of square size into matrix G
% Usage:	G = readraw(filename)

	disp(['	Retrieving Image ' filename ' ...']);

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
    
    Size = 600*532;

	% Construct matrix
	G = zeros(600,532);

	% Write pixels into matrix
	G(1:Size) = pixel(1:Size);

	% Transpose matrix, to orient it properly
	G = G';
end %function

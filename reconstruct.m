function X = reconstruct (W , Y , mu )
if( nargin <3)
X = Y * W';
else
X = Y * W' + repmat (mu , size (Y,1 ) , 1) ;
end
end
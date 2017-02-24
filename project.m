function Y = project (W , X , mu )
if( nargin <3)
Y = X *W;
else
Y = (X - repmat ( mu , size(X,1) , 1) ) *W;
end
end
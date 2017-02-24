function []= displayimage(imagevector)
%% Display average
imagevector=uint8(imagevector);
im=reshape(imagevector,[32,32]);
imshow(im);
end
function [ output_args ] = addEllipsoidToImage(image, cx, cy, cz, rx, ry, rz, file_name  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
xrange = 128;
yrange = 128;
zrange = 128;

ellipsoid = zeros([xrange yrange zrange]);
min_value = min(image(:));
max_value = max(image(:));


for x=1:xrange
    for y=1:yrange
        for z=1:zrange
            if ((x-cx)/rx)^2 + ((y-cy)/ry)^2 + ((z-cz)/rz)^2 < 1
                ellipsoid(x,y,z) = 2*((image(x,y,z) - min_value)/(max_value - min_value));
            else
                ellipsoid(x,y,z) = ((image(x,y,z) - min_value)/(max_value - min_value));
            end
        end
    end
end

writeMETA(ellipsoid,file_name);

end


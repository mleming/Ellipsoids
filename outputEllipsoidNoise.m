function [ output_args ] = outputEllipsoidNoise(  cx, cy, cz, rx, ry, rz , file_name)

xrange = 128;
yrange = 128;
zrange = 128;
max_xyz = -Inf;
min_xyz = Inf;
ellipsoid = ones([xrange yrange zrange]);

smallest_radii = min([rx ry rz]);

for x=1:xrange
    for y=1:yrange
        for z=1:zrange
            if ((x-cx)/rx)^2 + ((y-cy)/ry)^2 + ((z-cz)/rz)^2 < 1
                ellipsoid(x,y,z) = 1;
            else
                ellipsoid(x,y,z) = x+y+z;
                if x+y+z > max_xyz
                    max_xyz = x+y+z;
                elseif x+y+z < min_xyz
                    min_xyz = x+y+z;
                end
            end
        end
    end
end

for x=1:xrange
    for y=1:yrange
        for z=1:zrange
            if ((x-cx)/rx)^2 + ((y-cy)/ry)^2 + ((z-cz)/rz)^2 >= 1
                ellipsoid(x,y,z) = ((ellipsoid(x,y,z) - min_xyz)/(max_xyz - min_xyz))*0.6 + 0.2;
            end
        end
    end
end

%Gaussian
ellipsoid = smooth3(ellipsoid, 'gaussian', 3, smallest_radii/2);
ellipsoid = imnoise(ellipsoid, 'gaussian', 0, 0.01);

writeMETA(ellipsoid,file_name);


end


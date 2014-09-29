function ellipsoid = outputEllipsoid( cx, cy, cz, rx, ry, rz, file_name )

xrange = 128;
yrange = 128;
zrange = 128;

ellipsoid = zeros([xrange yrange zrange]);

for x=1:xrange
    for y=1:yrange
        for z=1:zrange
            if ((x-cx)/rx)^2 + ((y-cy)/ry)^2 + ((z-cz)/rz)^2 < 1
                ellipsoid(x,y,z) = 0.5;
            end
        end
    end
end

writeMETA(ellipsoid,file_name);

end


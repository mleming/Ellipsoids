function [ output_args ] = outputEllipsoidQuaternionRotate( cx, cy, cz, rx, ry, rz, quaternion, file_name)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
xrange = 128;
yrange = 128;
zrange = 128;

ellipsoid = zeros([xrange yrange zrange]);
x_axis = [1 0 0];
y_axis = [0 1 0];
z_axis = [0 0 1];

x_axis = quatrotate(quaternion, x_axis);
y_axis = quatrotate(quaternion, y_axis);
z_axis = quatrotate(quaternion, z_axis);
rotation_matrix =  [x_axis' y_axis' z_axis'];

for x=1:xrange
    for y=1:yrange
        for z=1:zrange
            if ((x-cx)/rx)^2 + ((y-cy)/ry)^2 + ((z-cz)/rz)^2 < 1
                B = [x-cx y-cy z-cz];
                C = [B*rotation_matrix];
                if floor(C(1))+cx >= 1 && floor(C(2))+cy >= 1 && floor(C(3))+cz >= 1 && ceil(C(1))+cx <= xrange && ceil(C(2))+cy <= yrange  && ceil(C(3))+cz <= zrange 
                     ellipsoid(floor(C(1))+cx,floor(C(2))+cy,floor(C(3))+cz) = 1;
                     ellipsoid(floor(C(1))+cx,floor(C(2))+cy,ceil(C(3))+cz) = 1;
                     ellipsoid(floor(C(1))+cx,ceil(C(2))+cy,floor(C(3))+cz) = 1;
                     ellipsoid(floor(C(1))+cx,ceil(C(2))+cy,ceil(C(3))+cz) = 1;
                     ellipsoid(ceil(C(1))+cx,floor(C(2))+cy,floor(C(3))+cz) = 1;
                     ellipsoid(ceil(C(1))+cx,floor(C(2))+cy,ceil(C(3))+cz) = 1;
                     ellipsoid(ceil(C(1))+cx,ceil(C(2))+cy,floor(C(3))+cz) = 1;
                     ellipsoid(ceil(C(1))+cx,ceil(C(2))+cy,ceil(C(3))+cz) = 1;
                end
            end
        end
    end
end

writeMETA(ellipsoid,file_name);


end


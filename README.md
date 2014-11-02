Author: Matthew Leming
Assignment 2 for Steve Pizer's COMP 775, Fall 2014, UNC-Chapel Hill

Descriptions of classes:

outputEllipsoid.m: outputs a clean ellipsoid for use in ITK-SNAP

outputEllipsoidNoise.m: outputs a blurred, noise ellipsoid

outputEllipoidQuaternionRotate.m: outputs a clean ellipsoid rotated by a quaternion

addEllipsoid.m: adds a 128x128x128 image to an ellipsoid

quatrotate.m: translates a quaternion into a rotation matrix (https://code.google.com/p/rpi-matlab-simulator/source/browse/simulator/engine/funcs/quatrotate.m?r=101)

writeMETA.m: writes a 3D MATLAB matrix into a meta image for use in ITK-SNAP

decideMETADataType.m: decides which datatype to encode the meta image in



Currently, only 128x128x128 images are supported for any classes.


To run the assignment 2.2 code, run "run_script2.m"

To run the assignment 2.3 code, run "run_script2.m"
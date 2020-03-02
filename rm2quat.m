function [ quat ] = r2quat( R )
%R2QUAT Summary of this function goes here
%   Detailed explanation goes here
quat(1)=sqrt(1+R(1,1)+R(2,2)+R(3,3))/2;
quat(2)=(R(3,2)-R(2,3))/(4*quat(1));
quat(3)=(R(1,3)-R(3,1))/(4*quat(1));
quat(4)=(R(2,1)-R(1,2))/(4*quat(1));
end


function  out = rvtm( in )

% rv  3D rotation vector <--> 3x3 coordinate rotation matrix
% E=rv(v) and v=rv(E) convert between a rotation vector v, whose magnitude
% and direction describe the angle and axis of rotation

if all(size(in)==[4 4])
  out = rv(in(1:3,1:3));
else
  out = [rv( [in(1);in(2);in(3)] ),[0;0;0];0 0 0 1];
end

function  out = rv( in )

% rv  3D rotation vector <--> 3x3 coordinate rotation matrix
% E=rv(v) and v=rv(E) convert between a rotation vector v, whose magnitude
% and direction describe the angle and axis of rotation

if all(size(in)==[3 3])
  out = Etov( in );
else
  out = vtoE( [in(1);in(2);in(3)] );
end


function  E = vtoE( v )

theta = norm(v);
if theta == 0
  E = eye(3);
else
  s = sin(theta);
  c = cos(theta);
  c1 = 2 * sin(theta/2)^2;		% 1-cos(h) == 2sin^2(h/2)
  u = v/theta;
%   E = c*eye(3) - s*skew(u) + c1*u*u';
  E = c*eye(3) + s*skew(u) + c1*u*u';

end


function  v = Etov( E )

% w = -skew(E);				% w == s/theta * v
% s = norm(w);
% c = (trace(E)-1)/2;
% theta = atan2(s,c);
% 
% if s == 0
%   v = [0;0;0];
% elseif theta < 0.9*pi			% a somewhat arbitrary threshold
%   v = theta/s * w;
% else					% extract v*v' component from E and
%   E = E - c * eye(3);			% pick biggest column (best chance
%   E = E + E';				% to get sign right)
%   if E(1,1) >= E(2,2) && E(1,1) >= E(3,3)
%     if w(1) >= 0
%       v = E(:,1);
%     else
%       v = -E(:,1);
%     end
%   elseif E(2,2) >= E(3,3)
%     if w(2) >= 0
%       v = E(:,2);
%     else
%       v = -E(:,2);
%     end
%   else
%     if w(3) >= 0
%       v = E(:,3);
%     else
%       v = -E(:,3);
%     end
%   end
%   v = theta/norm(v) * v;
theta=acos((trace(E)-1)/2);
if theta == 0
    v=[0;0;0];
else
    u=1/(2*sin(theta))*[E(3,2)-E(2,3);E(1,3)-E(3,1);E(2,1)-E(1,2)];
    v=u*theta;
end

function  out = rq( in )

% rq  unit quaternion <--> 3x3 coordinate rotation matrix

if all(size(in)==[3 3])
  out = Etoq( in );
else
  out = qtoE( in );
end


function  E = qtoE( q )

q=q/norm(q);
q0=q(1);
q1=q(2);
q2=q(3);
q3=q(4);
E(1, 1) = 1 - 2 * q2 * q2 - 2 * q3 * q3;
E(1, 2) = 2 * q1 * q2 - 2 * q0 * q3;
E(1, 3) = 2 * q1 * q3 + 2 * q0 * q2;

E(2, 1) = 2 * q1 * q2 + 2 * q0 * q3;
E(2, 2) = 1 - 2 * q1 * q1 - 2 * q3 * q3;
E(2, 3) = 2 * q2 * q3 - 2 * q0 * q1;

E(3, 1) = 2 * q1 * q3 - 2 * q0 * q2;
E(3, 2) = 2 * q2 * q3 + 2 * q0 * q1;
E(3, 3) = 1 - 2 * q1 * q1 - 2 * q2 * q2;



function  q = Etoq( E )

 

% tr = trace(E);				% trace is 4*q0^2-1
% v = -skew(E);				% v is 2*q0 * [q1;q2;q3]
% 
% if tr > 0
%   q = [ (tr+1)/2; v ];
% else
%   E = E - (tr-1)/2 * eye(3);
%   E = E + E';
%   if E(1,1) >= E(2,2) && E(1,1) >= E(3,3)
%     q = [ 2*v(1); E(:,1) ];
%   elseif E(2,2) >= E(3,3)
%     q = [ 2*v(2); E(:,2) ];
%   else
%     q = [ 2*v(3); E(:,3) ];
%   end
%   if q(1) < 0
%     q = -q;
%   end
% end
% 
% q = q / norm(q);
q(1)=sqrt(1+E(1,1)+E(2,2)+E(3,3))/2;
q(2)=(E(3,2)-E(2,3))/(4*q(1));
q(3)=(E(1,3)-E(3,1))/(4*q(1));
q(4)=(E(2,1)-E(1,2))/(4*q(1));

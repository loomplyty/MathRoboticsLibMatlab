function [ rm_out ] = quat2R_new( q )
q=q/norm(q);
q0=q(1);
q1=q(2);
q2=q(3);
q3=q(4);
rm_out(1, 1) = 1 - 2 * q2 * q2 - 2 * q3 * q3;
rm_out(1, 2) = 2 * q1 * q2 - 2 * q0 * q3;
rm_out(1, 3) = 2 * q1 * q3 + 2 * q0 * q2;

rm_out(2, 1) = 2 * q1 * q2 + 2 * q0 * q3;
rm_out(2, 2) = 1 - 2 * q1 * q1 - 2 * q3 * q3;
rm_out(2, 3) = 2 * q2 * q3 - 2 * q0 * q1;

rm_out(3, 1) = 2 * q1 * q3 - 2 * q0 * q2;
rm_out(3, 2) = 2 * q2 * q3 + 2 * q0 * q1;
rm_out(3, 3) = 1 - 2 * q1 * q1 - 2 * q2 * q2;

end


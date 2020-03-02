function [ R ] = quat2R( q )

q0=q(1)/norm(q);
qv=[q(2);q(3);q(4)]/norm(q);
R=(q0^2-norm(qv)^2)*eye(3)+2*qv*qv'+2*q0*skew(qv);
end


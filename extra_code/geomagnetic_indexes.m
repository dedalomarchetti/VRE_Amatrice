function [dst,ap]=geomagnetic_indexes(z,a,b)
a1=a(a(:,1)==z(1) & a(:,2)==z(2) & a(:,3)==z(3),4:end);
b1=b(b(:,1)==z(1) & b(:,2)==z(2) & b(:,3)==z(3),4:end);
dst=a1(1, round(z(4))+1);
ap=b1(1, round(z(4))+1);
return

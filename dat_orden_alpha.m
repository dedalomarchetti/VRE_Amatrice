function [yn]=dat_orden_alpha(x,SAT)
Mmlat=70;%maximum and minimum latitude (outside the polar areas)
if SAT=='A';sat=1;end
if SAT=='B';sat=2;end
if SAT=='C';sat=3;end
if SAT=='S';sat=4;end
%We add 2 new colums: SAT YYYY MM DD HH MM SS N�TRACK LAT LONG R X Y Z F
y=x(abs(x(:,7))<=Mmlat,:);
nn=size(y,1);
yn=zeros(nn-1,size(y,2)+2);
if nn>1
    k=1;m=1;
    while k<=nn-1
        yn(k,:)=[sat,y(k,1:6),m,y(k,7:end)];
        if abs(y(k,7)-y(k+1,7))>.5 || abs(y(k,8)-y(k+1,8))>1;
            m=m+1;
        end
        k=k+1;
    end
end
return
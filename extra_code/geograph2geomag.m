function [mlat,mlong]=geograph2geomag(lat,long,time)
%lat, lon = geographic latitude and longitude
%time expressed in year for example 30/01/2016 : time = 2016
format long
polo=load(fullfile("data/polos_igrf_swarm.dat"));
fact=pi/180;
%latitud y longitud del polo en 2014 (IGRF12).
Dlat= polo(polo(:,1)==time,2)*fact;%latitud del polo
Dlong= (360+polo(polo(:,1)==time,3))*fact;%longitud del polo
%programa
glong=long*fact;
glat=lat*fact;
x=cos(glat).*cos(glong);
y=cos(glat).*sin(glong);
z=sin(glat);
dato=[x,y,z];
%primera rotaci�n plano ecuadro desde el meridiano de Greenwich al
%meridinao del polo.
M1=[cos(Dlong) sin(Dlong) 0;-sin(Dlong) cos(Dlong) 0;0 0 1];
S1=M1*dato';
%segunda rotaci�n en el plano el actual meridiano desde el polo geogr�fico
%al magn�tico.
M2=[cos(pi/2-Dlat) 0 -sin(pi/2-Dlat);0 1 0;sin(pi/2-Dlat) 0 cos(pi/2-Dlat)];
S2=M2*S1;
S2=S2';
%�ltima transformaci�n
mlat=atan(S2(:,3)./sqrt(S2(:,1).^2+S2(:,2).^2));
mlat=mlat/fact;
mlong=atan(S2(:,2)./S2(:,1));
mlong=mlong/fact;
return
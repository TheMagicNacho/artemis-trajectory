function [ycdot]=firstcoasteom(t,yc)
global mdot T Re ge tstep
%EOM's for 2-D launch
%y0=[mnot Hnot Xnot Vnot gammanot};
%change in mass mdot
ycdot(1,1)=0;
%change in altitude Hdot
ycdot(2,1)=yc(4)*sin(yc(5));
%change in horizontal distance Xdot
ycdot(3,1)=yc(4)*cos(yc(5));
%change in Velocity
ycdot(4,1)=(1/yc(1))*(T-(yc(1)*ge-yc(1)*((yc(4)*cos(yc(5)))^2)/(Re+yc(2)))*sin(yc(5)));
%change in gamma
ycdot(5,1)=-(1/yc(1))*(1/yc(4))*(yc(1)*ge-yc(1)*((yc(4)*cos(yc(5)))^2)/(Re+yc(2)))*cos(yc(5));

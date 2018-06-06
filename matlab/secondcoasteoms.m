% eoms for second stage coast
function [yccdot]=secondcoasteoms(t,ycc)
global mdot T Re ge tstep
%EOM's for 2-D launch
%y0=[mnot Hnot Xnot Vnot gammanot};
%change in mass mdot
yccdot(1,1)=0;
%change in altitude Hdot
yccdot(2,1)=ycc(4)*sin(ycc(5));
%change in horizontal distance Xdot
yccdot(3,1)=ycc(4)*cos(ycc(5));
%change in Velocity
yccdot(4,1)=(1/ycc(1))*(T-(ycc(1)*ge-ycc(1)*((ycc(4)*cos(ycc(5)))^2)/(Re+ycc(2)))*sin(ycc(5)));
%change in gamma
yccdot(5,1)=-(1/ycc(1))*(1/ycc(4))*(ycc(1)*ge-ycc(1)*((ycc(4)*cos(ycc(5)))^2)/(Re+ycc(2)))*cos(ycc(5));

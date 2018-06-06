% Launcheoms for second stage
function [yydot]=secondeoms(t,yy)
global mdot T Re ge tstep
%EOM's for 2-D launch
%y0=[mnot Hnot Xnot Vnot gammanot};
%change in mass mdot
yydot(1,1)=-592.64056;
%change in altitude Hdot
yydot(2,1)=yy(4)*sin(yy(5));
%change in horizontal distance Xdot
yydot(3,1)=yy(4)*cos(yy(5));
%change in Velocity
yydot(4,1)=(1/yy(1))*(T-(yy(1)*ge-yy(1)*((yy(4)*cos(yy(5)))^2)/(Re+yy(2)))*sin(yy(5)));
%change in gamma
yydot(5,1)=-(1/yy(1))*(1/yy(4))*(yy(1)*ge-yy(1)*((yy(4)*cos(yy(5)))^2)/(Re+yy(2)))*cos(yy(5));

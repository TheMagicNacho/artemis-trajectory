% Launcheoms for third stage
% Corrected for mdot=50% of mdot stages 1 and 2
function [yyydot]=thirdeoms(t,yyy)
global mdot T Re ge tstep
%EOM's for 2-D launch
%y0=[mnot Hnot Xnot Vnot gammanot};
%change in mass mdot
yyydot(1,1)=-296.32028;
%change in altitude Hdot
yyydot(2,1)=yyy(4)*sin(yyy(5));
%change in horizontal distance Xdot
yyydot(3,1)=yyy(4)*cos(yyy(5));
%change in Velocity
yyydot(4,1)=(1/yyy(1))*(T-(yyy(1)*ge-yyy(1)*((yyy(4)*cos(yyy(5)))^2)/(Re+yyy(2)))*sin(yyy(5)));
%change in gamma
yyydot(5,1)=-(1/yyy(1))*(1/yyy(4))*(yyy(1)*ge-yyy(1)*((yyy(4)*cos(yyy(5)))^2)/(Re+yyy(2)))*cos(yyy(5));

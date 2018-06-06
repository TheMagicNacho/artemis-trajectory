clear
close all
file=fopen('','w+');
fprintf(file,'mass \t \t \t altitude \t \t \t X \t \t \t V \t \t \t gamma \n');
global mdot T Re ge tstep
%Times
tstep=1; %sec
tfinal=82; %sec
% Constants --------------------------
T=1650245.73705; %Thrust in N
mdot=592.64056; %mass flow is considered constant (kg/s);
Re=6378135; %Radius of earth in meters;
ge=9.81; %gravity g;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial Conditions
mnot=136077.711; %total mass in kg
gammanot=89.9975*pi/180; %gamma must be in radians;
Vnot=134.112; %Initial velocity 300 mph, but in meters/sec:
Hnot=6096; %Initial Altitude... 20kft...in meters
Xnot=0; %Initial X position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


y0=[mnot Hnot Xnot Vnot gammanot];
% Integrate the equations of motion
options = odeset('RelTol',1e-7,'AbsTol',1e-10*ones(1,5));
[t,y] = ODE45('launcheoms',0:tstep:tfinal,y0,options);
out=[y(:,2) y(:,3) y(:,4) y(:,5)];
fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \n',out');
%fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \t %2.8e \n',y');
fclose(file);

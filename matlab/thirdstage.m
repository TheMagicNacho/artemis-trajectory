close all
file=fopen('C:\thesis\withcoast\thirdstage.txt','w+');
fprintf(file,'mass \t \t \t altitude \t \t \t X \t \t \t V \t \t \t gamma \n');
global mdot T Re ge tstep
%Times
tstep=1; %sec
tfinal=84; %sec rounded down from 84.9 seconds
% Constants --------------------------
T=813932.5451; %Thrust in N
mdot=592.64056; %mass flow is considered constant (kg/s);
Re=6378135; %Radius of earth in meters;
ge=9.81; %gravity g;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial Conditions
mnot=30700.027786; %total mass - first stage mass in kg
% gammanot=1.13822111; %gamma must be in radians;
% Vnot=2241.82678; %Velocity from end of 2nd stage, in meters/sec:
% Hnot=124507.332; %Altitude from previous run
% Xnot=37516.3229; %Initial X position third stage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% yyy0=[mnot Hnot Xnot Vnot gammanot];
yyy0=[mnot ycc(161,2) ycc(161,3) ycc(161,4) ycc(161,5)];
% Integrate the equations of motion
options = odeset('RelTol',1e-7,'AbsTol',1e-10*ones(1,5));
[t,yyy] = ODE45('thirdeoms',0:tstep:tfinal,yyy0,options);
out=[yyy(:,2) yyy(:,3) yyy(:,4) yyy(:,5)];
fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \n',out');
% fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \t %2.8e \n',yyy');
fclose(file);

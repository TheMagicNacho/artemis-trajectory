close all
file=fopen('C:\thesis\withcoast\secondstage.txt','w+');
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
mnot=83388.874893; %total mass - first stage mass in kg
% gammanot=1.36707253; %gamma must be in radians;
% Vnot=564.206512; %Velocity from end of 1st stage, but in meters/sec:
% Hnot=30732.3097; %Altitude from previous run
% Xnot=2685.21896; %Initial X position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% yy0=[mnot Hnot Xnot Vnot gammanot];
yy0=[mnot yc(51,2) yc(51,3) yc(51,4) yc(51,5)];
% Integrate the equations of motion
options = odeset('RelTol',1e-7,'AbsTol',1e-10*ones(1,5));
[t,yy] = ODE45('secondeoms',0:tstep:tfinal,yy0,options);
out=[yy(:,2) yy(:,3) yy(:,4) yy(:,5)];
fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \n',out');
%fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \t %2.8e \n',yy');
fclose(file);

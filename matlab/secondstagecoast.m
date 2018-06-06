close all
file=fopen('C:\thesis\withcoast\secondstagecoast.txt','w+');
fprintf(file,'mass \t \t \t altitude \t \t \t X \t \t \t V \t \t \t gamma \n');
global mdot T Re ge tstep
%Times
tstep=1; %sec
tfinal=160; %sec
% Constants --------------------------
T=0; %Thrust in N
mdot=0; %mass flow is considered constant (kg/s);
Re=6378135; %Radius of earth in meters;
ge=9.81; %gravity g;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial Conditions
mnot=30700.027786; %total mass - stages 1 and 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% yyy0=[mnot Hnot Xnot Vnot gammanot];
ycc0=[mnot yy(83,2) yy(83,3) yy(83,4) yy(83,5)];
% Integrate the equations of motion
options = odeset('RelTol',1e-7,'AbsTol',1e-10*ones(1,5));
[t,ycc] = ODE45('secondcoasteoms',0:tstep:tfinal,ycc0,options);
out=[ycc(:,2) ycc(:,3) ycc(:,4) ycc(:,5)];
fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \n',out');
% fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \t %2.8e \n',ycc');
fclose(file);

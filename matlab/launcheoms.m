gammanot};
close all
file=fopen('C:\thesis\withcoast\firststagecoast.txt','w+');
fprintf(file,'mass \t \t \t altitude \t \t \t X \t \t \t V \t \t \t gamma \n');
global mdot T Re ge tstep
%Times
tstep=1; %sec
tfinal=50; %sec
% Constants --------------------------
T=0; %Thrust in N
mdot=0; %mass flow is considered constant (kg/s);
Re=6378135; %Radius of earth in meters;
ge=9.81; %gravity g;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial Conditions
mnot=83388.874893; %total mass - first stage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% yyy0=[mnot Hnot Xnot Vnot gammanot];
yc0=[mnot y(83,2) y(83,3) y(83,4) y(83,5)];
% Integrate the equations of motion
options = odeset('RelTol',1e-7,'AbsTol',1e-10*ones(1,5));
[t,yc] = ODE45('firstcoasteom',0:tstep:tfinal,yc0,options);
out=[yc(:,2) yc(:,3) yc(:,4) yc(:,5)];
fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \n',out');
% fprintf(file,'%2.8e \t %2.8e \t %2.8e \t %2.8e \t %2.8e \n',yc');
fclose(file);


// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

xdel(winsid())
file = mtlb_fopen("C:\thesis\withcoast\secondstage.txt","w+");
// L.3: No simple equivalent, so mtlb_fprintf() is called.
mtlb_fprintf(file,"mass \t \t \t altitude \t \t \t X \t \t \t V \t \t \t gamma \n");
global("mdot","T","Re","ge","tstep")
//Times
tstep = 1;//sec
tfinal = 82;//sec
// Constants --------------------------
T = 1650245.73705;//Thrust in N
mdot = 592.64056;//mass flow is considered constant (kg/s);
Re = 6378135;//Radius of earth in meters;
ge = 9.81;//gravity g;
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Initial Conditions
mnot = 83388.874893;//total mass - first stage mass in kg
// gammanot=1.36707253; %gamma must be in radians;
// Vnot=564.206512; %Velocity from end of 1st stage, but in meters/sec:
// Hnot=30732.3097; %Altitude from previous run
// Xnot=2685.21896; %Initial X position
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// yy0=[mnot Hnot Xnot Vnot gammanot];
// !! L.22: Unknown function yc not converted, original calling sequence used.
// !! L.22: Unknown function yc not converted, original calling sequence used.
// !! L.22: Unknown function yc not converted, original calling sequence used.
// !! L.22: Unknown function yc not converted, original calling sequence used.
yy0 = [mnot,yc(51,2),yc(51,3),yc(51,4),yc(51,5)];
// Integrate the equations of motion
// !! L.24: Matlab function odeset not yet converted, original calling sequence used.
options = odeset("RelTol",0.0000001,"AbsTol",0.0000000001*ones(1,5));
// !! L.25: Unknown function ODE45 not converted, original calling sequence used.
[t,yy] = ODE45("secondeoms",0:tstep:tfinal,yy0,options);
// ! L.26: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// ! L.26: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// !! L.26: Unknown function mtlb not converted, original calling sequence used.
// ! L.26: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// ! L.26: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// !! L.26: Unknown function mtlb not converted, original calling sequence used.
// ! L.26: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// ! L.26: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// !! L.26: Unknown function mtlb not converted, original calling sequence used.
// ! L.26: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// ! L.26: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// !! L.26: Unknown function mtlb not converted, original calling sequence used.
out = [yy(mtlb(mtlb(:)),2),yy(mtlb(mtlb(:)),3),yy(mtlb(mtlb(:)),4),yy(mtlb(mtlb(:)),5)];
// L.27: No simple equivalent, so mtlb_fprintf() is called.
mtlb_fprintf(file,"%2.8e \t %2.8e \t %2.8e \t %2.8e \n",mtlb_t(out));
//fprintf(file,''%2.8e \t %2.8e \t %2.8e \t %2.8e \t %2.8e \n'',yy'');
mclose(file);

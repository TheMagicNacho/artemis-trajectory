
// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

xdel(winsid())
file = mtlb_fopen("C:\thesis\withcoast\secondstagecoast.txt","w+");
// L.3: No simple equivalent, so mtlb_fprintf() is called.
mtlb_fprintf(file,"mass \t \t \t altitude \t \t \t X \t \t \t V \t \t \t gamma \n");
global("mdot","T","Re","ge","tstep")
//Times
tstep = 1;//sec
tfinal = 160;//sec
// Constants --------------------------
T = 0;//Thrust in N
mdot = 0;//mass flow is considered constant (kg/s);
Re = 6378135;//Radius of earth in meters;
ge = 9.81;//gravity g;
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Initial Conditions
mnot = 30700.027786;//total mass - stages 1 and 2
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// yyy0=[mnot Hnot Xnot Vnot gammanot];
// !! L.18: Unknown function yy not converted, original calling sequence used.
// !! L.18: Unknown function yy not converted, original calling sequence used.
// !! L.18: Unknown function yy not converted, original calling sequence used.
// !! L.18: Unknown function yy not converted, original calling sequence used.
ycc0 = [mnot,yy(83,2),yy(83,3),yy(83,4),yy(83,5)];
// Integrate the equations of motion
// !! L.20: Matlab function odeset not yet converted, original calling sequence used.
options = odeset("RelTol",0.0000001,"AbsTol",0.0000000001*ones(1,5));
// !! L.21: Unknown function ODE45 not converted, original calling sequence used.
[t,ycc] = ODE45("secondcoasteoms",0:tstep:tfinal,ycc0,options);
// ! L.22: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// ! L.22: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// !! L.22: Unknown function mtlb not converted, original calling sequence used.
// ! L.22: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// ! L.22: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// !! L.22: Unknown function mtlb not converted, original calling sequence used.
// ! L.22: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// ! L.22: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// !! L.22: Unknown function mtlb not converted, original calling sequence used.
// ! L.22: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// ! L.22: mtlb(:) can be replaced by :() or : whether : is an M-file or not.
// !! L.22: Unknown function mtlb not converted, original calling sequence used.
out = [ycc(mtlb(mtlb(:)),2),ycc(mtlb(mtlb(:)),3),ycc(mtlb(mtlb(:)),4),ycc(mtlb(mtlb(:)),5)];
// L.23: No simple equivalent, so mtlb_fprintf() is called.
mtlb_fprintf(file,"%2.8e \t %2.8e \t %2.8e \t %2.8e \n",mtlb_t(out));
// fprintf(file,''%2.8e \t %2.8e \t %2.8e \t %2.8e \t %2.8e \n'',ycc'');
mclose(file);

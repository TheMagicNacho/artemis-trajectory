
// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

xdel(winsid())
file = mtlb_fopen("C:\thesis\withcoast\firststagecoast.txt","w+");
// L.3: No simple equivalent, so mtlb_fprintf() is called.
mtlb_fprintf(file,"mass \t \t \t altitude \t \t \t X \t \t \t V \t \t \t gamma \n");
global("mdot","T","Re","ge","tstep")
//Times
tstep = 1;//sec
tfinal = 50;//sec
// Constants --------------------------
T = 0;//Thrust in N
mdot = 0;//mass flow is considered constant (kg/s);
Re = 6378135;//Radius of earth in meters;
ge = 9.81;//gravity g;
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Initial Conditions
mnot = 83388.874893;//total mass - first stage
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// yyy0=[mnot Hnot Xnot Vnot gammanot];
// !! L.18: Unknown function y not converted, original calling sequence used.
// !! L.18: Unknown function y not converted, original calling sequence used.
// !! L.18: Unknown function y not converted, original calling sequence used.
// !! L.18: Unknown function y not converted, original calling sequence used.
yc0 = [mnot,y(83,2),y(83,3),y(83,4),y(83,5)];
// Integrate the equations of motion
// !! L.20: Matlab function odeset not yet converted, original calling sequence used.
options = odeset("RelTol",0.0000001,"AbsTol",0.0000000001*ones(1,5));
// !! L.21: Unknown function ODE45 not converted, original calling sequence used.
[t,yc] = ODE45("firstcoasteom",0:tstep:tfinal,yc0,options);
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
out = [yc(mtlb(mtlb(:)),2),yc(mtlb(mtlb(:)),3),yc(mtlb(mtlb(:)),4),yc(mtlb(mtlb(:)),5)];
// L.23: No simple equivalent, so mtlb_fprintf() is called.
mtlb_fprintf(file,"%2.8e \t %2.8e \t %2.8e \t %2.8e \n",mtlb_t(out));
// fprintf(file,''%2.8e \t %2.8e \t %2.8e \t %2.8e \t %2.8e \n'',yc'');
mclose(file);

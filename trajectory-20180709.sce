//          !!!!! VARIABLES !!!!!!!//
tstep = 1; //sec - interval for graphing
AA = 88; //degrees - Angle of Attack from horizon

T = 1650245.73705; //N - Thrust
// DOUBLE CHECK THE THRUST

M0 = 200000; //g - initial mass of vehicle 
V = 11000; // m/s - velocity 

//          !!!!!constants don't change !!!!!!//
mdot = 592.64056;//mass flow is considered constant (kg/s)
//DOUBLE CHECK THE MDOT

Re = 6378135; //Radius of earth in meters
Gr = 9.81; //gravity g;
D =  0; // drag - left zero because there is no ATM
X0 = 30000; //m - initial launch altitude
Y0 = 0; //initial horizontal launch distance




//          !!!!!! CALCULATOR OUTPUTS !!!!!!!
psi0 = 90 - AA; // angle from center line of rocket
n = (T-D / M0 * Gr); //new constant
z = tan(psi/2); // calculate change in altitude
C = V / (z^(n-1) * (1+Z^2) );
v = C * z^(n-1) * (1+z^2);


///         !!!!!!! PLOT GRAPH !!!!!!!
plot ( altitude, distance);

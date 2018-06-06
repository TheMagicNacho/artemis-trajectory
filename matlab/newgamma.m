%dgamma/dgammanot program
%dgamma= old gamma - new gamma
gammao=5.25671725e-001;
gamman=1.15971452e-002;
dgamma=gammao-gamman %radians
% dgammanot= |new gamma - previous gamma|
gammanotnew=89.78;
gammanotold=89.9;
dgammanot=gammanotold-gammanotnew %degrees
deltagammanot=(dgammanot)*(gamman)/(dgamma) %degrees
newgammanot=gammanotnew-deltagammanot

function [mech] = DodajMonitor(mechanizm,typ,czlon,punkt)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
mech = mechanizm;

monitor = struct('typ',typ,'czlon',czlon,'punkt',punkt);

if(mech.liczbamonitorow ==0)
   	mech.monitory(1) = monitor;
else
    mech.monitory(mech.liczbamonitorow+1) = monitor;
end
mech.liczbamonitorow = mech.liczbamonitorow+1;
end


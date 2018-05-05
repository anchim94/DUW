function [mechanizm] = QdoMechanizmu(mechanizm,q)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
n = length(mechanizm.czlony);
for i=1:n
    czl = mechanizm.czlony(i);
    czl.srodek.q = q([3*czl.id+1 3*czl.id+2],1);
    czl.kat = q(3*czl.id+3,1);
    mechanizm.czlony(i) = czl;
end
end



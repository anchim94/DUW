function [res] = NRaphson(mechanizm,t)
%UNTITLED16 Summary of this function goes here
%   Detailed explanation goes here
m = mechanizm;
max_it = 30;
eps = 1e-9;
for i=1:max_it
   P = GenRownanieWiezow(m,t);
   Q = QzMechanizmu(m);
   if norm(P)<eps 
       break;
   end
   J = GenJakobi(m,t);
   dQ = J\P;
   Q = Q - dQ;
   m = QdoMechanizmu(m,Q);
end
if i == max_it
   disp('Brak zbieznosci');
   res = mechanizm;
   return;
end
res = m;
end


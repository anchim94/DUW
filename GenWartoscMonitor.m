function [result] = GenWartoscMonitor(mechanizm,t)
%GenWartoscMonitor Zwraca nowy wiesz do tablicy do tablicowania wartosci
%monitor nadanych dla danych punktow ciala
result = zeros(mechanizm.liczbamonitorow+1,1);
result(1) = t;
for i=1:mechanizm.liczbamonitorow
   monitor = mechanizm.monitory(i);
   C1 = FindCzlon(monitor.czlon,mechanizm.czlony);
   P1 = FindPoint(monitor.punkt,C1.lancuch);
   if strcmp(monitor.typ,'X')
        r = (C1.srodek.q + R(C1.kat)*P1.q);
        result(i+1) = r(1);
   end
   if strcmp(monitor.typ,'Y')
       r = (C1.srodek.q + R(C1.kat)*P1.q);
        result(i+1) = r(2);
   end
end
result = result';
end


function [monitory] = ADAMS(mechanizm,czas_koncowy,krok)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
m = mechanizm;
m = DodajMonitor(m,'X','CZL2','C');
m = DodajMonitor(m,'Y','CZL2','C');
RysujMechanizm(m);
xlim([-1 4])
ylim([-4 2])
tablica = zeros(length(0:krok:czas_koncowy),m.liczbamonitorow+1);
it = 1;
for i=0:krok:czas_koncowy
   m = NRaphson(m,i);
   clf;
   RysujMechanizm(m);
   tablica(it,:) = GenWartoscMonitor(m,i);
   it = it+1;
   pause(krok);
end
monitory = tablica;
end


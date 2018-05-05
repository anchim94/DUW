function [monitory] = ADAMS(mechanizm,czas_koncowy,krok)
%ADAMS Funkcja rozwi¹zuje zadanie na po³o¿enia, prêdkoœci i przyspieszenia
%ARGUMENTY FUNKCJI:
%mechanizm      --- struktura mechanizmu
%czas_koncowy   --- czas koncowy ruchu
%krok           --- d³ugoœæ kroku czasowego

m = mechanizm;
%dodawanie monitorów 
m = DodajMonitor(m,'X','CZL2','C'); 
m = DodajMonitor(m,'Y','CZL2','C');
m = DodajMonitor(m,'VX','CZL2','C'); 
m = DodajMonitor(m,'VY','CZL2','C');
RysujMechanizm(m);
xlim([-1 4])
ylim([-4 2])
tablica = zeros(length(0:krok:czas_koncowy),m.liczbamonitorow+1);
it = 1;
for i=0:krok:czas_koncowy
   m = NRaphson(m,i); %rozwi¹zujemy krok za pomoc¹ metody NR
   m = zadpred(m,i);
   clf;
   RysujMechanizm(m); %rysujemy mechanizm
   tablica(it,:) = GenWartoscMonitor(m,i); %pobieramy wartoœci do monitorów
   it = it+1; %kolejna iteracja
   pause(krok);
end
monitory = tablica; %zwraca do tablicy monitorów ostateczne wartoœci
end


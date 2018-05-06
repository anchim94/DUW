function [monitory,m] = ADAMS(mechanizm,czas_koncowy,krok)
%ADAMS Funkcja rozwi¹zuje zadanie na po³o¿enia, prêdkoœci i przyspieszenia
%ARGUMENTY FUNKCJI:
%mechanizm      --- struktura mechanizmu
%czas_koncowy   --- czas koncowy ruchu
%krok           --- d³ugoœæ kroku czasowego

m = mechanizm;
%dodawanie monitorów 
m = DodajMonitor(m,'X','CZL3','K'); 
m = DodajMonitor(m,'Y','CZL3','K');
m = DodajMonitor(m,'VX','CZL3','K'); 
m = DodajMonitor(m,'VY','CZL3','K');
m = DodajMonitor(m,'AX','CZL3','K'); 
m = DodajMonitor(m,'AY','CZL3','K');
m = DodajMonitor(m,'AX','CZL1','O'); 
m = DodajMonitor(m,'AY','CZL1','O');
m = DodajMonitor(m,'AX','CZL5','N'); 
m = DodajMonitor(m,'AY','CZL5','N');
m = DodajMonitor(m,'AX','CZL7','H'); 
m = DodajMonitor(m,'AY','CZL7','H');
RysujMechanizm(m);
xlim([-1 4])
ylim([-4 2])
tablica = zeros(length(0:krok:czas_koncowy),m.liczbamonitorow+1);
it = 1;
mechanizm.pred = zeros(mechanizm.wiezyilosc,1);
mechanizm.przysp = zeros(mechanizm.wiezyilosc,1);
for i=0:krok:czas_koncowy
   Q = QzMechanizmu(m);
   Q = Q + mechanizm.pred * krok + 0.5*mechanizm.przysp*krok*krok;
   m = QdoMechanizmu(m,Q);
   m = NRaphson(m,i); %rozwi¹zujemy krok za pomoc¹ metody NR
   m = zadpred(m,i);
   m = zadprzysp(m,i);
   clf;
   RysujMechanizm(m); %rysujemy mechanizm
   tablica(it,:) = GenWartoscMonitor(m,i); %pobieramy wartoœci do monitorów
   it = it+1; %kolejna iteracja
   pause(krok);
end
monitory = tablica; %zwraca do tablicy monitorów ostateczne wartoœci
end


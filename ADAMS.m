function [monitory,m] = ADAMS(mechanizm,czas_koncowy,krok)
%ADAMS Funkcja rozwi�zuje zadanie na po�o�enia, pr�dko�ci i przyspieszenia
%ARGUMENTY FUNKCJI:
%mechanizm      --- struktura mechanizmu
%czas_koncowy   --- czas koncowy ruchu
%krok           --- d�ugo�� kroku czasowego

m = mechanizm;
%dodawanie monitor�w 
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
   m = NRaphson(m,i); %rozwi�zujemy krok za pomoc� metody NR
   m = zadpred(m,i);
   m = zadprzysp(m,i);
   clf;
   RysujMechanizm(m); %rysujemy mechanizm
   tablica(it,:) = GenWartoscMonitor(m,i); %pobieramy warto�ci do monitor�w
   it = it+1; %kolejna iteracja
   pause(krok);
end
monitory = tablica; %zwraca do tablicy monitor�w ostateczne warto�ci
end


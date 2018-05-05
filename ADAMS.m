function [monitory] = ADAMS(mechanizm,czas_koncowy,krok)
%ADAMS Funkcja rozwi�zuje zadanie na po�o�enia, pr�dko�ci i przyspieszenia
%ARGUMENTY FUNKCJI:
%mechanizm      --- struktura mechanizmu
%czas_koncowy   --- czas koncowy ruchu
%krok           --- d�ugo�� kroku czasowego

m = mechanizm;
%dodawanie monitor�w 
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
   m = NRaphson(m,i); %rozwi�zujemy krok za pomoc� metody NR
   m = zadpred(m,i);
   clf;
   RysujMechanizm(m); %rysujemy mechanizm
   tablica(it,:) = GenWartoscMonitor(m,i); %pobieramy warto�ci do monitor�w
   it = it+1; %kolejna iteracja
   pause(krok);
end
monitory = tablica; %zwraca do tablicy monitor�w ostateczne warto�ci
end


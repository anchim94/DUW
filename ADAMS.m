function [monitory] = ADAMS(mechanizm,czas_koncowy,krok,bad_czl,bad_pun)
%ADAMS Funkcja rozwi�zuje zadanie na po�o�enia, pr�dko�ci i przyspieszenia
%ARGUMENTY FUNKCJI:
%mechanizm      --- struktura mechanizmu
%czas_koncowy   --- czas koncowy ruchu
%krok           --- d�ugo�� kroku czasowego
%bad_czl        --- nazwa badanego cz�onu
%bad_pun        --- nazwa badanego punktu

m = mechanizm;
%dodawanie monitor�w 
%TYPY MONITOR�W:
%TYP 'Y'    - pobiera wsp�rz�dn� Y punktu
%TYP 'VX'   - pobiera pr�dko�� punktu na kierunku X 
%TYP 'VY'   - pobiera pr�dko�� punktu na kierunku Y 
%TYP 'AX'   - pobiera przyspieszenie punktu na kierunku X 
%TYP 'AY'   - pobiera przyspieszenie punktu na kierunku Y 
%TYP 'PHI'  - pobiera k�t po�o�enia cz�onu
%TYP 'PHI1' - pobiera pr�dko�� k�tow� cz�onu
%TYP 'PHI2' - pobiera przyspieszenie k�towe cz�onu

m = DodajMonitor(m,'X',bad_czl,bad_pun); 
m = DodajMonitor(m,'Y',bad_czl,bad_pun);
m = DodajMonitor(m,'VX',bad_czl,bad_pun); 
m = DodajMonitor(m,'VY',bad_czl,bad_pun);
m = DodajMonitor(m,'AX',bad_czl,bad_pun); 
m = DodajMonitor(m,'AY',bad_czl,bad_pun);

RysujMechanizm(m);
xlim([-1 4])
ylim([-4 2])
tablica = zeros(length(0:krok:czas_koncowy),m.liczbamonitorow+1); %tablica przechowuj�ca dane z monitor�w
it = 1;
mechanizm.pred = zeros(mechanizm.wiezyilosc,1); %warto�ci pocz�tkowe wektora pr�dkosci
mechanizm.przysp = zeros(mechanizm.wiezyilosc,1); %warto�ci pocz�tkowe wektora przyspiesze�
for i=0:krok:czas_koncowy
    %nadanie po�o�enia startowego do metody NR
   Q = QzMechanizmu(m);
   Q = Q + mechanizm.pred * krok + 0.5*mechanizm.przysp*krok*krok; 
   m = QdoMechanizmu(m,Q);
   %rozwi�zujemy krok za pomoc� metody NR
   m = NRaphson(m,i); 
   %rozwi�zujemy zadanie na pr�dko�ci
   m = zadpred(m,i);
   %rozwi�zujemy zadanie na przyspieszenia
   m = zadprzysp(m,i);
   clf;
   RysujMechanizm(m); %rysujemy mechanizm
   tablica(it,:) = GenWartoscMonitor(m,i); %pobieramy warto�ci do monitor�w
   it = it+1; %kolejna iteracja
   pause(krok);
end
monitory = tablica; %zwraca do tablicy monitor�w ostateczne warto�ci
end


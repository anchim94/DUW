function [monitory] = ADAMS(mechanizm,czas_koncowy,krok,bad_czl,bad_pun)
%ADAMS Funkcja rozwi¹zuje zadanie na po³o¿enia, prêdkoœci i przyspieszenia
%ARGUMENTY FUNKCJI:
%mechanizm      --- struktura mechanizmu
%czas_koncowy   --- czas koncowy ruchu
%krok           --- d³ugoœæ kroku czasowego
%bad_czl        --- nazwa badanego cz³onu
%bad_pun        --- nazwa badanego punktu

m = mechanizm;
%dodawanie monitorów 
%TYPY MONITORÓW:
%TYP 'Y'    - pobiera wspó³rzêdn¹ Y punktu
%TYP 'VX'   - pobiera prêdkoœæ punktu na kierunku X 
%TYP 'VY'   - pobiera prêdkoœæ punktu na kierunku Y 
%TYP 'AX'   - pobiera przyspieszenie punktu na kierunku X 
%TYP 'AY'   - pobiera przyspieszenie punktu na kierunku Y 
%TYP 'PHI'  - pobiera k¹t po³o¿enia cz³onu
%TYP 'PHI1' - pobiera prêdkoœæ k¹tow¹ cz³onu
%TYP 'PHI2' - pobiera przyspieszenie k¹towe cz³onu

m = DodajMonitor(m,'X',bad_czl,bad_pun); 
m = DodajMonitor(m,'Y',bad_czl,bad_pun);
m = DodajMonitor(m,'VX',bad_czl,bad_pun); 
m = DodajMonitor(m,'VY',bad_czl,bad_pun);
m = DodajMonitor(m,'AX',bad_czl,bad_pun); 
m = DodajMonitor(m,'AY',bad_czl,bad_pun);

RysujMechanizm(m);
xlim([-1 4])
ylim([-4 2])
tablica = zeros(length(0:krok:czas_koncowy),m.liczbamonitorow+1); %tablica przechowuj¹ca dane z monitorów
it = 1;
mechanizm.pred = zeros(mechanizm.wiezyilosc,1); %wartoœci pocz¹tkowe wektora prêdkosci
mechanizm.przysp = zeros(mechanizm.wiezyilosc,1); %wartoœci pocz¹tkowe wektora przyspieszeñ
for i=0:krok:czas_koncowy
    %nadanie po³o¿enia startowego do metody NR
   Q = QzMechanizmu(m);
   Q = Q + mechanizm.pred * krok + 0.5*mechanizm.przysp*krok*krok; 
   m = QdoMechanizmu(m,Q);
   %rozwi¹zujemy krok za pomoc¹ metody NR
   m = NRaphson(m,i); 
   %rozwi¹zujemy zadanie na prêdkoœci
   m = zadpred(m,i);
   %rozwi¹zujemy zadanie na przyspieszenia
   m = zadprzysp(m,i);
   clf;
   RysujMechanizm(m); %rysujemy mechanizm
   tablica(it,:) = GenWartoscMonitor(m,i); %pobieramy wartoœci do monitorów
   it = it+1; %kolejna iteracja
   pause(krok);
end
monitory = tablica; %zwraca do tablicy monitorów ostateczne wartoœci
end


function [res] = NRaphson(mechanizm,t)
%NRaphson Funkcja oblicza za pomoc¹ metody NewtonaRaphsona przemieszczenie
%mechanizmu
%ARGUMENTY FUNKCJI:
%mechanizm  --- struktura mechanizm
%t          --- czas 

m = mechanizm; 
max_it = 30; %ograniczenie liczby iteracji
eps = 1e-9; %dok³adnoœæ wyniku - warunek STOP
for i=1:max_it
   P = GenRownanieWiezow(m,t); %generowanie równañ wiêzów
   Q = QzMechanizmu(m); %pobieramy wspó³rzêdne cz³onów
   if norm(P)<eps %warunek STOP
       break;
   end
   J = GenJakobi(m,t); %generowanie macierzy Jacobiego
   dQ = J\P; 
   Q = Q - dQ; %nowe wspó³rzêdne punktów (wzór za metod¹ NR)
   m = QdoMechanizmu(m,Q); %aktualizacja wspó³rzêdnych cz³onów
end
if i == max_it %gdy brak zbie¿noœci przyjmuje ostateczny wynik za dobry
   disp('Brak zbieznosci');
   res = mechanizm;
   return;
end
res = m;
end


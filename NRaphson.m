function [res] = NRaphson(mechanizm,t)
%NRaphson Funkcja oblicza za pomoc� metody NewtonaRaphsona przemieszczenie
%mechanizmu
%ARGUMENTY FUNKCJI:
%mechanizm  --- struktura mechanizm
%t          --- czas 

m = mechanizm; 
max_it = 30; %ograniczenie liczby iteracji
eps = 1e-9; %dok�adno�� wyniku - warunek STOP
for i=1:max_it
   P = GenRownanieWiezow(m,t); %generowanie r�wna� wi�z�w
   Q = QzMechanizmu(m); %pobieramy wsp�rz�dne cz�on�w
   if norm(P)<eps %warunek STOP
       break;
   end
   J = GenJakobi(m,t); %generowanie macierzy Jacobiego
   dQ = J\P; 
   Q = Q - dQ; %nowe wsp�rz�dne punkt�w (wz�r za metod� NR)
   m = QdoMechanizmu(m,Q); %aktualizacja wsp�rz�dnych cz�on�w
end
if i == max_it %gdy brak zbie�no�ci przyjmuje ostateczny wynik za dobry
   disp('Brak zbieznosci');
   res = mechanizm;
   return;
end
res = m;
end


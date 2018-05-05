function [jakobit] = GenJakobiT(mechanizm,t)
%GenJakobiT Funkcja zwracaj¹ca wektor ró¿niczkowania wiêzów przez t dla mechanizmu (jego stan
%przechowywany jest w samej strukturze mechanizmu)
%ARGUMENTY FUNKCJI:
%mechanizm  --- struktura mechanizm
%t          --- czas 

jakobit = zeros(mechanizm.wiezyilosc,1);%wielkoœæ macierzy zale¿y od iloœæ równañ wiêzów
for i=1:length(mechanizm.wiezy)
    jakobit = AddWartoscJakobiT(jakobit,mechanizm,mechanizm.wiezy(i),t);
    %funkcja AddWartoscJacobi zwraca odpowiednie wartoœci do macierzy
    %Jacobiego
end
end

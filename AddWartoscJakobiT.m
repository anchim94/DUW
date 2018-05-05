function [wynik] = AddWartoscJakobiT(wektor,mechanizm,wiez,t)
%AddWartoscJakobi Funkcja generująca wartość fragmentu macierzy Jakobiego dla danego więzu.
%ARGUMENTY FUNKCJI:
%wektor    --- wynikowy wektor różniczkowania
%mechanizm  --- struktura mechanizm
%wiez       --- wiez dla którego generowane jest równanie
%t          --- czas

wynik = wektor; %wynikowa macierz przyjmuje wartość początkową

%TYP PRZEMIESZCZENIE
if strcmp(wiez.typ,'przemieszczenie')
    %dodawanie elementów wektora różniczkowania przez t
    id=wiez.funid;%numer id funkcji kierującej
    wynik(wiez.id+1,1) = - mechanizm.a(id) * mechanizm.om(id) * cos(mechanizm.om(id)*(t)+mechanizm.phi(id));
    return;
end
end

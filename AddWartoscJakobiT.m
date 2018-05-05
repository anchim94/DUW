function [wynik] = AddWartoscJakobiT(wektor,mechanizm,wiez,t)
%AddWartoscJakobi Funkcja generuj�ca warto�� fragmentu macierzy Jakobiego dla danego wi�zu.
%ARGUMENTY FUNKCJI:
%wektor    --- wynikowy wektor r�niczkowania
%mechanizm  --- struktura mechanizm
%wiez       --- wiez dla kt�rego generowane jest r�wnanie
%t          --- czas

wynik = wektor; %wynikowa macierz przyjmuje warto�� pocz�tkow�

%TYP PRZEMIESZCZENIE
if strcmp(wiez.typ,'przemieszczenie')
    %dodawanie element�w wektora r�niczkowania przez t
    id=wiez.funid;%numer id funkcji kieruj�cej
    wynik(wiez.id+1,1) = - mechanizm.a(id) * mechanizm.om(id) * cos(mechanizm.om(id)*(t+0.01)+mechanizm.phi(id));
    return;
end
end
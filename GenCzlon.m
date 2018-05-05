function [czlon] = GenCzlon(nazwa,srodek,punkty,data,id)
%GenCzlon Funkcja generuj�ca struktur� opisuj�c� cz�on mechanizmu w oparciu
%o ci�g puntk�w opisuj�cych go. Dla uproszczenia przekazywane sa tablice ze
%zbiorem wszyskich puntkow startowych - do ulatwienia przeliczania

%srodek w absolutnych
czlon.id = id;
czlon.nazwa = nazwa;
czlon.srodek = FindPoint(srodek,data);
czlon.kat = 0;
czlon.kolor = rand(1,3);
for i=1:length(punkty)
    p = FindPoint(punkty(i),data);
    p.q = p.q - czlon.srodek.q;
    lancuch(i) = p;
end
czlon.lancuch = lancuch;
end


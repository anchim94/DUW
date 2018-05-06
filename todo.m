%PROCEDURA ROZWI�ZYWANIA PROBLEMU
%Problem generowany jest za pomoc� funkcji GenerujProblem()
%Potem rozwi�zuje zadanie kinematyki i wy�wietla animacje problemu
%Zaznacza trajektori� badanego punktu

mech = GenerujProblem(); %generowanie problemu
czas = 2;
krok = 0.01; 
badany_czlon = 'CZL3';
badany_punkt = 'K'; %punkt musi nale�e� do cz�onu
%rozwi�zywanie zadania 
wyniki = ADAMS(mech,czas,krok,'CZL3','K');
hold on;
plot(wyniki(:,2),wyniki(:,3)); %rysowanie wyniku
hold off;
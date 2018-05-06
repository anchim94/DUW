%PROCEDURA ROZWI¥ZYWANIA PROBLEMU
%Problem generowany jest za pomoc¹ funkcji GenerujProblem()
%Potem rozwi¹zuje zadanie kinematyki i wyœwietla animacje problemu
%Zaznacza trajektoriê badanego punktu

mech = GenerujProblem(); %generowanie problemu
czas = 2;
krok = 0.01; 
badany_czlon = 'CZL3';
badany_punkt = 'K'; %punkt musi nale¿eæ do cz³onu
%rozwi¹zywanie zadania 
wyniki = ADAMS(mech,czas,krok,'CZL3','K');
hold on;
plot(wyniki(:,2),wyniki(:,3)); %rysowanie wyniku
hold off;
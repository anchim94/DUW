function [mechanizm] = GenerujTestProblem()
%GenerujProblem Funkcja generuj�ca z danych wyjsciowych elementy do
%analizy w oparciu o og�lny rysunek problemu. Wykorzystuje og�lne podej�cie
%do rozwi�zywania problem�w 2D

%generowanie punkt�w mechanizmu przy pomocy funkcji GenPun(nazwa,x,y)
%tablica punkty przechowuje list� punkt�w mechanizmu
%punkty = [GenPun('A',0.0,0.0);GenPun('B',0.0,1.0);GenPun('C',4.0,4.0);GenPun('D',5.0,4.0);
 %   GenPun('c1',0.0,0.0);GenPun('c2',0.0,1.0);GenPun('c3',4.0,4.0)];
punkty = [GenPun('A',0.0,0.0);GenPun('B',-1.0,0.0);GenPun('C',2.0,4.0);GenPun('D',5.0,4.0);
    GenPun('c1',0.0,0.0);GenPun('c2',-1.0,0);GenPun('c3',2.0,4.0)];

%generowanie cz�on�w mechanizmu przy pomocy funkcji GenCzlon(nazwa,srodek,punkty,data,id)
%tablica czlony przechowuje list� punkt�w mechanizmu
%mechanizm.czlony = [GenCzlon('CZL1','c1',pi/2,['A','B'],punkty,0);
%GenCzlon('CZL2','c2',atan(3/4),['B','C'],punkty,1);GenCzlon('CZL3','c3',0,['C'],punkty,2);
%GenCzlon('CZL0','A',0,['D'],punkty,3)];
mechanizm.czlony = [GenCzlon('CZL1','c1',pi,['A','B'],punkty,0);
GenCzlon('CZL2','c2',atan(4/3),['B','C'],punkty,1);GenCzlon('CZL3','c3',0,['C'],punkty,2);
GenCzlon('CZL0','A',0,['D'],punkty,3)];

%definicja funkcji opisuj�cych przemieszczenie si�ownik�w
f = @(t) t^2 + (pi/2);
f1 = @(t) 2*t;
f2 = @(t) -2;
%zapisywanie danych funkcji kieruj�cej do struktury mechanizmu
mechanizm.f1 = f1;
mechanizm.f2 = f2;

%definiowanie r�wna� wi�z�w przy pomocy funkcji DodajWiez(mechanizm,typ,ob1,punkt1,ob2,punkt2,funkcja)
mechanizm.wiezyilosc = 0;
mechanizm.liczbamonitorow = 0;

mechanizm = DodajWiez(mechanizm,'mocowanie','CZL1','A','','',@(t)0,0);
mechanizm = DodajWiez(mechanizm,'obrotowa','CZL1','B','CZL2','B',@(t)0,0);
mechanizm = DodajWiez(mechanizm,'obrotowa','CZL2','C','CZL3','C',@(t)0,0);
mechanizm = DodajWiez(mechanizm,'postepowa','CZL3','C','CZL0','D',@(t)0,0);
mechanizm = DodajWiez(mechanizm,'obrot','CZL1','A','CZL0','A',f,0);


end


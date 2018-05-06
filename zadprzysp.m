function [m] = zadprzysp(mechanizm,t)
%zadprzysp Funkcja rozwi�zuj�ca zadanie na przyspieszenia

m=mechanizm;

J=GenJakobi(m,t); %macierz Jacobiego
G=GenGamma(m,t); %wektor zr�niczkowanychx2 po czasie lewych stron r-na� wi�z�w

m.przysp = J\G; %rozwi�zywanie zadania - przekazanie wynik�w do wektora przyspiesze�

end

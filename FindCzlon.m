function [czlon] = FindCzlon(nazwa,zrodlo)
%FindCzlon Znajduje czlon w mechanizmie po nazwie
for i =1:length(zrodlo)
    if strcmp(zrodlo(i).nazwa, nazwa)
        czlon = zrodlo(i);
        return
    end
end
Disp('Nie znaleziono poszukiwanego czlonu');
end


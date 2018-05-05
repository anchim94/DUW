function [point] = FindPoint(nazwa,zrodlo)
%FindPoint Wyszukuje wsrod tablicy punktow punktu o podanej nazwie
for i =1:length(zrodlo)
    if strcmp(zrodlo(i).nazwa,nazwa)
        point = zrodlo(i);
        return
    end
end
Disp('Nie znaleziono poszukiwanego punktu');
end


function [point] = GenPun(nazwa,x,y)
%GenPun Funkcja generuj�ca struktur� opisuj�c� punkt w dowolnym uk�adzie
point = struct('nazwa',nazwa,'q',[x;y]);
end


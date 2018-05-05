function [point] = GenPun(nazwa,x,y)
%GenPun Funkcja generuj¹ca strukturê opisuj¹c¹ punkt w dowolnym uk³adzie
point = struct('nazwa',nazwa,'q',[x;y]);
end


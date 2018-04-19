function [result] = GenRownanieWiezow(mechanizm,t)
%SprWiezow Funkcja zwracaj�ca r�wno�� wi�z�w nadanych na uk�adzie
n = length(mechanizm.czlony);
result = zeros(3*n,1);
for i=1:length(mechanizm.wiezy)
    result = AddWartoscWiezu(result,mechanizm,mechanizm.wiezy(i),t);
end
end
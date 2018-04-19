function [result] = GenRownanieWiezow(mechanizm,t)
%SprWiezow Funkcja zwracaj¹ca równoœæ wiêzów nadanych na uk³adzie
n = length(mechanizm.czlony);
result = zeros(3*n,1);
for i=1:length(mechanizm.wiezy)
    result = AddWartoscWiezu(result,mechanizm,mechanizm.wiezy(i),t);
end
end
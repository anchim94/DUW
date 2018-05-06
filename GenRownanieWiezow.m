function [result] = GenRownanieWiezow(mechanizm,t)
%GenRownanieWiezow Funkcja zwracaj¹ca równoœæ wiêzów nadanych na uk³adzie
%ARGUMENTY FUNKCJI:
%mechanizm  --- struktura mechanizm
%t          --- czas 

result = zeros(mechanizm.wiezyilosc,1);
for i=1:length(mechanizm.wiezy)
    result = AddWartoscWiezu(result,mechanizm,mechanizm.wiezy(i),t);
    %funkcja AddWartoscWiezu zwraca odpowiednie wartoœci wiêzów
end
end
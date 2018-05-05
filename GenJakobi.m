function [jakobi] = GenJakobi(mechanizm,t)
%GenJakobi Funkcja zwracaj¹ca macierz jakobiego dla mechanizmu (jego stan
%przechowywany jest w samej strukturze mechanizmu

jakobi = zeros(mechanizm.wiezyilosc);
for i=1:length(mechanizm.wiezy)
    jakobi = AddWartoscJakobi(jakobi,mechanizm,mechanizm.wiezy(i),t);
end
end


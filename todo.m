mech = GenerujProblem(); %generowanie problemu
wyniki = ADAMS(mech,10,0.05); %rozwi¹zywanie zadañ
hold on;
plot(wyniki(:,2),wyniki(:,3)); %rysowanie wyniku
hold off;
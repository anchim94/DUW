mech = GenerujProblem(); %generowanie problemu
czas = 2;
krok = 0.01;
wyniki = ADAMS(mech,czas,krok); %rozwi�zywanie zada�
hold on;
plot(wyniki(:,2),wyniki(:,3)); %rysowanie wyniku
hold off;
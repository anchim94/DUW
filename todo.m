mech = GenerujProblem(); %generowanie problemu
wyniki = ADAMS(mech,10,0.05); %rozwi�zywanie zada�
hold on;
plot(wyniki(:,2),wyniki(:,3)); %rysowanie wyniku
hold off;
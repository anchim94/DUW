mech = GenerujTestProblem(); %generowanie problemu
czas = 1.5;
krok = 0.05;
t=sqrt(pi/2);
RysujMechanizm(mech); hold on; axis([-1 5 -1 5]);
mech.pred = zeros(mech.wiezyilosc,1);
mech.pred(3,1)= sqrt(2*pi);
mech.pred(5,1)= - sqrt(2*pi);
mech.pred(6,1)= sqrt(2*pi)/3;
mech.pred(7,1)= -(4*sqrt(2*pi)/3);
%mechanizm.przysp = zeros(mechanizm.wiezyilosc,1);
J=GenJakobi(mech,t);
T=GenJakobiT(mech,t);
G=GenGamma(mech,t);
P = GenRownanieWiezow(mech,t);
wynikitest = ADAMS(mech,czas,krok);

%wyniki = ADAMS(mech,czas,krok); %rozwi¹zywanie zadañ
%hold on;
%plot(wyniki(:,2),wyniki(:,3)); %rysowanie wyniku
%hold off;
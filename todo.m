mech = GenerujProblem();
wyniki = ADAMS(mech,10,0.05);
hold on;
plot(wyniki(:,2),wyniki(:,3));
hold off;
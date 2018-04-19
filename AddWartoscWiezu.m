function [result] = AddWartoscWiezu(wektor,mechanizm,wiez,t)
%WartoscWiezu Oblicza wartosc wiezu, do rozwiazywania ukladu rownan za
%pomoca Newtona-Rapsona, t to czas

result = wektor;
if strcmp(wiez.typ, 'obrotowa')
    C1 = FindCzlon(wiez.OA,mechanizm.czlony);
    P1 = FindPoint(wiez.PA,C1.lancuch);
    C2 = FindCzlon(wiez.OB,mechanizm.czlony);
    P2 = FindPoint(wiez.PB,C2.lancuch);
    result([wiez.id+1 wiez.id+2],1) = C1.srodek.q+R(C1.kat)*P1.q-C2.srodek.q-R(C2.kat)*P2.q;
    return;
end
if strcmp(wiez.typ, 'postepowa')
    C1 = FindCzlon(wiez.OA,mechanizm.czlony);
    P1 = FindPoint(wiez.PA,C1.lancuch);
    C2 = FindCzlon(wiez.OB,mechanizm.czlony);
    P2 = FindPoint(wiez.PB,C2.lancuch);
    f = wiez.fun(t);
    v = f(2:3,1);
    result(wiez.id+1,1) = (R(C2.kat)*v)'*(C2.srodek.q-C1.srodek.q - R(C1.kat)*P1.q)+v'*P2.q;
    result(wiez.id+2,1) = C1.kat - C2.kat - f(1);
    return;
end
if strcmp(wiez.typ, 'mocowanie')
    C1 = FindCzlon(wiez.OA,mechanizm.czlony);
    P1 = FindPoint(wiez.PA,C1.lancuch);
    prev = wiez.fun(t);
    result([wiez.id+1 wiez.id+2],1) = C1.srodek.q+R(C1.kat)*P1.q - prev;
    return;
end
if strcmp(wiez.typ,'przemieszczenie')
    C1 = FindCzlon(wiez.OA,mechanizm.czlony);
    P1 = FindPoint(wiez.PA,C1.lancuch);
    C2 = FindCzlon(wiez.OB,mechanizm.czlony);
    P2 = FindPoint(wiez.PB,C2.lancuch);
    f = wiez.fun(t);
    u = f(2:3,1);
    result(wiez.id+1,1) = (R(C2.kat)*u)'*(C2.srodek.q+R(C2.kat)*P2.q-C1.srodek.q-R(C1.kat)*P1.q)-f(1);
    return;
end
disp('Nieznany rodzaj wiezow');
end


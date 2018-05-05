function [wynik] = AddWartoscJakobi(macierz,mechanizm,wiez,t)
%WartoscJakobi Funkcja generuj¹ca wartoœæ fragmentu macierzy Jakobiego dla
%danego wiêzu.
wynik = macierz;
omega = [0,-1;1,0];
if strcmp(wiez.typ, 'obrotowa')
    C1 = FindCzlon(wiez.OA,mechanizm.czlony);
    P1 = FindPoint(wiez.PA,C1.lancuch);
    C2 = FindCzlon(wiez.OB,mechanizm.czlony);
    P2 = FindPoint(wiez.PB,C2.lancuch);
    wynik([wiez.id+1 wiez.id+2],[C1.id*3+1 C1.id*3+2]) = eye(2);
    wynik([wiez.id+1 wiez.id+2],C1.id*3+3) = omega*R(C1.kat)*P1.q;
    wynik([wiez.id+1 wiez.id+2],[C2.id*3+1 C2.id*3+2]) = -eye(2);
    wynik([wiez.id+1 wiez.id+2],C2.id*3+3) = -omega*R(C2.kat)*P2.q;
    return;
end
if strcmp(wiez.typ, 'postepowa')
    C1 = FindCzlon(wiez.OA,mechanizm.czlony);
    P1 = FindPoint(wiez.PA,C1.lancuch);
    C2 = FindCzlon(wiez.OB,mechanizm.czlony);
    P2 = FindPoint(wiez.PB,C2.lancuch);
    f = wiez.fun(t);
    v = f(2:3,1);
    wynik(wiez.id+1,[C1.id*3+1 C1.id*3+2]) = -(R(C2.kat)*v)';
    wynik(wiez.id+1,C1.id*3+3) = -(R(C2.kat)*v)'*omega*R(C1.kat)*P1.q;
    
    wynik(wiez.id+1,[C2.id*3+1 C2.id*3+2]) = (R(C2.kat)*v)';
    wynik(wiez.id+1,C2.id*3+3) = -(R(C2.kat)*v)'*omega*(C2.srodek.q-C1.srodek.q - R(C1.kat)*P1.q);
    
    wynik(wiez.id+2,[C1.id*3+3 C2.id*3+3]) = [1, -1];
    return;
end
if strcmp(wiez.typ, 'mocowanie')
    C1 = FindCzlon(wiez.OA,mechanizm.czlony);
    P1 = FindPoint(wiez.PA,C1.lancuch);
    wynik([wiez.id+1 wiez.id+2],[C1.id*3+1 C1.id*3+2]) = eye(2);
    wynik([wiez.id+1 wiez.id+2],C1.id*3+3) = omega*R(C1.kat)*P1.q;
    return;
end
if strcmp(wiez.typ,'przemieszczenie')
    C1 = FindCzlon(wiez.OA,mechanizm.czlony);
    P1 = FindPoint(wiez.PA,C1.lancuch);
    C2 = FindCzlon(wiez.OB,mechanizm.czlony);
    P2 = FindPoint(wiez.PB,C2.lancuch);
    f = wiez.fun(t);
    u = f(2:3,1);
    wynik(wiez.id+1,[C1.id*3+1 C1.id*3+2]) = -(R(C2.kat)*u)';
    wynik(wiez.id+1,C1.id*3+3) = -(R(C2.kat)*u)'*omega*R(C1.kat)*P1.q;
    
    wynik(wiez.id+1,[C2.id*3+1 C2.id*3+2]) = (R(C2.kat)*u)';
    wynik(wiez.id+1,C2.id*3+3) = -(R(C2.kat)*u)'*omega*(C2.srodek.q-C1.srodek.q - R(C1.kat)*P1.q);
    return;
end
disp('Nieznany rodzaj wiezow');
end


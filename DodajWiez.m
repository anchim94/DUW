function [mechanizm] = DodajWiez(mechanizm,typ,ob1,punkt1,ob2,punkt2,funkcja)
%GenWiez Funkcja generuj¹ca wiêz do obslugi po³¹cznienia pomiêdzy dwoma
%obiektami-czlonami (ob_) oraz punktami do nich nale¿¹cych (punkt_).
%Id opisuje miejsce w ukladzie rownañ oraz macierzy jakobiego, a funkcja to
%opis do specyficznych wiezow okreslanych w czasie.
n = mechanizm.wiezyilosc;
if mechanizm.wiezyilosc == 0
    i=1;
else
    i = length(mechanizm.wiezy)+1;
end

if strcmp(typ,'obrotowa')
    wiez = struct('typ',typ,'OA',ob1,'PA',punkt1,'OB',ob2,'PB',punkt2,'fun',funkcja,'id',n);
    mechanizm.wiezyilosc = mechanizm.wiezyilosc+2;
end
if strcmp(typ,'postepowa')
    C1 = FindCzlon(ob1,mechanizm.czlony);
    P1 = FindPoint(punkt1,C1.lancuch);
    C2 = FindCzlon(ob2,mechanizm.czlony);
    P2 = FindPoint(punkt2,C2.lancuch);
    d = C1.srodek.q+R(C1.kat)*P1.q-C2.srodek.q-R(C2.kat)*P2.q;
    %wyznaczenie v(j) -> j czyli drugi uk³ad, zwi¹zany z C2
    v = [0,-1;1,0]*inv(R(C2.kat))*d;
    F = @(t)[C1.kat-C2.kat;v];
    wiez = struct('typ',typ,'OA',ob1,'PA',punkt1,'OB',ob2,'PB',punkt2,'fun',F,'id',n);
    mechanizm.wiezyilosc = mechanizm.wiezyilosc+2;
end
if strcmp(typ,'mocowanie')
    C1 = FindCzlon(ob1,mechanizm.czlony);
    P1 = FindPoint(punkt1,C1.lancuch);
    F = @(t)C1.srodek.q+R(C1.kat)*P1.q;
    wiez = struct('typ',typ,'OA',ob1,'PA',punkt1,'OB',ob2,'PB',punkt2,'fun',F,'id',n);
    mechanizm.wiezyilosc = mechanizm.wiezyilosc+2;
end
if strcmp(typ,'przemieszczenie')
    C1 = FindCzlon(ob1,mechanizm.czlony);
    P1 = FindPoint(punkt1,C1.lancuch);
    C2 = FindCzlon(ob2,mechanizm.czlony);
    P2 = FindPoint(punkt2,C2.lancuch);
    d = C1.srodek.q+R(C1.kat)*P1.q-C2.srodek.q-R(C2.kat)*P2.q;
    %wyznaczenie v(j) -> j czyli drugi uk³ad, zwi¹zany z C2
    u = inv(R(C2.kat))*d;
    u = u/norm(u);
    F = @(t)[funkcja(t);u];
    wiez = struct('typ',typ,'OA',ob1,'PA',punkt1,'OB',ob2,'PB',punkt2,'fun',F,'id',n);
    mechanizm.wiezyilosc = mechanizm.wiezyilosc+1;
end

mechanizm.wiezy(i,1) = wiez;

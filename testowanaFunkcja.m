function [f]=testowanaFunkcja(nr_funkcji, X,Y)

switch nr_funkcji
    case 1
      f= gauss2DD(X,Y);
    case 2
      f= 1 - abs(Y);
%       f=-(0.5+((sin(X.^2).*sin(X.^2))-0.5)./((1+0.01*(X.^2)).^2));
    case 3
      f=(exp(-X.^2 - Y.^2)).*X ;
%       sin(5x)*cos(5y)/5
    case 4
      a = 0.005;
      f = sin((X.^2+Y.^2).*a)./a
    case 5
        f = ((sin(X.*0.1)).*(cos(Y.*0.1)))./0.1
    case 6
%         f=sin(10(x^2+y^2))/10

end


end

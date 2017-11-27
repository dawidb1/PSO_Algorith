function [f]=testowanaFunkcja(nr_funkcji, X,Y)

switch nr_funkcji
    case 1
      f=0.5+((sin(X.^2).*sin(X.^2))-0.5)./((1+0.01*(X.^2)).^2);
    case 2
      f=-(0.5+((sin(X.^2).*sin(X.^2))-0.5)./((1+0.01*(X.^2)).^2));
    case 3
      f=sin(0.3*X);
    case 4
      f=X*0.4; %X-X+0.4;
    case 5
        %f=fspecial('gaussian',xSize,20);
        f= gauss2DD(X,Y);
%         [hsize z] = size(X(:,1));
%         f=fspecial('gaussian',hsize,2);
end


end

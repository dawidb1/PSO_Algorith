%% Parametry
% v- wektor predkosci
% x- po�o�enie cz�steczki
% gbest - globalnie najlepsze po�o�enie
% contp - po�o�enie w chwili czasowej wszystkich cz�stek
% contv - warto�� w chwili czasowej wektora pr�dko�ci

%% Schemat algorytmu
% 1. wylosowanie wektora po�o�e� cz�stek mi�dzy granicznymi warto�ciami po�o�e�
% 2. wylosowanie wektora pr�dko�ci cz�stek mi�dzy granicznymi warto�ciami
% pr�dko�ci
% 3. Wyznaczenie warto�ci funkcji w punktach po�o�e� cz�stek
% 4. wyznacznie najmmniejszej warto�ci funkcji oraz po�o�enia tej warto�ci
% 5. Wyb�r najlepszej cz�steczki lokalnie - w pokoleniu - zapisujemy
% warto�� i po�o�enie
% 6. Wyb�r najlepszej cz�steczki globalnie - por�wnanie wynik�w mi�dzy
% pokoleniami
% 7. Modyfikacja wektora pr�dko�ci po ka�dym pokoleniu
% 8. Modyfikacja po�o�enia o nowy wektor pr�dko�ci
% 9. Wy�wietlenie wyniku
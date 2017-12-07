clear
close all
clc

% wyszukiwanie minimum i maksimum dodaæ
%% Deklaracja agentow
NUMBER_OF_AGENTS=20;%input('Podaj liczbe agentow: ');
ITERATIONS=50;%input('Podaj liczbe iteracji: ');
XMIN=-20;%input('Podaj dolny zakres x: ');
XMAX=30;%input('Podaj gorny zakres x: ');

YMIN=XMIN; %ja
YMAX=XMAX;

VMAX=0.1;%input('Podaj maksymalna poczatkowa predkosc: ');
WHICH_FUNCTION=3;   % 1 - funkcja z 1 minimum globalnym;
                % 2 - funkcja z 2 minimami globalnymi;
                % 3 - funkcja okresowa;
                % 4 - funkcja bez minimum;
                
C1=0.003;   % wp³yw lokalnego wyszukiwania ka¿dej cz¹steczki
C2=0.3;     % wp³yw globalnego wyszukiwania najlepszej wartoœci
W=0.2;      % wp³yw dotychczasowego wektora prêdkoœci na nowy wektor
DIMENTION = 2;
%bestPosition - najlepsze polozenie lokalnie czastki
%bestValue - najlepsza warotsc fitowania lokalnie dla czastki

%% Wyswietlanie wykresu analizowanej funkcji
figure
xStart=XMIN-round(0.3*(XMAX-XMIN));
xStop=XMAX+round(0.3*(XMAX-XMIN));
yStart=xStart;
yStop=xStop;

functionSamples = (xStop-xStart)*2;
xToShow=linspace(xStart, xStop, functionSamples);
xToShow=repmat(xToShow,functionSamples,1);
yToShow=xToShow';

fToShow=testowanaFunkcja(WHICH_FUNCTION, xToShow, yToShow);
surf(xToShow,yToShow,fToShow);
xlabel('X axes');
ylabel('Y axes');
view(45,45);

%% Inicjalizacja
e=exp(1);
VMIN=-VMAX;

% po³o¿enie cz¹steczek:
xPosition=XMIN+(XMAX-XMIN).*rand(NUMBER_OF_AGENTS,1);
yPosition=YMIN+(YMAX-YMIN).*rand(NUMBER_OF_AGENTS,1);

%particlePosition=[xPosition yPosition];

% wektory prêdkoœci dla cz¹steczek
speedXAxis=VMIN+(VMAX-VMIN).*rand(NUMBER_OF_AGENTS,1);
speedYAxis=VMIN+(VMAX-VMIN).*rand(NUMBER_OF_AGENTS,1);

%speed=[speedXAxis speedYAxis];

% wyœwietlenie analizowanej funkcji
particleValue=testowanaFunkcja(WHICH_FUNCTION, xPosition,yPosition);

%scatter3(xPosition,yPosition,particleValue,70,'r','filled');

bestValue=particleValue; 
bestPosition=[xPosition yPosition];

[maxValue,whichParticle, bla]=minind(particleValue);
%fgbest=min(f);
globalBestValue=maxValue;
globalBestPosition=[xPosition(whichParticle) yPosition(whichParticle)];
 %contp=zeros(ITERATIONS,NUMBER_OF_AGENTS); - chyba nie potrzebuje
 %contv=contp;
 scatters = zeros(1,ITERATIONS);
 
for t=1:ITERATIONS
    %fitowanie
    particleValue=testowanaFunkcja(WHICH_FUNCTION, xPosition,yPosition);
    hold on
    scatters(t) = scatter3(xPosition,yPosition,particleValue,70,'r','filled');
    %najlepsza lokalnie
    for i=1:NUMBER_OF_AGENTS
        if particleValue(i) < bestValue(i)
            bestValue(i)=particleValue(i);
            bestPosition(1,:)=[xPosition(i) yPosition(i)];
        end
    end
    
    %najlepsza globalnie
    [maxValue,whichParticle,bla]=minind(particleValue);
    if maxValue > globalBestValue
        globalBestValue=maxValue;
        globalBestPosition= [xPosition(whichParticle) yPosition(whichParticle)];
    end
    %modyfikacja v
    xLocal=C1*rand(1,1)*(bestPosition(:,1)-xPosition);
    yLocal=C1*rand(1,1)*(bestPosition(:,2)-yPosition);
        
    xGlob=C2*rand(1,1)*(globalBestPosition(:,1)-xPosition);  
    yGlob=C2*rand(1,1)*(globalBestPosition(:,2)-yPosition); 
    
    speedXAxis=speedXAxis*(W)+xLocal+xGlob;
    speedYAxis=speedYAxis*(W)+yLocal+yGlob;

    %modyfikacja x    
    xPosition = xPosition+speedXAxis;
    yPosition = yPosition+speedYAxis;
    % contp(t,:)=particlePosition;
    % contv(t,:)=speed;
    pause(0.1);
    set(scatters(t),'Visible','off')
end
hold on 
scatter3(xPosition,yPosition,particleValue,70,'r','filled');
globalBestValue
particleValue
meanParticleValue = mean(particleValue)
%% Wyswietlanie wyniku
% figure
% particlePosition
% %plot(contp)
% mean=mean(particlePosition)
% %plot(contv)
